import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/task/task_controller2.dart';
import 'package:e_commerce/ui/views/task/task_view2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskView4 extends StatefulWidget {
  const TaskView4({super.key});

  @override
  State<TaskView4> createState() => _TaskView4State();
}

TaskController2 controller = Get.put(TaskController2());

class _TaskView4State extends State<TaskView4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      TextCustom(
        enterText: "Categories",
        fontColor: AppColors.blackcolor,
        fontSize: screenWidth(20),
        fontWeight: FontWeight.bold,
      ),
      Obx(() {
        print(controller.sectedIndex.value.toString());
        return Container(
          height: screenWidth(8),
          margin:
              EdgeInsets.only(top: screenWidth(20), bottom: screenWidth(10)),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.allCategory.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    controller.sectedIndex.value = index;
                  },
                  child: Container(
                    width: screenWidth(2),
                    height: screenWidth(2),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: controller.sectedIndex.value == index
                          ? AppColors.darkbluecolor
                          : AppColors.whitecolor,
                      borderRadius: BorderRadiusDirectional.circular(10),
                      border: Border.all(width: 2, color: AppColors.greycolor),
                    ),
                    child: Center(
                      child: TextCustom(
                        enterText: controller.allCategory[index].toString(),
                        fontSize: screenWidth(25),
                        fontColor: controller.sectedIndex.value == index
                            ? AppColors.whitecolor
                            : AppColors.greycolor,
                      ),
                    ),
                  ),
                );
              })),
        );
      }),
      SizedBox(
        height: 10,
      ),
      Obx(() {
        print(controller.sectedIndex.value.toString());

        controller.sectedIndex.value != 0
            ? controller.getProductsByCategory(
                controller.allCategory[controller.sectedIndex.value])
            : controller.getAllProducts();
        // controller.sectedIndex.value == 0
        //     ? controller.getAllProducts()
        //     : controller.getProductsByCategory(
        //         controller.allCategory[controller.sectedIndex.value]);
        return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: screenWidth(1.8)),
            itemCount: controller.sectedIndex.value == 0
                ? controller.allProduct.length
                : controller.allProductByCategory.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(TaskView2(
                    product: controller.sectedIndex.value == 0
                        ? controller.allProduct[index]
                        : controller.allProductByCategory[index],
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: AppColors.greycolor)),
                  child: Column(
                    children: [
                      Image.network(
                        controller.sectedIndex.value != 0
                            ? controller.allProductByCategory[index].image!
                            : controller.allProduct[index].image!,
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextCustom(
                        enterText: controller.sectedIndex.value == 0
                            ? controller.allProduct[index].title.toString()
                            : controller.allProductByCategory[index].title
                                .toString(),
                        fontColor: AppColors.lightbluecolor,
                        fontSize: screenWidth(25),
                      ),
                      Row(
                        children: [
                          TextCustom(
                            enterText: "Price: ",
                            fontColor: AppColors.blackcolor,
                            fontSize: screenWidth(25),
                          ),
                          TextCustom(
                            enterText: controller.sectedIndex.value == 0
                                ? controller.allProduct[index].price.toString()
                                : controller.allProductByCategory[index].price
                                    .toString(),
                            fontColor: AppColors.blackcolor,
                            fontSize: screenWidth(25),
                          ),
                          TextCustom(
                            enterText: " SP",
                            fontColor: AppColors.blackcolor,
                            fontSize: screenWidth(25),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      })
    ]))));
  }
}
