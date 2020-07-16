import 'package:flutter/material.dart';
import 'package:project_work_atul/common/common.dart';
import './HomePage.dart';

class ProductDetails extends StatefulWidget {
  final productDetailsName;
  final int productDetailsNewPrice;
  final int productDetailsOldPrice;
  final productDetailsPicture;

  ProductDetails(
      {this.productDetailsName,
      this.productDetailsNewPrice,
      this.productDetailsOldPrice,
      this.productDetailsPicture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: deepOrange),
          elevation: 0.4,
          backgroundColor: Colors.white,
          title: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                'WeFactory',
                style: TextStyle(color: Colors.deepOrange),
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
        body: ListView(children: <Widget>[
          Container(
            height: 300.0,
            color: Colors.white,
            child: GridTile(
                child: Container(
                  color: Colors.white70,
                  child: Image.asset(widget.productDetailsPicture),
                ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                      leading: Text(widget.productDetailsName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      title: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text('Rs ${widget.productDetailsOldPrice}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough))),
                          Expanded(
                              child: Text(
                            'Rs ${widget.productDetailsNewPrice}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          )),
                        ],
                      )),
                )),
          ),

          // First Buttons =========

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Size Of Order"),
                              content: Text("Choose The Type of Order"),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("Close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Order Type"),
                        ),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              ),
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Size Of Order"),
                              content: Text("Choose The Type of Order"),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("Close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Quantity"),
                        ),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              )
            ],
          ),

          // Buy Now Button

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                          child: Text("Buy Now"),
                        )),
                      ],
                    )),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {},
                color: Colors.red,
              ),
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                  color: Colors.red)
            ],
          ),
          Divider(
            color: Colors.redAccent,
          ),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text(
                "Cookie is a term used for sweet, flat, baked goods. Biscuit is a term used for a variety of baked, mainly flour-based food products. ... The term cookie is mostly used in American English. In British English, the term biscuit refers to a small, baked, unleavened cake, which is typically crisp, flat, and sweet."),
          ),
          Divider(
            color: Colors.redAccent,
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child:
                    Text("Product Name", style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(widget.productDetailsName))
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child:
                    Text("Product Brand", style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(widget.productDetailsName))
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Condition",
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(widget.productDetailsName))
            ],
          ),

          Divider(),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Similar Products",
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))),

          // Similar Product Container

          Container(
            height: 400.0,
            child: SimilarProducts(),
          )
        ]));
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
          return SimilarSingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldprice: productList[index]['old_price'],
            productPrice: productList[index]['price'],
          );
        });
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldprice;
  final productPrice;

  SimilarSingleProduct(
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
                    productDetailsNewPrice: int.parse(this.productPrice),
                    productDetailsOldPrice: int.parse(this.productOldprice),
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
              fit: BoxFit.cover,
            ),
          ),
        )),
      ),
    );
  }
}
