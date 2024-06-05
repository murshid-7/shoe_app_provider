// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/add_provider.dart';
import 'package:shoezo3/controller/bottom_provider.dart';
import 'package:shoezo3/controller/product_provider.dart';
import 'package:shoezo3/model/shoe_model.dart';

class EditShoeScreen extends StatefulWidget {
  String name;
  String price;
  String? discription;
  int index;
  dynamic imagePath;
  final category;
  EditShoeScreen({
    super.key,
    required this.name,
    required this.price,
    this.discription,
    required this.index,
    required this.imagePath,
    this.category,
  });

  @override
  State<EditShoeScreen> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditShoeScreen> {
  TextEditingController nameEditController = TextEditingController();
  TextEditingController priceEditController = TextEditingController();

  File? selectedImage;
  @override
  void initState() {
    nameEditController = TextEditingController(text: widget.name);
    priceEditController = TextEditingController(text: widget.price);
    selectedImage = widget.imagePath != '' ? File(widget.imagePath) : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Details',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Consumer<AddProvider>(
                builder: (context, value, child) => CircleAvatar(
                    radius: 58,
                    backgroundImage: value.brand != null
                        ? Image.file(value.brand!).image
                        : const AssetImage(
                            'assets/NicePng_men-shoes-png_3611327.png')),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                style: const ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  pickImage(context);
                },
                label: const Text(
                  'Gallery',
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.image),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameEditController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter the Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: priceEditController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter the Price',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  editAll();

                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editAll() async {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    final pro = Provider.of<AddProvider>(context, listen: false);
    final existingCategory = widget.category;

    final name = nameEditController.text.trim();
    final price = priceEditController.text.trim();
    final image = pro.brand!.path;
    if (name.isNotEmpty || price.isNotEmpty) {
      final update = ShoeModel(
          id: 1,
          name: name,
          image: image,
          price: price,
          quantity: 1,
          catagory: existingCategory);
      productProvider.updateShoe(widget.index, update);
    } else {
      return;
    }
  }

  Future<void> pickImage(BuildContext context) async {
    final pro = Provider.of<AddProvider>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
