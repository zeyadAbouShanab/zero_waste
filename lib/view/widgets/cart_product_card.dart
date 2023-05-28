import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_waste/utils/theme.dart';
import 'package:zero_waste/view/widgets/auth/text_utils.dart';


class CartProductCard extends StatelessWidget {
  final int index;
  final int quantity;
  CartProductCard({
    required this.index,
    required this.quantity,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 120,
            margin: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/burger.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order name",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Order description",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Order price : 50 \$",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 30),
                        backgroundColor: Colors.green
                      ),
                      onPressed: () {  },
                      child: TextUtils(
                        color: Colors.white,
                        text: "Accept",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.none,
                      ),

                    ),
                    const SizedBox(
                      width:20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(70, 30),
                          backgroundColor: Colors.red
                      ),
                      onPressed: () {  },
                      child: TextUtils(
                        color: Colors.white,
                        text: "Reject",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.none,
                      ),

                    )
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
