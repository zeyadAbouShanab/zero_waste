import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/main_controller.dart';
import '../../utils/theme.dart';


class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);


  final controller = Get.put<MainController>(MainController());
//,n,nn,
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,

            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.menu_book,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.menu_book,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                      Icons.add,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Add',
                ),
                // BottomNavigationBarItem(
                //   activeIcon: Icon(
                //     Icons.favorite,
                //     color: Get.isDarkMode ? pinkClr : mainColor,
                //   ),
                //   icon: Icon(
                //     Icons.favorite,
                //     color: Get.isDarkMode ? Colors.white : Colors.black,
                //   ),
                //   label: 'Update',
                // ),
                // BottomNavigationBarItem(
                //   activeIcon: Icon(
                //     Icons.settings,
                //     color: Get.isDarkMode ? pinkClr : mainColor,
                //   ),
                //   icon: Icon(
                //     Icons.settings,
                //     color: Get.isDarkMode ? Colors.white : Colors.black,
                //   ),
                //   label: 'Details',
                // ),
              ],
              onTap: (index) {
                print("indexxxvcxvxvcxvxx ${index}");
                controller.currentIndex.value = index;
              },
            ),
              body: IndexedStack(
                  index: controller.currentIndex.value,
                  children: controller.tabs.value,
              ),
          );
        },
      ),
    );
  }
}
