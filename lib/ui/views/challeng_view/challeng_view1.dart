import 'package:e_commerce/core/data/models/post_model.dart';
import 'package:e_commerce/core/data/repository/post_repository.dart';
import 'package:e_commerce/core/utils/network_util.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChallengView1 extends StatefulWidget {
  const ChallengView1({super.key});

  @override
  State<ChallengView1> createState() => _ChallengView1State();
}

class _ChallengView1State extends State<ChallengView1> {
  @override
  Widget build(BuildContext context) {
    List<PostModel> allpost = [];
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        AppColors.whitecolor,
                        AppColors.whitecolor,
                        AppColors.whitecolor,
                        AppColors.greencolor,
                        AppColors.greencolor,
                      ])),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: screenWidth(9), top: screenWidth(10)),
                  child: Image.asset("assets/images/pngs/logochallenge.png"),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: screenWidth(1)),
                  child: FutureBuilder(
                      future: PostRepository().getPost(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          snapshot.data!.fold((l) {}, (r) {
                            allpost.addAll(r);
                          });
                        }
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? SpinKitCircle(
                                color: AppColors.orangecolor,
                              )
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: allpost.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    width: 400,
                                    height: 200,
                                    margin:
                                        EdgeInsetsDirectional.only(bottom: 25),
                                    decoration: BoxDecoration(
                                        color: AppColors.whitecolor,
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: screenWidth(10)),
                                          child: Text(
                                            allpost[i].title.toString(),
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: AppColors.orangecolor),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: screenWidth(20)),
                                          child: Text(
                                            allpost[i].body.toString(),
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: AppColors.blackcolor),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        )
                                      ],
                                    ),
                                  );
                                });
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
