import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iris_project/app/services/auth_services.dart';

import '../../../routes/app_pages.dart';
import '../models/user_provider_model.dart';
import '../widgets/force_signout.dart';

class CommonInterfaceController extends GetxController {
  final _aServices = AuthServices();

  final _db = FirebaseFirestore.instance;

  final Rx<User?> _user = Rx<User?>(null);
  final Rx<UserProvider?> _userAdditional = Rx<UserProvider?>(null);

  User? get getUser => _user.value;
  set setUser(User? user) {
    _user.value = user;
  }

  UserProvider? get getUserAdditional => _userAdditional.value;

  bool get isTutor {
    return getUserAdditional?.role == "tutor" ? true : false;
  }

  set setUserAddiVal(UserProvider? userProviderVal) {
    _userAdditional.value = userProviderVal;
  }

  final isFinished = false.obs;

  @override
  onInit() async {
    super.onInit();

    _user.bindStream(_aServices.getUserChanges());
    if (_aServices.getCurrentUser != null) {
      await getUserFData(_aServices.getCurrentUser?.uid);
    }
    // FlutterNativeSplash.remove();

    ever(_user, (User? us) async {
      if (Get.currentRoute == Routes.COMMON_INTERFACE) return;

      if (us == null && Get.currentRoute == Routes.LOGIN) return;

      Get.offAllNamed(Routes.COMMON_INTERFACE);
    });
  }

  Future getUserFData(String? uid) async {
    final docRef = _db.collection("users").doc(uid);
    docRef.snapshots().listen(
      (event) async {
        final finalResult = event.data();

        if (finalResult != null) {
          final dutched = UserProvider.fromMap(finalResult);

          setUserAddiVal = dutched;
          isFinished.value = true;
        } else {
          setUserAddiVal = null;
          isFinished.value = true;
          await forceSignOut();
        }
      },
      onError: (error) async {
        setUserAddiVal = null;
        isFinished.value = true;
        await forceSignOut();
      },
    );
  }

  Future<void> signMeOut() async {
    try {
      await _aServices.logOut();

      setUserAddiVal = null;
    } catch (e) {
      // ignore: avoid_print
      print("something wrong in signout $e");
    }
  }
}
