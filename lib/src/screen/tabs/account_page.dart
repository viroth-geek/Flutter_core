import 'dart:convert';

import 'package:core/service/sign_in.dart';
import 'package:core/src/screen/google_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return __AccountState();
  }
}

enum Method {
  google,
  facebook,
  email,
}

class __AccountState extends State<Account> {
  bool isLoggedIn = false;
  var methodLoggedIn;
  var profileData;
  var facebookLogin = FacebookLogin();

  onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  void initiateFacebookLogin() async {
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        methodLoggedIn = Method.facebook;
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}');
        var profile = json.decode(graphResponse.body);
        print("profile ${profile.toString()}");
        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
            child: isLoggedIn && methodLoggedIn == Method.facebook
                ? _displayUserData(profileData)
                : Center(
                    child: Column(
                      children: <Widget>[
                        _displayLoginButton(),
                        _displayGoogleLoginButton()
                      ],
                    ),
                  )),
      ),
    );
  }

  _displayUserData(profileData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                profileData['picture']['data']['url'],
              ),
            ),
          ),
        ),
        SizedBox(height: 28.0),
        Text(
          "Logged in as: ${profileData['name']}",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        _displayLogoutButton(),
      ],
    );
  }

  _displayLoginButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text("Login with Facebook", style: TextStyle(color: Colors.white)),
      onPressed: () => initiateFacebookLogin(),
    );
  }

  _displayGoogleLoginButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text("Login with Google", style: TextStyle(color: Colors.white)),
      onPressed: () {
        signInWithGoogle().catchError((error) {
          print("error $error");
        }).then((onvalue) {
          print("then onvalue $onvalue");
          Navigator.pushNamed(context, "detail");
        }).whenComplete(() {
          MaterialPageRoute(builder: (context) {
            return GoogleDetail();
          });
        });
      },
    );
  }

  _displayLogoutButton() {
    return RaisedButton(
      child: Text("Log out!!"),
      onPressed: _logout,
    );
  }

  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }
}
