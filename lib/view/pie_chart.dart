import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/cart_provider.dart';
import 'package:shoezo3/controller/product_provider.dart';
import 'package:shoezo3/widgets/bottom_nav.dart';

class MyPieChart1 extends StatelessWidget {
  const MyPieChart1({Key? key});

  @override
  Widget build(BuildContext context) {
    // getAllShoes();

    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    productProvider.getAllProducts;
    cartProvider.getAllCart();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomNav()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            const Text(
              'Product Chart',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.amber[50],
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: PieChart(PieChartData(sections: [
                      PieChartSectionData(
                        value: cartProvider.totalPrice,
                        color: Colors.blue,
                        showTitle: true,
                        title: '${cartProvider.totalPrice}',
                        titleStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                        titlePositionPercentageOffset: 1.6,
                      ),
                      PieChartSectionData(
                        value: productProvider.productTotalPrice(),
                        color: Colors.red,
                        showTitle: true,
                        title: '${productProvider.productTotalPrice()}',
                        titleStyle: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                        titlePositionPercentageOffset: 1.6,
                      ),
                      // PieChartSectionData(value: 36, color: Colors.amber),
                      // PieChartSectionData(value: 20, color: Colors.green)
                    ])),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 35,
                        margin: const EdgeInsets.only(bottom: 30),
                        color: Colors.red,
                        child: const Text('All Products total',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                      const SizedBox(width: 30),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 35,
                        margin: const EdgeInsets.only(bottom: 30),
                        color: Colors.blue,
                        child: const Text('Cart total ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Text(
              'BRANDS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
