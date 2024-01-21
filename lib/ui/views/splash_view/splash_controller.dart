import 'package:e_commerce/ui/views/intro_view/intro_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(IntroView());
    });
    super.onInit();
  }
}
