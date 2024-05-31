import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../domain/models/user.dart';
import '../../domain/use_case/user_usecase.dart';
import 'authentication_controller.dart';

class UserController extends GetxController {
  final RxList<User> _users = <User>[].obs;
  final UserUseCase userUseCase = Get.find();

  List<User> get users => _users;

  @override
  void onInit() {
    getUers();
    super.onInit();
  }

  getUers() async {
    logInfo("Getting users");
    AuthenticationController authController = Get.find();
    if (authController.isLogged == false) {
      return;
    }
    _users.value = await userUseCase.getUsers();
  }

  addUser(User user) async {
    logInfo("Add user");
    await userUseCase.addUser(user);
    getUers();
  }

  updateUser(User user) async {
    logInfo("Update user");
    await userUseCase.updateUser(user);
    getUers();
  }

  void deleteUser(String id) async {
    await userUseCase.deleteUser(id);
    getUers();
  }

  void deleteUsers() async {
    await userUseCase.deleteUsers();
    getUers();
  }
}
