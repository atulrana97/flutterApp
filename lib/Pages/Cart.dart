import 'package:flutter/material.dart';

//My Import 
import '../components/CartProduct.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0.4,
        backgroundColor: Colors.green[600],
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed:(){},
          ),
           IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed:(){},
          )
        ],
      ),
      body: CartProduct(),
      
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(children: <Widget>[
          Expanded(child: ListTile(
            title: Text("Total:"),
            subtitle: Text("Rs230"),
            ),),

          Expanded(
            child: MaterialButton(onPressed: (){},
            child: Text("Check Out",style: TextStyle(color: Colors.white)),
            color: Colors.red)
            ),

        ],
        ),
        ),
    );
  }
}