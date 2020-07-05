import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/cats/cookies.png',
            imageCaption:'Cookies'
          ),
          Category(
            imageLocation: 'images/cats/Healthy Cookeis.jpeg',
            imageCaption:'Healthy Cookies'
          ),
          Category(
            imageLocation: 'images/cats/Buiscuits.png',
            imageCaption:'Premium Cookies'
          ),
          Category(
            imageLocation: 'images/cats/drinks.jpeg',
            imageCaption: 'Enery Drinks'
          ),
      ],)
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  Category({
    this.imageLocation,
    this.imageCaption

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
            width: 100.0,
            child: ListTile(
            title: Image.asset(  
            imageLocation,
            width: 80.0,
            height: 60.0
            ),
            subtitle: Text(imageCaption, style: TextStyle(fontSize: 12.0),),
          ),
        )
        )
    );
  }
}


