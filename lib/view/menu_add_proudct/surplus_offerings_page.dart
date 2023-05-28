import 'package:flutter/material.dart';
import 'package:zero_waste/view/menu_with_meal_details/food_item.dart';

class SurplusOfferingsPage extends StatefulWidget {
  @override
  _SurplusOfferingsPageState createState() => _SurplusOfferingsPageState();
}

class _SurplusOfferingsPageState extends State<SurplusOfferingsPage> {
  List<FoodItem> foodItems = [
    FoodItem(
        id: 1,
        title: 'Grilled Vegetables',
        imageUrl: "assets/food-offerings1.jpg",
        description: 'Delicious pizza with cheese and toppings'),
    FoodItem(
        id: 2,
        title: 'Chicken rice',
        imageUrl: "assets/food-offerings2.jpg",
        description: 'Juicy burger with lettuce and tomato'),
  ];

  void viewItem(FoodItem item) {
    // Add your logic to view the item
    print('View: ${item.title}');
  }

  void deleteItem(FoodItem item) {
    // Add your logic to delete the item
    print('Delete: ${item.title}');
    setState(() {
      foodItems.remove(item);
    });
  }

  void modifyItem(FoodItem item) {
    // Add your logic to modify the item
    print('Modify: ${item.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surplus Offerings'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Add your logic to add a new item
                    print('Add new item');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                FoodItem item = foodItems[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      // Add a boxShadow to create a shadow effect
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          item.imageUrl,
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(item.description),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.visibility),
                                  onPressed: () => viewItem(item),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => deleteItem(item),
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () => modifyItem(item),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class FoodItem {
//   final String id;
//   final String title;
//   final String imageUrl;
//   final String description;
//
//   FoodItem({
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     required this.description,
//   });
// }
