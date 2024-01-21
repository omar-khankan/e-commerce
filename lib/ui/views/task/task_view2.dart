import 'package:e_commerce/core/data/models/products_model.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/task/task_controller2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class TaskView2 extends StatelessWidget {
  final ProductModel product;

  const TaskView2({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20),
            child: TextCustom(
              enterText: product.title ?? "",
              fontColor: AppColors.blackcolor,
              fontSize: screenWidth(15),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20, top: 40),
            child: Image.network(
              product.image!,
              width: 150,
              height: 150,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20),
                child: TextCustom(
                  enterText: "Description:",
                  fontColor: AppColors.darkbluecolor,
                  fontSize: 20,
                ),
              ),
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 80),
                  child: RatingBar(
                    //RatingBarIndicator => for 2.7...
                    initialRating: product.rating!.rate!,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: screenWidth(25),
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star,
                        color: AppColors.darkbluecolor,
                      ),
                      half: Icon(
                        Icons.star_half,
                        color: AppColors.whitecolor,
                      ),
                      empty: Icon(
                        Icons.star_border,
                        color: AppColors.greycolor,
                      ),
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 2),
                    onRatingUpdate: (rating) {},
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20),
            child: TextCustom(
              enterText: product.description!,
              fontColor: AppColors.blackcolor,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 30),
            child: Row(
              children: [
                TextCustom(
                  enterText: "Category: ",
                  fontSize: 20,
                  fontColor: AppColors.darkbluecolor,
                ),
                TextCustom(
                  enterText: product.category!,
                  fontSize: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 30),
            child: Row(
              children: [
                TextCustom(
                  enterText: "Price: ",
                  fontSize: 20,
                  fontColor: AppColors.darkbluecolor,
                ),
                TextCustom(
                  enterText: product.price!.toString(),
                  fontSize: 20,
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth(1),
            height: screenWidth(20),
            decoration: BoxDecoration(),
          ),
        ],
      ),
    ));
  }
}

TaskController2 controller = Get.put(TaskController2());
