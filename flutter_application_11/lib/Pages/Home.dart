import 'package:flutter/material.dart';
import 'package:flutter_application_11/Pages/Cart.dart';
import 'package:flutter_application_11/Pages/HomePage.dart';
import 'package:flutter_application_11/Pages/ProductClass.dart';
import 'package:flutter_application_11/Pages/ProductDetails.dart';
import 'package:flutter_application_11/Pages/Profile.dart';

class MyHomePage extends StatefulWidget {
  Product P = Product('', 0, '', '');
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<Product> Products = <Product>[
  Product(
      'Herbal Strategi Just Out Herbal Lizard Repellent',
      27,
      'https://cdn.salla.sa/Aedxd/1eLyRC9t4ruzkgLoMOn6arsu9GAXAeugpNBEjCyi.jpg',
      'This is a description for the product that describe all its fetcher and usage for customer to use in there daily life and whenever they need'),
  Product(
      'Herbal Strategi Just Out Herbal Mosquito Repellent Room Spray',
      25,
      'https://cdn.salla.sa/Aedxd/izIx9SNHqUwoeNRlZRjH0UO3sc9idcN65FFJEbPH.jpg',
      'This is a description for the product that describe all its fetcher and usage for customer to use in there daily life and whenever they need'),
  Product(
      'Herbal Strategi Just Out Herbal Ant Repellent',
      27,
      'https://cdn.salla.sa/Aedxd/FU4D5KgCtf7LLUfFefLeVpCqshDlYRmEapMdjogR.jpg',
      'This is a description for the product that describe all its fetcher and usage for customer to use in there daily life and whenever they need'),
];

List<Product> CartProducts = <Product>[];

class _MyHomePageState extends State<MyHomePage> {
  var currentIndex = 0;
  onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CartPage(
                  Products: Products,
                  CartProducts: CartProducts,
                )));
  }

  var onPressed2;
  @override
  Widget build(BuildContext context) {
    Widget Body;
    if (currentIndex == 0) {
      Body = HomePage(Products: Products);
    } else if (currentIndex == 1) {
      Body = ProductD(P: widget.P);
    } else {
      Body = const ProfilePage();
    }
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) {
            currentIndex = newIndex;
            setState(() {});
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login_rounded),
              label: 'Login',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
        ),
        appBar: AppBar(actions: [
          IconButton(onPressed: onPressed, icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: onPressed2, icon: const Icon(Icons.search)),
          IconButton(onPressed: onPressed2, icon: const Icon(Icons.menu)),
        ]),
        backgroundColor: Colors.blueGrey,
        body: Body);
  }
}
