import 'package:flutter/material.dart';
import 'package:project_work_atul/Pages/product_details.dart';
import 'package:project_work_atul/db/productsget.dart';
import 'package:project_work_atul/modelsProduct/modelProduct.dart';

class AppProvider with ChangeNotifier {
  List<Product> _featuredProducts = [];
  List<Product> _cookies = [];
  ProductService _productService = ProductService();

  AppProvider() {
    _getFeaturedProducts();
    _getCookies();
  }
  //getter
  List<Product> get featuredProduct => _featuredProducts;
  List<Product> get cookies => _cookies;

  //methods
  void _getFeaturedProducts() async {
    _featuredProducts = await _productService.getFeaturedProducts();
    notifyListeners();
  }

  void _getCookies() async {
    _cookies = await _productService.getCookies();
    notifyListeners();
  }
}
