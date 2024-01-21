import 'package:e_commerce/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.putAsync<SharedPreferences>(
    ()async{
      return await SharedPreferences.getInstance();
    }
  );
  runApp(const MyApp());
}
