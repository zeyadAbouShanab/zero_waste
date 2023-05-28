import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste/view/menu_add_proudct/update_record.dart';


class MenuProductsPage extends StatefulWidget {
  const MenuProductsPage({Key? key}) : super(key: key);

  @override
  State<MenuProductsPage> createState() => _FetchDataState();
}

class _FetchDataState extends State<MenuProductsPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('products');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('products');

  Widget listItem({required Map products}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF64B5F6), // Theme color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            products['name'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black, // Text color
            ),
          ),
          const SizedBox(height: 5),
          Text(
            products['type'],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54, // Text color
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Expires on: ${products['expirationDate']}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54, // Text color
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            UpdateRecord(productsKey: products['key'])),
                  );
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.black, // Icon color
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  reference.child(products['key']).remove();
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.black, // Icon color
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching data'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Color.fromARGB(255, 226, 232, 232), // Theme color
        child: Column(
           children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/cover.webp'),
                ),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 120, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
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
                                        offset: Offset(3, 3),
                                      ),
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'On all leftovers of today',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: FirebaseAnimatedList(
                  query: dbRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Map products = snapshot.value as Map;
                    products['key'] = snapshot.key;
                    return listItem(products: products);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
