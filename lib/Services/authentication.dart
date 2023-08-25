// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, use_build_context_synchronously

import 'package:auth_playground/Shared/exports.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // assigning usermodel to each user
  UserModel? userFromFirebase(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // stream for tracking user auth state
  Stream<UserModel?> get user {
    return auth.authStateChanges().map(userFromFirebase);
  }

  //sign up with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user!;
      //return user.uid;
      return userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //login user with email and password
  Future loginUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // sign out user
  Future signOutUser() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  // sign in with google
  Future signInWithGoogle() async {
    try {
      // interactive signin process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      //create new credenetials for user
      final credential = GoogleAuthProvider.credential(
        idToken: gAuth.idToken,
        accessToken: gAuth.accessToken,
      );

      // sign in with firebase
      return await auth.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // reset password

  Future resetPassword(String email, BuildContext context) async {
    try {
      await auth.sendPasswordResetEmail(email: email.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                'Password reset link has been sent to your email',
                style: styledtext.copyWith(fontSize: 12.sp, color: grey),
              ),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              e.message.toString(),
              style: styledtext.copyWith(fontSize: 12.sp, color: grey),
            ),
          );
        },
      );
    }
  }
}
