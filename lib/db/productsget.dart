import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_work_atul/modelsProduct/modelProduct.dart';

class ProductService {
  Firestore _firestore = Firestore.instance;
  String collection = 'product';

  Future<List<Product>> getFeaturedProducts() =>
      _firestore.collection(collection).getDocuments().then((snap) {
        List<Product> featuredProduct = [];
        snap.documents.map(
            (snapshot) => featuredProduct.add(Product.fromSnapshot(snapshot)));
        return featuredProduct;
      });
  Future<List<Product>> getCookies() => _firestore
          .collection(collection)
          .where('category', isEqualTo: 'Cookies')
          .getDocuments()
          .then((snap) {
        List<Product> cookies = [];
        snap.documents
            .map((snapshot) => cookies.add(Product.fromSnapshot(snapshot)));
        return cookies;
      });
}
