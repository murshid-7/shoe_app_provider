// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezo3/main.dart';
import 'package:shoezo3/view/admin_page.dart';
import 'package:shoezo3/view/splash_screen.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> LogoutFuncion() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool(saveKey, false);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreen()));
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(''),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Murshid',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          drawerWidget(
              context: context,
              name: 'Admin',
              icon: Icons.person,
              ontap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminScreen()));
              }),
          // drawerWidget(
          //   context: context,
          //   name: 'Product Chart',
          //   icon: Icons.bar_chart,
          //   ontap: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => ProductChart()));
          //   },
          // ),
          // drawerWidget(
          //   context: context,
          //   name: 'Add your Product',
          //   icon: Icons.add,
          //   ontap: () {
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (context) => AddProduct()));
          //   },
          // ),
          drawerWidget(
            context: context,
            name: 'Logout',
            icon: Icons.logout,
            ontap: () {
              LogoutFuncion();
            },
          ),
        ],
      ),
    );
  }
}

DrawerBarTop() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      Row(
        children: const [],
      ),
    ],
  );
}

Widget drawerWidget({
  required context,
  required String name,
  required IconData icon,
  required Function() ontap,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(name),
      leading: Icon(icon),
      onTap: () {
        ontap();
      },
      tileColor: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
