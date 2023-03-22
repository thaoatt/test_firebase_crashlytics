import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_signal_flutter/app_router.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
              child: MaterialButton(
                onPressed: () async{
                  Navigator.pushNamedAndRemoveUntil(context, AppRouter.DASHBOARD_SCREEN, (route) => false);
                  // await signInWithGoogle().then((value) => print('Login google result: ${value.user}'));
                  // await signInWithGoogle().whenComplete(() =>  print('Login google success'));

                },
                child: Row(
                  children: [Icon(Icons.login), SizedBox(width: 20,), Text('Login with Google')],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
              child: MaterialButton(
                onPressed: () {signInWithFacebook().then((value) => print('Login Facebook result: ${value.user}'));},
                child: Row(
                  children: [Icon(Icons.login), SizedBox(width: 20,),Text('Login with Facebook')],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  children: [Icon(Icons.login),SizedBox(width: 20,), Text('Login with Email')],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
              child: MaterialButton(
                onPressed: () {signInWithTwitter().then((value) => print('Login twitter result: ${value.user}'));},
                child: Row(
                  children: [Icon(Icons.login),SizedBox(width: 20,), Text('Login with Twitter')],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential> signInWithTwitter() async {
  // Create a TwitterLogin instance
  final twitterLogin = TwitterLogin(
      apiKey: '<your consumer key>',
      apiSecretKey:' <your consumer secret>',
      redirectURI: '<your_scheme>://'
  );

  // Trigger the sign-in flow
  final authResult = await twitterLogin.login();

  // Create a credential from the access token
  final twitterAuthCredential = TwitterAuthProvider.credential(
    accessToken: authResult.authToken!,
    secret: authResult.authTokenSecret!,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
}


Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken?.token??'');

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}


