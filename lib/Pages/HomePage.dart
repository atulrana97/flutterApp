import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../components/horizontal_listview.dart';
import '../components/products.dart';
import '../Pages/Cart.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget imageCarousel = Container(
    height:200,
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
      dotColor: Colors.greenAccent,
      indicatorBgPadding: 2.0,
      dotBgColor: Colors.transparent,
      )
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.green[600],
        title: Text('WeFactory'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed:(){},
          ),
           IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
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
                child: Icon(Icons.person,color:Colors.white),
              ),
              ),
              decoration: BoxDecoration(
                color: Colors.green[300],
               ),
            ), 
            //body

          InkWell(
            onTap: (){},
            child: ListTile(
            title: Text('Home Page'),
            leading: Icon(Icons.home,color: Colors.green[500]),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
            title: Text('My Account'),
            leading: Icon(Icons.person, color: Colors.green[500]),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
            title: Text('My Orders'),
            leading: Icon(Icons.shopping_basket,color: Colors.green[500]),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
            },
            child: ListTile(
            title: Text('Shopping Cart'),
            leading: Icon(Icons.shopping_cart,color: Colors.green[500]),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
            title: Text('Favourites'),
            leading: Icon(Icons.favorite,color: Colors.green[500]),
            ),
          ),

          Divider(),

          InkWell(
            onTap: (){},
            child: ListTile(
            title: Text('Setting'),
            leading: Icon(Icons.settings,color: Colors.blue[500]),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
            title: Text('About'),
            leading: Icon(Icons.help,color: Colors.blue[500]),
            ),
          ),
          ],
          ),
        ),
      body: Column(children: <Widget>[
        //image_carousel
        imageCarousel,
        // Padding Widget
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Categories',
             style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
              )
            ),
          ),

        //Horizontal list view Begin here
        HorizontalList(),

        // Padding Widget 
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Recent Products',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
              )
          ),
        ),
          Flexible(
          child: Products()
          ),
      ],)
    );
  }
}
