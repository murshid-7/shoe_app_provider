import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).getAllCart();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 220, 217),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 223, 220, 217),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartProvider>(
              builder: (context, value, child) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(
                      'Total : ${value.totalPrice}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.cartList.length,
            itemBuilder: (context, index) {
              final data = value.cartList[index];
              return productItem(
                title: data.name,
                subtitle: data.price,
                category: data.category,
                index: index,
                image: data.image,
                context: context,
              );
            },
          );
        },
      ),
    );
  }

  Widget productItem({
    required BuildContext context,
    required int index,
    required String category,
    required String title,
    required String subtitle,
    required String image,
  }) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 120,
          child: Card(
            elevation: 6,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              leading: Image.file(File(image)),
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm Delete'),
                              content: const Text(
                                  'Are you sure want to delete this item?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'cancel',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // cartProvider.getAllCart();
                                    cartProvider.deleteFromCart(index);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
