import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseController extends GetxController {
  static FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseAuth get fireBaseAuth => auth;

  @override
  void onInit() {
    auth.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    super.onInit();
  }

  Future<UserCredential> createUserWithEmailPassword(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    }
    throw Exception('Account creation failed');
  }

  signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await fireBaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed('/mainScreen');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  deleteUser() {
    fireBaseAuth.currentUser!.delete();
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

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void fcmSubscribe() {
    String uid =fireBaseAuth.currentUser!.uid;
    firebaseMessaging.subscribeToTopic(uid);
    firebaseMessaging.subscribeToTopic('all');
  }

  void fcmUnSubscribe() {
    firebaseMessaging.unsubscribeFromTopic(fireBaseAuth.currentUser!.uid);
    firebaseMessaging.unsubscribeFromTopic('all');
  }

  signOutUser() {
    auth.signOut();
    fcmUnSubscribe();
  }
}
