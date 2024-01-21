import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce/core/data/repository/auth_repository.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/intro_view/intro_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // TextEditingController userNameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // String userName = "FromTheAshesWeWillRise@gmail.comkh";
  // String password = "TheNightKing@#12";
  // RxBool isChecked = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = 'Malek@gmail.com';
  String password = 'P@ssw0rd';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  RxBool isChecked = false.obs;

  @override
  void onInit() {
    // if (storage.getLoginInfo().isNotEmpty) {
    //   isChecked.value = true;
    //   usernameController.text = storage.getLoginInfo()[0];
    //   passwordController.text = storage.getLoginInfo()[1];
    // } else {
    //   usernameController.text = 'mor_2314';
    //   passwordController.text = '83r5^_';
    // }
    super.onInit();
  }

  void login() {
    if (!formKey.currentState!.validate()) {
      //* Api Request -----

      isLoading.value = true;

      AuthRepository()
          .login(
        username: usernameController.text,
        password: passwordController.text,
      )
          .then((value) {
        isLoading.value = false;

        value.fold((l) {
          BotToast.showText(text: l);
        }, (r) {
          storage.setTokenInfo(r);

          Get.offAll(IntroView());
        });
      });
    }
  }
}
