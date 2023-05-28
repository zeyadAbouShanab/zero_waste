import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

enum _radioGroupValue { fill, outline }

class RestItemOVerview extends StatefulWidget {
  @override
  _RestItemOverviewState createState() => _RestItemOverviewState();
}

class _RestItemOverviewState extends State<RestItemOVerview> {
  _radioGroupValue _value = _radioGroupValue.fill;
  Widget ButtomBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    String title = '',
    IconData? iconData,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 17, color: iconColor),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(children: [
          ButtomBar(
              backgroundColor: Colors.lightBlue,
              color: Colors.white70,
              iconColor: Colors.white,
              title: "Add to whishlist",
              iconData: Icons.favorite_outline),
          ButtomBar(
              backgroundColor: Colors.lightBlueAccent,
              color: Colors.white70,
              iconColor: Colors.white,
              title: "Add to cart",
              iconData: Icons.shopping_cart)
        ]),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Food Item Overview",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(children: [
                  ListTile(
                    title: Text("Chicken Rice"),
                    subtitle: Text("400 Huf"),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(20),
                    child: Image.network(
                        "https://grist.org/wp-content/uploads/2016/10/styrofoam-food-shutterstock-c.jpg"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      'Available options',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: _radioGroupValue
                                  .fill, // The value for this radio button
                              groupValue:
                                  _value, // The currently selected value in the radio button group
                              activeColor: Colors.green[700],
                              onChanged: (_radioGroupValue? value) {
                                // Update the state with the new value
                                setState(() {
                                  _value = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Text("400 HUF"),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(
                                30,
                              )),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, size: 15, color: Colors.black),
                                Text("ADD",
                                    style: TextStyle(color: Colors.black)),
                              ]),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
            /* Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Item description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ), 
            )*/
          ],
        ));
  }
}
