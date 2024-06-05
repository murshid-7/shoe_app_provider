import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Row ratingBar() {
  return Row(
    children: [
      RatingBar.builder(
        itemCount: 5,
        itemSize: 30,
        allowHalfRating: true,
        initialRating: 4,
        onRatingUpdate: (rating) {},
        itemBuilder: (context, _) {
          return const Icon(Icons.star, color: Colors.amber);
        },
      ),
      const SizedBox(width: 10),
      const Text(
        "4",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

SizedBox shoeSize() {
  return SizedBox(
    height: 45,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(right: 20),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.black),
              backgroundColor:
                  MaterialStateProperty.all(const Color.fromARGB(138, 255, 193, 7)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            child: const Text(
              "3",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    ),
  );
}

