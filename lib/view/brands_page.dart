
import 'package:flutter/material.dart';
import 'package:shoezo3/view/brands/adidas.dart';
import 'package:shoezo3/view/brands/nike.dart';
import 'package:shoezo3/view/brands/puma.dart';

class BrandsLogo extends StatelessWidget {
  const BrandsLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        brandLogos(
            'https://seeklogo.com/images/P/puma-logo-9092D1BD56-seeklogo.com.png',
            () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>const PumaStore()));
        }),
        brandLogos(
            'https://seeklogo.com/images/A/adidas-logo-DE36EE9B0E-seeklogo.com.png',
            () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AdidasStore()));
        }),
        brandLogos(
            'https://seeklogo.com/images/N/Nike_Plus-logo-548F1B3E8F-seeklogo.com.png',
            () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const NikeStore()));
        }),
      ],
    );
  }
}

Widget brandLogos(String imagePath, Function() onPressed) {
  return Expanded(
    child: TextButton(
      onPressed: onPressed,
      child: Image.network(
        imagePath,
        width: 50,
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
  );
}
