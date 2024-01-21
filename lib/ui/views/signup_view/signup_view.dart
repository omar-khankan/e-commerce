import 'package:e_commerce/core/enums/text_type.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_textformfield.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiginupView extends StatelessWidget {
  const SiginupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          width: screenWidth(0.01),
          height: screenWidth(0.1),
          child: Image.asset("assets/images/pngs/main_background.png",
              fit: BoxFit.cover),
        ),
        InkWell(
          onTap: () {
            Get.to(LoginView());
          },
          child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(7.5), top: screenWidth(2.7)),
              child: TextCustom(
                enterText: "LOG IN",
                textType: TextType.title_text,
                fontColor: Color.fromARGB(162, 121, 120, 120),
              )),
        ),
        Padding(
            padding: EdgeInsetsDirectional.only(
                start: screenWidth(2.3), top: screenWidth(2.7)),
            child: TextCustom(
              enterText: "SIGN UP",
              textType: TextType.title_text,
              fontColor: AppColors.whitecolor,
            )),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(5), top: screenWidth(1.67)),
          child: CustomTextFormField(
            lableText: "Username",
            textFormFieldHintText: "UserName",
            fillColor: const Color.fromRGBO(70, 77, 83, 1),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(5), top: screenWidth(1.27)),
          child: CustomTextFormField(
            lableText: "PassWord",
            textFormFieldHintText: "Password",
            fillColor: const Color.fromRGBO(70, 77, 83, 1),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(5), top: screenWidth(1.03)),
          child: CustomTextFormField(
            lableText: "Confirm PassWord",
            textFormFieldHintText: "Confirm PassWord",
            fillColor: const Color.fromRGBO(70, 77, 83, 1),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(4.5), top: screenWidth(0.85)),
          child: TextCustom(
            enterText: "SIGN UP",
            textType: TextType.big_text,
            fontWeight: FontWeight.normal,
            fontColor: AppColors.whitecolor,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(5), top: screenWidth(0.7)),
          child: Container(
            width: screenWidth(1.1),
            height: screenWidth(6),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(66, 103, 178, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth(10)),
                  bottomLeft: Radius.circular(screenWidth(10)),
                )),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(10), top: screenWidth(20)),
              child: TextCustom(
                textType: TextType.stander_text,
                enterText: "SIGN IN WITH FACEBOOK",
                fontColor: AppColors.whitecolor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        )
      ],
    )));
  }
}
