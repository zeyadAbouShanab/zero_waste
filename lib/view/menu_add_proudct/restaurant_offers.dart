import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zero_waste/rest_item_overview.dart';
import 'package:zero_waste/item_overview_page.dart';

class restaurant_offers extends StatelessWidget {
  Widget FoodItem(VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Expanded(
            flex: 2,
            child: Image.network(
                'https://grist.org/wp-content/uploads/2016/10/styrofoam-food-shutterstock-c.jpg')),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chicken Rice',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                '400 HUF',
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      width: 85,
                      height: 30,
                      decoration: BoxDecoration(),
                      child: OutlinedButton(
                          onPressed: onTap,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.info_outline),
                              SizedBox(width: 4),
                              Text('info')
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 229, 229),
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Restaurant offers",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.search, size: 15, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                radius: 12,
                child:
                    Icon(Icons.shop_2_outlined, size: 15, color: Colors.black)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.shutterstock.com/image-photo/various-asian-meals-on-rustic-260nw-1125066479.jpg')),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120, bottom: 10),
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                          ),
                          child: Center(
                            child: Text(
                              'Zero Waste',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                shadows: [
                                  BoxShadow(
                                      color: Colors.green,
                                      blurRadius: 10,
                                      offset: Offset(3, 3))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '70% Off',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.green[100],
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'On all leftovers of today',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recently added'),
                Text('view all', style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FoodItem(() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemOverviewPage(),
                  ));
                }),
                FoodItem(() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemOverviewPage(),
                  ));
                }),
                FoodItem(() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemOverviewPage(),
                  ));
                }),
                FoodItem(() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemOverviewPage(),
                  ));
                }),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
