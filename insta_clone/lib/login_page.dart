import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instaclone/tab_page.dart';

class LoginPage extends StatelessWidget {
  // 구글 인증을 위한 객체 생성
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // 파이어 베이스 사용을 위한 인증 객체 생성
  final FirebaseAuth _auth = FirebaseAuth.instance; // Singleton Instance...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Instagram Clone',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(50.0)),
            SignInButton(
              Buttons.Google, 
              text: "Sign up with Google",
              onPressed: (){
                _handleSignIn().then((user){
                  print(user);
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken, 
      accessToken: googleAuth.accessToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

    return user;
  }
}