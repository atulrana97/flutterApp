import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const Name = 'name';
  static const PRICE = 'price';
  static const BRAND = 'brand';
  static const CATEGORY = 'category';
  static const QUANTITY = 'quantity';
  static const PICTURE = 'picture';
  static const DISCOUNT = 'discount';
  static const ID = 'id';

  String _name;
  String _id;
  double _price;
  String _brand;
  String _category;
  List _quantity;
  List _picture;
  int _discount;

  // Getters for these values
  String get name => _name;
  String get brand => _brand;
  String get category => _category;
  List get quantity => _quantity;
  List get picture => _picture;
  int get discout => _discount;
  double get price => _price;
  String get id => _id;

  //named Constructor
  Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data;
    _name = data[Name];
    _brand = data[BRAND];
    _price = data[PRICE];
    _discount = data[DISCOUNT];
    _picture = data[PICTURE];
    _quantity = data[QUANTITY];
    _id = data[ID];
    _category = data[CATEGORY];
  }
}
