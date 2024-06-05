import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/product_provider.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //   style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
            //   onPressed: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => AllProductScreen()));
            //   },
            //   child: Text('View Products',style: TextStyle(color: Colors.white),),
            // ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                productProvider.deleteAllProduct();
                Navigator.pop(context);
              },
              child: const Text(
                'Delete All Products',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
