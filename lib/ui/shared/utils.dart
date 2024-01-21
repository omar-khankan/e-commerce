import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce/core/data/repository/shared_prefrence_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'colors.dart';

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait) {
    return Get.size.height / percent;
  } else {
    return Get.size.width / percent;
  }
}

SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();
bool isValidEmail(String email) {
  RegExp regex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  return regex.hasMatch(email);
}

bool isPasswordValid(String password) {
  RegExp regex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$',
  );
  return regex.hasMatch(password);
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 103, 103).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenWidth(4),
        child: SpinKitCircle(
          color: AppColors.orangecolor,
          size: screenWidth(8),
        ),
      );
    });
