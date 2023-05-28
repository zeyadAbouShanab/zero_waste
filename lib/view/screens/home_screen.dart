import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:zero_waste/logic/controllers/home_controller.dart';

import '../../logic/controllers/auth_controller.dart';
import '../../logic/controllers/main_controller.dart';
import '../../utils/theme.dart';
import '../widgets/auth/auth_text_from_field.dart';
import '../widgets/auth/text_utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal : 20 , vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      TextUtils(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        text: "Zero",
                        color: Color.fromARGB(255, 5, 199, 179),
                        textDecoration: TextDecoration.none,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      TextUtils(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        text: " Waste",
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        textDecoration: TextDecoration.none,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 47,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45,
                      backgroundImage: AssetImage('assets/images/burger.png',),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthTextFromField(
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.perm_identity,
                      color: Color.fromARGB(255, 5, 199, 179),
                      size: 30,
                    ),
                    suffixIcon: const Text(""),
                    hintText: 'User Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextFromField(
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.fastfood,
                      color: Color.fromARGB(255, 5, 199, 179),
                      size: 30,
                    ),
                    suffixIcon: const Text(""),
                    hintText: 'Type',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextFromField(
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.date_range,
                      color: Color.fromARGB(255, 5, 199, 179),
                      size: 30,
                    ),
                    suffixIcon: const Text(""),
                    hintText: 'Production date',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextFromField(
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.date_range,
                      color: Color.fromARGB(255, 5, 199, 179),
                      size: 30,
                    ),
                    suffixIcon: const Text(""),
                    hintText: 'Expiry date',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextFromField(
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.production_quantity_limits,
                      color: Color.fromARGB(255, 5, 199, 179),
                      size: 30,
                    ),
                    suffixIcon: const Text(""),
                    hintText: 'Quantity',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextFromField(
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.trip_origin,
                      color: Color.fromARGB(255, 5, 199, 179),
                      size: 30,
                    ),
                    suffixIcon: const Text(""),
                    hintText: 'Origin',
                  ),
                  Row(
                    children: [
                      GetBuilder<MainController>(
                        builder: (_) {
                          return Checkbox(
                              value: controller.isChecked,
                              checkColor: Colors.white,
                              activeColor: Color.fromARGB(255, 5, 199, 179),
                              onChanged: (bool? value) {
                                print('gsdgdgfgddggd');
                                controller.changeChecked();
                              });
                        },
                      ),
                      TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        text: "Discount price",
                        color: Colors.black,
                        textDecoration: TextDecoration.none,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      GetBuilder<MainController>(
                        builder: (_) {
                          return Checkbox(
                              value: controller.isFreeChecked,
                              checkColor: Colors.white,
                              activeColor: Color.fromARGB(255, 5, 199, 179),
                              onChanged: (bool? value) {
                                print('gsdgdgfgddggd');
                                controller.changeFreeChecked();
                              });
                        },
                      ),
                      TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        text: "Free",
                        color: Colors.black,
                        textDecoration: TextDecoration.none,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),


      ),
    );
  }
}
