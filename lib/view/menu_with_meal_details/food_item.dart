class FoodItem {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String type;
  final String address;
  final int phoneNumber;
  final int price;
  final int quantity;
  final String expiryDate;
  final bool free;
  final String restaurantName;

  FoodItem(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      this.type = '',
      this.address = '',
      this.phoneNumber = 362062080605,
      this.price = 0,
      this.quantity = 0,
      this.expiryDate = '',
      this.free = true,
      this.restaurantName = ''});
  factory FoodItem.fromMap(dynamic map) {
    if (map is Map<dynamic, dynamic>) {
      return FoodItem(
        id: map['id'] as int? ?? 0,
        title: map['title'] as String? ?? '',
        description: map['description'] as String? ?? '',
        imageUrl: map['imageUrl'] as String? ?? '',
        type: map['type'] as String? ?? '',
        address: map['address'] as String? ?? '',
        phoneNumber: map['phoneNumber'] as int? ?? 36206208605,
        price: map['price'] as int? ?? 0,
        quantity: map['quantity'] as int? ?? 0,
        expiryDate: map['expiryDate'] as String? ?? '',
        free: map['free'] as bool? ?? false,
        restaurantName: map['restaurantName'] as String? ?? '',
      );
    } else {
      throw ArgumentError('Invalid map type passed to FoodItem.fromMap');
    }
  }
}
