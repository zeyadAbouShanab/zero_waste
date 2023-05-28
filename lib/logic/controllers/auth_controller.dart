import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{

   bool isVisible = false;

  void changeVisibility(){
    if (isVisible)  {
      isVisible = false;
    } else  {
      isVisible = true;
    }
    update();
  }


   bool isChecked = false;

   void changeChecked(){
     if (isChecked)  {
       isChecked = false;
     } else  {
       isChecked = true;
     }
     update();
   }

}