import 'package:e_commerce/core/enums/text_type.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_textformfield.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/intro_view/intro_view.dart';
import 'package:e_commerce/ui/views/login_view/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: controller.formKey,
        child: Stack(children: [
          Container(
            width: screenWidth(0.01),
            height: screenWidth(0.1),
            child: Image.asset("assets/images/pngs/main_background.png",
                fit: BoxFit.cover),
          ),
          Padding(
              padding: EdgeInsetsDirectional.only(
                start: screenWidth(1.5),
                top: screenWidth(2.7),
              ),
              child: const TextCustom(
                enterText: "LOG IN",
                textType: TextType.title_text,
                fontColor: AppColors.whitecolor,
              )),
          InkWell(
            onTap: () {
              Get.to(IntroView());
            },
            child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: screenWidth(3),
                  top: screenWidth(2.7),
                ),
                child: const TextCustom(
                  enterText: "Sign Up",
                  textType: TextType.title_text,
                  fontColor: Color.fromARGB(211, 110, 110, 110),
                )),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: screenWidth(5),
              top: screenWidth(1.5),
            ),
            child: CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Email";
                }
                if (!isValidEmail(value)) {
                  return "PLease Enter Valide Email";
                }
              },
              controller: controller.usernameController,
              lableText: "Username",
              textFormFieldHintText: "UserName",
              fillColor: AppColors.greycolor,
            ),
          ),
          Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(5), top: screenWidth(1.17)),
              child: CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please Enter Password";
                  }
                  if (isPasswordValid(value)) {
                    return "Please Enter valid Password";
                  }
                },
                controller: controller.passwordController,
                lableText: "Password",
                textFormFieldHintText: "Password",
                fillColor: AppColors.greycolor,
              )),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: screenWidth(4.5),
              top: screenWidth(0.9),
            ),
            child: const TextCustom(
              enterText: "LOG IN NOW",
              textType: TextType.big_text,
              fontWeight: FontWeight.normal,
              fontColor: AppColors.whitecolor,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: screenWidth(6),
              top: screenWidth(0.7),
            ),
            child: Container(
              width: screenWidth(1.1),
              height: screenWidth(6),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(66, 103, 178, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      screenWidth(10),
                    ),
                    bottomLeft: Radius.circular(
                      screenWidth(10),
                    ),
                  )),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: screenWidth(10),
                  top: screenWidth(20),
                ),
                child: const TextCustom(
                  textType: TextType.stander_text,
                  enterText: "SIGN IN WITH FACEBOOK",
                  fontColor: AppColors.whitecolor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(0.92), start: screenWidth(1.7)),
            child: Row(children: [
              Obx(
                () => Checkbox(
                  value: controller.isChecked.value,
                  onChanged: (bool? value) {
                    controller.isChecked.value = value!;
                  },
                ),
              ),
              TextCustom(
                enterText: "remember me",
                textType: TextType.stander_text,
                fontColor: AppColors.whitecolor,
              )
            ]),
          )
        ]),
      ),
    ));
  }
}
