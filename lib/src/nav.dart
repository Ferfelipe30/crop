import 'package:crop/src/home.dart';
import 'package:crop/src/newProduct.dart';
import 'package:crop/src/shop.dart';
import 'package:crop/src/user.dart';
import 'package:flutter/material.dart';

class navPage extends StatefulWidget {
  const navPage({super.key});

  @override
  State<navPage> createState() => navPageState();
}

class navPageState extends State<navPage> {
  int _currentIndex = 0;
  final List<Widget> children = [
    const homePage(),
    const shopPage(),
    const newProductPage(),
    const userPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        backgroundColor: const Color.fromRGBO(238, 177, 27, 1),
        selectedItemColor: const Color.fromRGBO(50, 35, 12, 1),
        items: const <BottomNavigationBarItem>[
          //Boton home
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //Boton shop
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop',
          ),
          //Boton newProduct
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'NewProduct',
          ),
          //Boton user
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
