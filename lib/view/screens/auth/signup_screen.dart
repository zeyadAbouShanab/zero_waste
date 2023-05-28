import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_waste/utils/theme.dart';
import 'package:zero_waste/view/widgets/cart_product_card.dart';

import '../../../logic/controllers/auth_controller.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  // the list of products
  final List<Map<String, dynamic>> _products = [
    {'id': 1, 'name': 'Dragon Robot', 'price': 19.99},
    {'id': 2, 'name': 'Turtle Toy', 'price': 15.99},
    {'id': 3, 'name': 'White Board', 'price': 12.99},
    {'id': 4, 'name': 'KindaCode.com', 'price': 24.99},
    {'id': 5, 'name': 'Travel Bag', 'price': 17.99},
  ];
  final fromKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.put<AuthController>(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:Colors.white ,
        body: Container(
          height: double.infinity,
          width: double.infinity,
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                itemBuilder: (context, index) {
                  return CartProductCard(
                    index: index,
                    quantity: 6
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 6,
              ),

        ),
      ),
    );
  }
}
