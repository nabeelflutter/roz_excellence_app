import 'dart:typed_data';

import 'dart:io';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/buyer.dart';

class AuthModel {
  User? firebaseUser;
  FirebaseFirestore database = FirebaseFirestore.instance;
  FirebaseAuth authentication;
  UserCredential? registeredUser;

  User? get currentUser => authentication.currentUser;

  Stream<User?> get authStateChanges => authentication.authStateChanges();

  AuthModel({FirebaseAuth? firebaseAuth})
      : authentication = firebaseAuth ?? FirebaseAuth.instance;


  Future<String?> forgetPassowrd({
    required String email,

  }) async {
    try {
      await authentication.sendPasswordResetEmail(
        email: email,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future addNewUserToFirebase(Buyer userData, String uid) async {
    try {
      await database.collection('Users').doc(uid).set(userData.toMap());
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }
  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await authentication.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Success';
    } catch (error) {
      if (error.toString() ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        return 'The email you tried to login is already in use';
      } else {
        return 'Something went wrong...';
      }
    }
  }



  Future<String> addImageToFirebaseStorage({required File file}) async {
    try {
      print('this is my image path ${file.path}');
      final storage = FirebaseStorage.instance;

      var snapshot = await storage
          .ref()
          .child('${authentication.currentUser!.uid}/profilePicture/')
          .putData(await file.readAsBytes());
      String url = await snapshot.ref.getDownloadURL();
      print('printing url of image coming from firebase ${url}');
      return url;
    } catch (e) {
      return 'Something went wrong ${e.toString()}';
    }
  }

  Future<String> addCategoryImageToFirebaseStorage(
      {required File file, required String id}) async {
    try {
      print('this is my image path ${file.path}');
      final storage = FirebaseStorage.instance;

      var snapshot = await storage
          .ref()
          .child('${id}/categoryImage/')
          .putData(await file.readAsBytes());

      String url = await snapshot.ref.getDownloadURL();
      print('printing url of image coming from firebase ${url}');
      return url;
    } catch (e) {
      return 'Something went wrong ${e.toString()}';
    }
  }


  Future logout() {
    authentication.signOut();
    return Future.delayed(Duration.zero);
  }

  Future<String> login(
      {required String email, required String password}) async {
    try {
      await authentication.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Success';
    } catch (error) {
      if (error.toString() ==
          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
        return 'User not found. Please check your email or create an account';
      } else {
        return 'Something went wrong ${error.toString()}';
      }
    }
  }


  Future<String> addBuyerToDB(Buyer user) async {
    try {
      await database
          .collection('Users')
          .doc(authentication.currentUser!.uid)
          .set(user.toMap());
      print('-------adding data to db is working');
      return 'Success';
    } catch (error) {
      return 'Something went wrong ${error}';
    }
  }

  Future<String> updateBuyerToDB(Buyer user) async {
    try {
      await database
          .collection('Users')
          .doc(authentication.currentUser!.uid)
          .update(user.toMap());
      print('-------adding data to db is working');
      return 'Success';
    } catch (error) {
      return 'Something went wrong ${error}';
    }
  }


//first thing
  Stream<DocumentSnapshot<Map<String, dynamic>>> getBasicInformation() {
    //   print('printint current user ${authentication.currentUser!.uid}');
    //   print('printint current user ${authentication.currentUser!.uid}');
    var result = database
        .collection('Users')
        .doc(authentication.currentUser!.uid)
        .snapshots();
    print('printing result ${result.length}');
    return result;
  }

  //first thing
  Stream<DocumentSnapshot<Map<String, dynamic>>>
      getBasicInformationForHomepage() {
    return database
        .collection('Users')
        .doc(authentication.currentUser!.uid)
        .snapshots();
  }

  Future<String> changePassword(String newPassword) async {
    try {
      await authentication.currentUser!.updatePassword(newPassword);
      return 'Success';
    } catch (e) {
      return 'Something went wrong ${e.toString()}';
    }
  }

  Future<String> resetPassword(String email) async {
    try {
      await authentication.sendPasswordResetEmail(email: email);
      return 'Success';
    } catch (e) {
      return 'Something went wrong ${e.toString()}';
    }
  }

  Future<String> deleteUserData() async {
    try {
      await database
          .collection('Users')
          .doc(authentication.currentUser!.uid)
          .delete();
      return 'Success';
    } catch (error) {
      return 'Something went wrong ${error.toString()}';
    }
  }

  Future<String> deleteProfilePicture() async {
    try {
      final storage = FirebaseStorage.instance;

      var snapshot = await storage
          .ref()
          .child('${authentication.currentUser!.uid}/profilePicture/')
          .delete();
      return 'Success';
    } catch (error) {
      return 'Something went wrong ${error.toString()}';
    }
  }

  Future<String> deleteAccount() async {
    try {
      await authentication.currentUser!.delete();
      return 'Success';
    } catch (error) {
      return 'Something went wrong ${error.toString()}';
    }
  }

  Future<String> updateProfilePicture({String? imageUrl}) async {
    try {
      await database
          .collection('Users')
          .doc(authentication.currentUser!.uid)
          .update({
        'photoUrl': imageUrl,
      });
      return 'Success';
    } catch (e) {
      return 'Something went wrong ${e.toString()}';
    }
  }

  Future<String> updateUserDetails(
      {required String username,
      required String dateOfBirth,
      required phoneOrEmail}) async {
    try {
      await database
          .collection('Users')
          .doc(authentication.currentUser!.uid)
          .update({
        'fullname': username,
        'dateOfBirth': dateOfBirth,
        'phoneOrEmail': phoneOrEmail
      });
      return 'Success';
    } catch (e) {
      return 'Something went wrong ${e.toString()}';
    }
  }
  Future<User?> signInWithGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);
    var user = await FirebaseAuth.instance.signInWithCredential(credential);
    return  user.user;
  }
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
