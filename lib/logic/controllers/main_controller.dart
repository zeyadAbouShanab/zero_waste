import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zero_waste/view/menu_add_proudct/add_product_page.dart';
import 'package:zero_waste/view/menu_add_proudct/menu_products_page.dart';
import 'package:zero_waste/view/menu_with_meal_details/restaurant_offers.dart';
import 'package:zero_waste/view/screens/auth/login_screen.dart';
import 'package:zero_waste/view/screens/auth/signup_screen.dart';
import 'package:zero_waste/view/screens/welcome_screen.dart';

import '../../view/screens/home_screen.dart';


class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  bool isChecked = false;

  void changeChecked(){
    isChecked = !isChecked;
    update();
  }

  bool isFreeChecked = false;

  void changeFreeChecked(){
    isFreeChecked = !isFreeChecked;
    update();
  }
  var tabs = [
    // RestaurantOffers(),
    // AddProductPage(),
    // HomeScreen(),
    // SignUpScreen(),
    MenuProductsPage(),
    AddProductPage(),
    HomeScreen(),
    RestaurantOffers(),

  ].obs;

  var title = [
    "Add product",
    "Orders",
    'Update',
    "Details",
  ].obs;
}
