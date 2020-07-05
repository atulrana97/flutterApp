import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  var productsOnTheCart = [
    {
      "name": "Cookies",
      "picture": "images/products/5.png",
      "price": 85,
      "size": "M",
      "Color": "Red",
      "Quantity": 1,
    },
    {
      "name": "Cookies2",
      "picture": "images/products/10.png",
      "price": 85,
      "size": "M",
      "Color": "Red",
      "Quantity": 1,

    },
    {
      "name": "Cookies3",
      "picture": "images/products/3.png",
      "price": 85,
      "size": "M",
      "Color": "Red",
      "Quantity": 1,
    },];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context,index){
        return SingleCartProduct(cartProductQty: productsOnTheCart[index]["Quantity"],
        cartProductColor: productsOnTheCart[index]["Color"],
        cartProductName: productsOnTheCart[index]["name"],
        cartProductPicture: productsOnTheCart[index]["picture"],
        cartProductPrice: productsOnTheCart[index]["price"],
        cartProductSize: productsOnTheCart[index]["size"],)
;      }
      );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProductName;
  final cartProductPicture;
  final cartProductPrice;
  final cartProductSize;
  final cartProductColor;
  final cartProductQty;

  SingleCartProduct({
    this.cartProductName,
    this.cartProductPicture,
    this.cartProductPrice,
    this.cartProductSize,
    this.cartProductColor,
    this.cartProductQty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //==========Leading Section=============
        leading: Image.asset(cartProductPicture,width: 100,height: 100,),

        //==========Title Section===============
        title: Text(cartProductName),

        //================Subtitle Section==========
        subtitle: Column(children: <Widget>[
         // Row Inside Column

        Row(children: <Widget>[
        // ===================Size of the Product=====================
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Text("Size:"),
              ),
          ),
            
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Expanded(
              child: Text(cartProductSize,style: TextStyle(color: Colors.red)),
              ),
          ),  
        // ======================Quantity Of the Product====================
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
            child: Text("Quantity:"),) ,
             Padding(
            padding: const EdgeInsets.all(4.0),
            child: Expanded(
              child: Text(cartProductQty.toString(),style: TextStyle(color: Colors.red)),
              ),
          ),  
        // =======================Price Of the Product======================
        ],),
        Container(
          alignment: Alignment.topLeft,
          child: Row(children: <Widget>[Text("Rs ",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 16.0)),
           Text(cartProductPrice.toString(),style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 16.0))
          ],
          ),
          )

        ],
        ),
        trailing: Column(children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){},),
          Text(cartProductQty.toString()),
          IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){},)
        ],),
        ),
    );
  }
}