import 'package:flutter/material.dart';
import 'package:shoezo3/model/shoe_model.dart';
import 'package:shoezo3/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ShoeModel> shoeList = [];
  List<ShoeModel> searchList = [];

  TextEditingController searchController = TextEditingController();

  ProductService productService = ProductService();

  Future<void> getAllProducts() async {
    shoeList = await productService.getAllShoes();
    notifyListeners();
  }

  Future<void> addShoe(ShoeModel shoe) async {
    await productService.addShoes(shoe);
    getAllProducts();
  }

  Future<void> deleteShoe(index) async {
    await productService.deleteShoe(index);
    getAllProducts();
  }

  Future<void> updateShoe(index, ShoeModel value) async {
    await productService.editShoes(index, value);
    getAllProducts();
  }

  Future<void> deleteAllProduct() async {
    await productService.deleteAllDataShoes();
    getAllProducts();
  }

  void search(String value) {
    if (value.isEmpty) {
      searchList = [];
    } else {
      searchList = shoeList
          .where((ShoeModel shoe) =>
              shoe.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

    double productTotalPrice() {
    
    double total = 0;
    for (var item in shoeList) {
      total += double.parse(item.price);
    }
    return total;
  }
}
