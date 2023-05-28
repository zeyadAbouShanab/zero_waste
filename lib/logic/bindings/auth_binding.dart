

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController(),permanent: true);
  }

}