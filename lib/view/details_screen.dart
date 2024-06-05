import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/add_provider.dart';
import 'package:shoezo3/controller/cart_provider.dart';
import 'package:shoezo3/model/cart_model.dart';
import 'package:shoezo3/view/cart_page.dart';
import 'package:shoezo3/view/edit_product_page.dart';
import 'package:shoezo3/widgets/designs.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final String image;
  final String category;
  final int? id;
  DetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.category,
    required this.id,
  });

  List<Color> colors = [
    Colors.black,
    Colors.yellow,
    Colors.greenAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
        ]),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditShoeScreen(
                  name: name,
                  price: price,
                  index: id!,
                  imagePath: image,
                  category: category,
                ),
              ));
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(248, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerContainer(image: image),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ratingBar(),
                  const SizedBox(height: 10),
                  const Text(
                    "Sneaker Size",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shoeSize(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Colors Available: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 160,
                        child: Row(
                          children: [
                            for (var colors in colors)
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: colors,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 57, 148, 191),
                              Color.fromARGB(255, 0, 0, 0),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              price,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "A pair of casual iconic shoes, has regular styling, lace-up detail Breathable Support :Lightweight knit material wraps your foot in breathable comfort.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "More Details",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final cartitem = CartModel(
                      id: id,
                      name: name,
                      image: image,
                      price: price,
                      quantity: quantity,
                      category: category);
                  cartProvider.addToCart(cartitem);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headerContainer({required image}) => Consumer<AddProvider>(
        builder: (context, value, child) => Container(
          height: 320,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SizedBox(
              height: 200,
              width: 300,
              child: Image.file(File(image)),
            ),
          ),
        ),
      );
}
