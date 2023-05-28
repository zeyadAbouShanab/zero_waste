import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _database = FirebaseDatabase.instance.reference();
  final picker = ImagePicker();
  File? _pickedImage;

  String productName = '';
  String productType = '';
  String productOrigin = '';
  String productExpirationDate = '';
  String productProductionDate = '';
  int productQuantity = 0;
  String productDescription = '';

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _pickedImage = File(pickedFile.path);
      }
    });
  }

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      DatabaseReference newProductRef = _database.child('products').push();
      newProductRef.set({
        'name': productName,
        'type': productType,
        'origin': productOrigin,
        'expirationDate': productExpirationDate,
        'productionDate': productProductionDate,
        'quantity': productQuantity,
        'description': productDescription,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product added successfully')),
        );
        _formKey.currentState!.reset();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add product')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: _pickedImage != null
                        ? Image.file(
                            _pickedImage!,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.camera_alt, size: 50),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productName = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Type'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a product type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productType = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Origin'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a product origin';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productOrigin = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Expiration Date'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an expiration date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productExpirationDate = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Production Date'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a production date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productProductionDate = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a quantity';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productQuantity = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productDescription = value!;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
