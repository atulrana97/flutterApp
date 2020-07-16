import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:project_work_atul/Pages/LoginPage.dart';
import 'package:project_work_atul/provider/appProvider.dart';
import 'package:project_work_atul/provider/userProvider.dart';
import 'package:provider/provider.dart';
import '../components/horizontal_listview.dart';
import '../components/products.dart';
import '../Pages/Cart.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    final user = Provider.of<UserProvider>(context);
    Widget imageCarousel = Container(
        height: 200,
        child: Carousel(
          boxFit: BoxFit.contain,
          images: [
            AssetImage('images/Kingdom 0.jpg'),
            AssetImage('images/Kingdom-1.jpg'),
            AssetImage('images/Kingdom-2.jpg'),
            AssetImage('images/Kingdom-3.jpg'),
            AssetImage('images/Kingdom-5.jpg'),
          ],
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          dotColor: Colors.deepOrange,
          indicatorBgPadding: 2.0,
          dotBgColor: Colors.transparent,
        ));

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepOrange),
          elevation: 0.8,
          backgroundColor: Colors.white,
          title: Material(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey[200].withOpacity(0.5),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: TextFormField(
                  controller: _searchText,
                  decoration: InputDecoration(
                      hintText: "Search...",
                      icon: Icon(Icons.search),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "The Name field cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.deepOrange,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              //header
              UserAccountsDrawerHeader(
                accountEmail: Text('Atul Rana'),
                accountName: Text('atulrana97@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                ),
              ),
              //body

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home, color: Colors.green[500]),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Account'),
                  leading: Icon(Icons.person, color: Colors.green[500]),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Orders'),
                  leading:
                      Icon(Icons.shopping_basket, color: Colors.green[500]),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: ListTile(
                  title: Text('Shopping Cart'),
                  leading: Icon(Icons.shopping_cart, color: Colors.green[500]),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Favourites'),
                  leading: Icon(Icons.favorite, color: Colors.green[500]),
                ),
              ),

              Divider(),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Setting'),
                  leading: Icon(Icons.settings, color: Colors.blue[500]),
                ),
              ),
              Text(appProvider.cookies.length.toString()),
              InkWell(
                onTap: () {
                  user.signOut();
                },
                child: ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.help, color: Colors.blue[500]),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            //image_carousel
            imageCarousel,
            // Padding Widget
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),

            //Horizontal list view Begin here
            HorizontalList(),

            // Padding Widget
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Recent Products',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Flexible(child: Products()),
          ],
        ));
  }
}
