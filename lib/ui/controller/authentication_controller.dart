import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../domain/use_case/authentication_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  final logged = false.obs;

  bool get isLogged => logged.value;

  AuthenticationController() {
    logInfo('Controller Init');
    logged.value = FirebaseAuth.instance.currentUser != null;
  }

  Future<bool> login(email, password) async {
    logInfo('Controller Login');
    var rta = await Get.find<AuthenticationUseCase>().login(email, password);
    logged.value = rta;
    return rta;
  }

  Future<bool> signUp(email, password) async {
    logInfo('Controller Sign Up');
    await Get.find<AuthenticationUseCase>().signUp(email, password);
    return true;
  }

  Future<void> logOut() async {
    logInfo('Controller Log Out');
    await Get.find<AuthenticationUseCase>().logOut();
    logged.value = false;
  }
}
