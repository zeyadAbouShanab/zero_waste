import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste/view/menu_with_meal_details/food_item.dart';

class ItemOverviewPage extends StatefulWidget {
  final FoodItem foodItem;

  ItemOverviewPage({required this.foodItem});

  @override
  _ItemOverviewPageState createState() => _ItemOverviewPageState();
}

class _ItemOverviewPageState extends State<ItemOverviewPage> {
  late DatabaseReference _foodItemRef;
  late Stream<DatabaseEvent> _foodItemStream;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _foodItemRef = FirebaseDatabase.instance
        .reference()
        .child('foodItems')
        .child('item${widget.foodItem.id}');
    _foodItemStream = _foodItemRef.onValue;
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity = _quantity - 1;
      });
    }
  }

  void _incrementQuantity() {
    if (_quantity < widget.foodItem.quantity) {
      setState(() {
        _quantity = _quantity + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant: Chez Sinda',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Phone: ${widget.foodItem.phoneNumber}',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: _foodItemStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final foodItemData = snapshot.data?.snapshot.value;
          if (foodItemData == null) {
            return Center(child: Text('Food item not found'));
          }

          final foodItem = FoodItem.fromMap(foodItemData);

          return Center(
            child: Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodItem.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Image.asset(
                          foodItem.imageUrl,
                          width: double.infinity,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Food Item Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Type: ${foodItem.type}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Description: ${foodItem.description}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Quantity: ${foodItem.quantity}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'To use before: ${foodItem.expiryDate}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Price: ${foodItem.price}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Select Quantity',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: _decrementQuantity,
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              'Quantity: $_quantity',
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: _incrementQuantity,
                              icon: Icon(Icons.add),
                              // Disable the increment button if quantity reaches the maximum value
                              disabledColor:
                              _quantity == widget.foodItem.quantity
                                  ? Colors.grey
                                  : null,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Handle the request button press
                            // You can access the selected quantity using _quantity variable
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_cart),
                              SizedBox(width: 8),
                              Text('Request'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
