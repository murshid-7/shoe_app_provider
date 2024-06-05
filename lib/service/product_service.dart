import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoezo3/model/shoe_model.dart';

class ProductService {
  Future getAllShoes() async {
    final shoeDB = await Hive.openBox<ShoeModel>('name');
    return shoeDB.values.toList();
  }

  Future addShoes(ShoeModel value) async {
    final shoeDB = await Hive.openBox<ShoeModel>('name');
    return shoeDB.add(value);
  }

  Future deleteShoe(index) async {
    final shoeDB = await Hive.openBox<ShoeModel>('name');
    await shoeDB.deleteAt(index);
  }

  Future editShoes(index, ShoeModel value) async {
    final shoeDB = await Hive.openBox<ShoeModel>('name');
    await shoeDB.putAt(index, value);
  }

  Future deleteAllDataShoes() async {
    final shoeDB = await Hive.openBox<ShoeModel>('name');
    await shoeDB.clear();
  }
}
