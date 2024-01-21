import 'package:e_commerce/core/enums/text_type.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            width: screenWidth(0.01),
            height: screenWidth(0.1),
            child: Image.asset(
              "assets/images/pngs/main_background.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: screenWidth(5),
              start: screenWidth(4.3),
            ),
            child: Image.asset("assets/images/pngs/logo.png", width: 200),
          ),
          InkWell(
              onTap: () {
                Get.to(LoginView());
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: screenWidth(0.72),
                  start: screenWidth(13),
                ),
                child: Container(
                  width: screenWidth(1.2),
                  height: screenWidth(7),
                  decoration: BoxDecoration(
                    color: AppColors.lightbluecolor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: TextCustom(
                      enterText: "Login",
                      textType: TextType.big_text,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: screenWidth(0.63),
              start: screenWidth(13),
            ),
            child: Container(
              width: screenWidth(1.2),
              height: screenWidth(7),
              decoration: BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: TextCustom(
                  enterText: "SignUp",
                  textType: TextType.big_text,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
