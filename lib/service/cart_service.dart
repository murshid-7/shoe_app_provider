// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shoezo_app/models/cart_model.dart';
// import 'dart:developer';

// class CartService {
//   Future getAllShoesCart() async {
//     final shoeDB = await Hive.openBox<CartModel>('cart');
//     return shoeDB.values.toList();
//   }

//   Future addShoesCart(CartModel value) async {
//     log('start');
//     final shoeDB = await Hive.openBox<CartModel>('cart');
//     log('opened');
//     return shoeDB.add(value);
//   }

//   Future deleteShoesCart(index) async {
//     final shoeDB = await Hive.openBox<CartModel>('cart');
//     await shoeDB.deleteAt(index);
//   }
// }


import 'package:hive_flutter/hive_flutter.dart';
import 'dart:developer';

import 'package:shoezo3/model/cart_model.dart';

class CartService {
  Future<List<CartModel>> getAllShoesCart() async {
    final shoeDB = await Hive.openBox<CartModel>('cart');
    return shoeDB.values.toList();
  }

  addShoesCart(CartModel value) async {
    log('start');
    final shoeDB = await Hive.openBox<CartModel>('cart');
    log('opened');
    await shoeDB.add(value);
  }

  Future<void> deleteShoesCart(int index) async {
    final shoeDB = await Hive.openBox<CartModel>('cart');
    await shoeDB.deleteAt(index);
  }
}
