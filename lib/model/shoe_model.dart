import 'package:hive_flutter/hive_flutter.dart';
part 'shoe_model.g.dart';

@HiveType(typeId: 1)
class ShoeModel {
  @HiveField(0)
   int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String price;
  @HiveField(4)
  final int quantity;
  @HiveField(5)
  final String? catagory;

  ShoeModel({
   this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.catagory,
  });
}
