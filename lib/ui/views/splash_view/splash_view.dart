// import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/splash_view/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SplashController controller = Get.put(SplashController());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: size.width / 0.01,
                height: size.width / 0.01,
                child: Image.asset("assets/images/pngs/main_background.png",
                    fit: BoxFit.cover)),
            Center(
                child: Image.asset(
              "assets/images/pngs/logo.png",
              width: size.width / 2,
            ))
          ],
        ),
      ),
    );
  }
}
