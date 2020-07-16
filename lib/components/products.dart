import 'package:flutter/material.dart';
import '../Pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Cookies",
      "picture": "images/products/5.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Cookies2",
      "picture": "images/products/10.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Cookies3",
      "picture": "images/products/3.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Cookies4",
      "picture": "images/products/1.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Cookies5",
      "picture": "images/products/8.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Cookies6",
      "picture": "images/products/atta.png",
      "old_price": 120,
      "price": 85,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProduct(
              productName: productList[index]['name'],
              productPicture: productList[index]['picture'],
              productOldprice: productList[index]['old_price'],
              productPrice: productList[index]['price'],
            ),
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final int productOldprice;
  final int productPrice;

  SingleProduct(
      {this.productName,
      this.productPicture,
      this.productOldprice,
      this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
            child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              // here we are passing the values to product details page
              builder: (context) => new ProductDetails(
                    productDetailsName: this.productName,
                    productDetailsNewPrice: this.productPrice,
                    productDetailsOldPrice: this.productOldprice,
                    productDetailsPicture: this.productPicture,
                  ))),
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(
                  productName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Text(
                  'Rs $productPrice',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: Text(
                  'Rs $productOldprice',
                  style: TextStyle(
                    color: Colors.black12,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ),
            child: Image.asset(
              productPicture,
              fit: BoxFit.contain,
            ),
          ),
        )),
      ),
    );
  }
}
