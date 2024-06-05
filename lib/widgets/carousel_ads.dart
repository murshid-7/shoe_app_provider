
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget roundedCarousel() {
  return Column(
    children: [
      Container(
        margin:const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CarouselSlider(
            items: [
              Image.network(
                'https://img.freepik.com/free-vector/sale-banner-with-product-description_1361-1333.jpg?size=626&ext=jpg&ga=GA1.1.1009751488.1699960562&semt=ais',
                fit: BoxFit.fill,
              ),
              Image.network(
                  'https://img.freepik.com/premium-psd/black-friday-super-sale-web-banner-template_106176-1661.jpg?size=626&ext=jpg&uid=R64928966&ga=GA1.1.1009751488.1699960562&semt=ais',
                  fit: BoxFit.fill),
              Image.network(
                'https://img.freepik.com/free-vector/promotion-fashion-banner_1188-142.jpg?size=626&ext=jpg&ga=GA1.1.1009751488.1699960562&semt=ais',
                fit: BoxFit.fill,
              ),
              Image.network(
                'https://img.freepik.com/free-psd/black-friday-banner-with-discounts-3d-rendering_1419-2424.jpg?size=626&ext=jpg&uid=R64928966&ga=GA1.1.1009751488.1699960562&semt=ais',
                fit: BoxFit.fill,
              ),
            ],
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2,
                height: 270,
                viewportFraction: 1),
          ),
        ),
      ),
    ],
  );
}

