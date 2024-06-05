import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/cart_provider.dart';
import 'package:shoezo3/view/edit_product_page.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 223, 220, 217),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartProvider>(
              builder: (context, value, child) {
                return Text(
                  'Total : ${value.totalPrice}',
                  style: const TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black,
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
              return ProductItem(
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

  Widget ProductItem({
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
                                    cartProvider.getAllCart();
                                    cartProvider.deleteFromCart(index);
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            );
                          });
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
                      // getAllShoesCart();
                      // deleteShoesCart(index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditShoeScreen(
                          name: title,
                          price: subtitle,
                          index: index,
                          imagePath: image,
                          category: category,
                        ),
                      ));
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
