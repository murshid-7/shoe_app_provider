// ignore_for_file: unused_field, prefer_const_constructors

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:shoezo3/view/add_product.dart';
import 'package:shoezo3/view/cart_page.dart';
import 'package:shoezo3/view/home_page.dart';
import 'package:shoezo3/view/pie_chart.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: _getBodyWidget(_currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home, size: 30.0),
            title: Text('Home'),
            activeColor: Color.fromARGB(255, 0, 0, 0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add, size: 30.0),
            title: Text('Add Item'),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.pie_chart, size: 30.0),
            title: Text('Chart'),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart_sharp, size: 30.0),
            title: Text('Cart'),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _getBodyWidget(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return AddProduct();
      case 2:
        return MyPieChart1();
      case 3:
        return CartPage();
      default:
        return HomeScreen();
    }
  }
}
