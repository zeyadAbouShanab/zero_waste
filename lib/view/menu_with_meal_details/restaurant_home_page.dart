import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zero_waste/surplus_offerings_page.dart';

class restaurant_home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.blueAccent,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text("Restaurant's name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  subtitle: Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/person-icon.png'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio:
                    1.3, // adjust the aspect ratio to add padding between cells
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SurplusOfferingsPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(
                          8.0), // add padding to each image
                      child: itemDashboard(
                          "Surplus Offerings", "assets/surplusFood_icon.png"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(8.0), // add padding to each image
                    child: itemDashboard("Orders", "assets/orders-icon.png"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(8.0), // add padding to each image
                    child: itemDashboard(
                        "Sustainability reports", "assets/analytics-icon.png"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(8.0), // add padding to each image
                    child: itemDashboard(
                        "Feedback & Reviews", "assets/feedback-icon.png"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemDashboard(String title, String img) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Color.fromARGB(255, 117, 172, 197),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 50, // change the width to make the image smaller
              height: 50, // change the height to make the image smaller
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                img,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
}
