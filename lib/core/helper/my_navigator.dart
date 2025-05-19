import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class MyNavigator
{
  static void navigateTo({required Widget screen})
  {
    Get.to(screen);
  }
}