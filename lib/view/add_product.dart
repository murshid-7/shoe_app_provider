import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoezo3/controller/add_provider.dart';
import 'package:shoezo3/controller/product_provider.dart';
import 'package:shoezo3/model/shoe_model.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AddProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 233, 232),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black.withOpacity(0.9),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Add Product'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<AddProvider>(
                builder: (context, value, child) => Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.black, width: 2),
                    image: value.brand != null
                        ? DecorationImage(
                            image: FileImage(value.brand!),
                            fit: BoxFit.contain,
                          )
                        : const DecorationImage(
                            image: AssetImage('assets/4.png'),
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              GestureDetector(
                onTap: () {
                  pickImage(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add Image',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: addProvider.nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: addProvider.priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: addProvider.discriptionController,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // DropdownButton(
              //     value: dropdown,
              //     items: items.map((String items) {
              //       return DropdownMenuItem(value: items, child: Text(items));
              //     }).toList(),
              //     onChanged: (value) {
              //       addProvider.selectCategory = value.toString();
              //     }
              //     //  (String? newValue) {
              //     //   setState(() {
              //     //     dropdown = newValue!;
              //     //   });
              //     // }

              //     ),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null) {
                    return 'pick a brand';
                  } else {
                    return null;
                  }
                },
                value: addProvider.selectCategory,
                items: addProvider.category.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (value) {
                  addProvider.selectCategory = value.toString();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 225, 227, 234),
                  hintText: 'pick a brand',
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  onAddShoe(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddShoe(context) async {
    final addProvider = Provider.of<AddProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final pickedImage = addProvider.brand;
    final name = addProvider.nameController.text.trim();
    final price = addProvider.priceController.text.trim();
    final discription = addProvider.discriptionController.text.trim();

    if (name.isNotEmpty || price.isNotEmpty || discription.isNotEmpty) {
      final shoe = ShoeModel(
        name: name,
        image: pickedImage!.path,
        price: price,
        quantity: 1,
        catagory: addProvider.selectCategory,
      );
      productProvider.addShoe(shoe);

      addProvider.clearControllers();
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
