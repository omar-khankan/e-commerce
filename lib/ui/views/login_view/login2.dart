import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_textformfield.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/login_view/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: controller.usernameController,
              textFormFieldHintText: 'key_email',
              validator: (value) {
                //!--- value => usernameController.text
                if (value!.isEmpty)
                  return "Please enter email";
                else if (!isValidEmail(value))
                  return "Please enter Valid email";
              },
            ),
            CustomTextFormField(
              controller: controller.passwordController,
              textFormFieldHintText: 'key_password',
              validator: (value) {
                if (!isPasswordValid(value!))
                  return "Please enter valid password";
              },
            ),
            Obx(() {
              return controller.isLoading.value
                  ? SpinKitCircle(
                      color: AppColors.orangecolor,
                    )
                  : InkWell(
                      onTap: () {
                        controller.login();
                      },
                      child: Container(
                        width: screenWidth(1),
                        height: screenWidth(10),
                        color: AppColors.lightbluecolor,
                        child: Text(
                          'key_login',
                          style: TextStyle(
                              fontSize: 20, color: AppColors.whitecolor),
                        ),
                      ));
            }),
            Row(
              children: [
                Obx(() {
                  return Checkbox(
                    checkColor: Colors.white,
                    value: controller.isChecked.value,
                    onChanged: (bool? value) {
                      controller.isChecked.value = value!;
                    },
                  );
                }),
                Text(
                  'Remmberme',
                  style: TextStyle(fontSize: 20, color: AppColors.blackcolor),
                ),
              ],
            ),
            SizedBox(
              height: screenWidth(15),
            ),
          ],
        ),
      )),
    );
  }
}
