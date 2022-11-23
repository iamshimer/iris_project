// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/modules/common_interface/controllers/common_interface_controller.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future loginUser(String email, String password) async {
    final CommonInterfaceController cic = Get.find();
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.user.toString());
      await cic.getUserFData(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  Stream<User?> getUserChanges() {
    return _auth.userChanges();
  }

  User? get getCurrentUser {
    return _auth.currentUser;
  }

  Future<void> logOut() {
    return _auth.signOut();
  }
}
