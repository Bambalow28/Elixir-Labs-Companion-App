import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:meta/meta.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:http/http.dart' as http;

class DiscordOAuth2Client extends OAuth2Client {
  DiscordOAuth2Client(
      {@required String redirectUri, @required String customUriScheme})
      : super(
            authorizeUrl:
                'https://discord.com/api/oauth2/authorize', //Your service's authorization url
            tokenUrl:
                'https://discord.com/api/oauth2/token', //Your service access token url
            redirectUri: redirectUri,
            customUriScheme: customUriScheme);
}

class AuthItem {
  String id;
  String avatar;
  String username;
  String email;
  String role;

  AuthItem({this.avatar, this.id, this.username, this.email});

  factory AuthItem.fromJson(Map<String, dynamic> data) {
    return AuthItem(
      id: data['id'],
      username: data['username'] + '#' + data['discriminator'],
      avatar: data['avatar'],
      email: data['email'],
    );
  }
}

class Auth with ChangeNotifier {
  bool _isAuth = false;
  AuthItem _currentUser;
  bool _isLoading = false;

  bool get isAuth {
    return _isAuth;
  }

  bool get isLoading {
    return _isLoading;
  }

  AuthItem get currentUser {
    return _currentUser;
  }

  Future<void> signIn() async {
    try {
      _isLoading = true;
      notifyListeners();
      var hlp = OAuth2Helper(DiscordOAuth2Client(
        customUriScheme:
            'myelixirapp/', //Must correspond to the AndroidManifest's "android:scheme" attribute
        redirectUri: 'myelixirapp://oauth2redirect', //uni_links package on how
      ));

      await hlp.setAuthorizationParams(
          grantType: OAuth2Helper.AUTHORIZATION_CODE,
          clientId: '799140079494496276',
          clientSecret: 'u2JqZrGuTbj8W7epNV7b4sv_iKfZMH5H',
          scopes: ['email', 'identify', 'guilds', 'guilds.join	']);
      var resp = await hlp.get('https://discordapp.com/api/v6/users/@me');
      AuthItem data = await AuthItem.fromJson(jsonDecode(resp.body));
      var usersRoles = await http.get(
          'https://api.elixirlabs.xyz/discord_oauth?req=get_roles&id=${data.id}');
      var roles = jsonDecode(usersRoles.body);
      var isExist = roles.firstWhere(
          (data) => data['name'].toString().toUpperCase() == 'STAFF');
      if (isExist != null) {
        _currentUser = data;
        _currentUser.role = 'staff';
        _isAuth = true;
      } else {
        var isExist = roles.firstWhere(
            (data) => data['name'].toString().toUpperCase() == 'MEMBER');
        if (isExist != null) {
          _currentUser = data;
          _currentUser.role = 'member';
          _isAuth = true;
        } else {
          _isAuth = false;
        }
      }

      _isLoading = false;
      print(_currentUser);
      notifyListeners();
    } catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();
    }
  }
}
