import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/product_provider.dart';
import 'package:shoezo3/model/shoe_model.dart';
import 'package:shoezo3/view/details_screen.dart';

class NikeStore extends StatelessWidget {
  const NikeStore({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getAllProducts();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 220, 217),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black.withOpacity(0.9),
          title: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              const SizedBox(width: 70),
              const Text('NIKE STORE', style: TextStyle(color: Colors.white))
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child:
                // ValueListenableBuilder<List<ShoeModel>>(
                //   valueListenable: shoeListNotifier,
                //   builder:
                //       (BuildContext context, List<ShoeModel> shoe, Widget? child) {
                //     final filteredList = shoe
                //         .where(
                //             (element) => element.catagory?.toLowerCase() == 'nike')
                //         .toList();
                //     return filteredGrid(context, filteredList);
                //   },
                // ),
                Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                final filteredList = productProvider.shoeList
                    .where(
                        (element) => element.catagory?.toLowerCase() == 'nike')
                    .toList();
                return filteredGrid(context, filteredList);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget filteredGrid(BuildContext context, List<ShoeModel> shoeList) {
    return shoeList.isEmpty
        ? const Center(
            child: Text('Empty'),
          )
        : ListView.builder(
            itemCount: shoeList.length,
            itemBuilder: (context, index) {
              final data = shoeList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        id: data.id,
                        name: data.name,
                        price: data.price,
                        quantity: data.quantity,
                        image: data.image,
                        category: data.catagory!,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 150,
                        child: Image.file(File(data.image)),
                      ),
                      Column(
                        children: [
                          Text(data.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text("Brand:${data.catagory}"),
                          Text('Price: ${data.price}')
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
