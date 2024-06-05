// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/product_provider.dart';
import 'package:shoezo3/model/shoe_model.dart';
import 'package:shoezo3/view/brands_page.dart';
import 'package:shoezo3/view/details_screen.dart';
import 'package:shoezo3/widgets/app_drawer.dart';
import 'package:shoezo3/widgets/carousel_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color.fromARGB(241, 223, 220, 217),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerBarTop(),
              Container(
                margin: EdgeInsets.only(right: 5),
                height: 40,
                width: 150,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.grey),
                  color: Colors.grey[200],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_rounded,
                      size: 25,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5.0),
                    Flexible(
                      child: TextFormField(
                          controller: productProvider.searchController,
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => productProvider
                              .search(productProvider.searchController.text)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          roundedCarousel(),
          SizedBox(height: 5),
          Text(
            'Shop Your Favourite Brands From Here By Click the Logo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          BrandsLogo(),
          Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, value, child) {
                final productList1 = productProvider.searchList.isNotEmpty
                    ? productProvider.searchList
                    : productProvider.shoeList;
                return buildShoeList(productList1);
              },
            ),
          ),
        ],
      )),
      drawer: Drawer1(),
    );
  }
}

Widget buildShoeList(List<ShoeModel> shoe) {
  return shoe.isEmpty
      ? const Center(
          child: Text('Empty'),
        )
      : GridView.builder(
          padding: EdgeInsets.all(5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 10),
          itemCount: shoe.length,
          itemBuilder: (context, index) {
            final data = shoe[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      name: data.name,
                      price: data.price.toString(),
                      quantity: data.quantity,
                      image: data.image,
                      category: data.catagory!,
                      id: index,
                    ),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                        child: Image.file(
                      File(data.image),
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    )),
                    Text(
                      data.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Price:${data.price}'),
                    Text('Brand: ${data.catagory}'),
                  ],
                ),
              ),
            );
          },
        );
}
