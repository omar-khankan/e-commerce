import 'package:e_commerce/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  List<String> descriptions = [
    'Life is a succession of lessons which must be lived to be understood.',
    'You come into the world with nothing, and the purpose of your life is to make something out of nothing.',
    ' Life is what happens while you are busy making other plans.'
  ];
  List<String> images = ['Bag', 'mobile', 'Truck'];
  List<String> background = ['City', 'global', 'City'];
  RxInt index = 0.obs;
  void next() {
    if (index.value < descriptions.length - 1) {
      index++;
    } else {
      Get.to(LandingView());
    }
  }
}
