// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:shoezo_app/models/cart_model.dart';
// import 'package:shoezo_app/service/cart_service.dart';

// class CartProvider extends ChangeNotifier {
//   List<CartModel> cartList = [];
//   CartService cartService = CartService();

//   double totalPrice = 0;

//   Future getAllCart() async {
//     cartList = await cartService.getAllShoesCart();
//     notifyListeners();
//     calculateTotalPrice();
//     notifyListeners();
//   }

//   Future<void> addToCart(CartModel value) async {
//     log('adding to cart');
//     await cartService.addShoesCart(value);
//     log('cart  added');

//     totalPrice += double.parse(value.price);
//     getAllCart();
//   }

//   Future deleteFromCart(index) async {
//     await cartService.deleteShoesCart(index);
//     getAllCart();
//   }

//   void calculateTotalPrice() {
//     totalPrice = 0;
//     for (var item in cartList) {
//       totalPrice += double.parse(item.price);
//     }
//   }
// }


import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shoezo3/model/cart_model.dart';
import 'package:shoezo3/service/cart_service.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];
  CartService cartService = CartService();
  double totalPrice = 0;

  Future<void> getAllCart() async {
    cartList = await cartService.getAllShoesCart();
    notifyListeners();
    calculateTotalPrice();
    notifyListeners();
  }

  Future<void> addToCart(CartModel value) async {
    log('adding to cart');
    await cartService.addShoesCart(value);
    log('cart added');

    totalPrice += double.parse(value.price);
    await getAllCart();
  }

  Future<void> deleteFromCart(int index) async {
    await cartService.deleteShoesCart(index);
    await getAllCart();
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (var item in cartList) {
      totalPrice += double.parse(item.price);
    }
  }
}
