import 'package:e_commerce/ui/shared/colors.dart';
// import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/intro_view/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    IntroController controller = Get.put(IntroController());
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          width: size.width / 1,
          height: size.width / 4.7,
          color: AppColors.lightbluecolor,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: size.width / 9),
          child: Image.asset(
            "assets/images/pngs/uambrela.jpg",
            fit: BoxFit.contain,
          ),
        ),
        Padding(
            padding: EdgeInsetsDirectional.only(
                top: size.width / 2.2,
                start: size.width / 15,
                end: size.width / 40),
            child: Obx(() => Text(
                  controller.descriptions[controller.index.value],
                  style: TextStyle(fontSize: 20),
                ))),
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: size.width / 1.4,
          ),
          child: Obx(() => Image.asset(
                  "assets/images/pngs/${controller.background[controller.index.value]}.png")
              // Image.asset(
              //     'assets/images/pngs/${controller.background[controller.index.value]}.png'),
              ),
        ),
        Padding(
            padding: EdgeInsetsDirectional.only(top: size.width / 0.8),
            child: Container(
              width: size.width / 1,
              height: size.width / 1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [
                    AppColors.lightbluecolor,
                    AppColors.lightbluecolor,
                    AppColors.lightbluecolor,
                    AppColors.darkbluecolor,
                    AppColors.darkbluecolor,
                  ])),
            )),
        Padding(
            padding: EdgeInsetsDirectional.only(
                start: size.width / 5, top: size.width / 1.4),
            child: Obx(
              () => Image.asset(
                'assets/images/pngs/${controller.images[controller.index.value]}.png',
                width: 200,
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: size.width / 0.65, start: size.width / 2.5),
          child: InkWell(
            onTap: () {
              controller.next();
            },
            child: Obx(
              () => Text(
                controller.index.value < controller.descriptions.length - 1
                    ? "next"
                    : "finish",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
      ],
    )));
  }
}
