import 'package:flutter/material.dart';
import 'package:flutter_application_11/Pages/Home.dart';
import 'package:flutter_application_11/Pages/HomePage.dart';
import 'package:flutter_application_11/Pages/ProductClass.dart';
import 'package:flutter_application_11/Pages/ProductDetails.dart';
import 'package:flutter_application_11/Pages/Profile.dart';

class CartPage extends StatefulWidget {
  Product P = Product('', 0, '', '');
  List<Product> Products;
  List<Product> CartProducts = [Product('', 0, '', '')];
  CartPage({
    required this.Products,
    required this.CartProducts,
  });

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  var currentIndex = 0;
  onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CartPage(
                  Products: widget.Products,
                  CartProducts: widget.CartProducts,
                )));
  }

  String calTotal() {
    num total = 0;
    for (var i in CartProducts) {
      total = total + i.price;
    }
    return total.toString();
  }

  @override
  Widget build(BuildContext context) {
    Widget Body;

    if (currentIndex == 0) {
      Body = HomePage(Products: widget.Products);
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
        IconButton(onPressed: onPressed, icon: const Icon(Icons.search)),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.menu)),
      ]),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Home / New / Title',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              ],
            ),
            for (var i in CartProducts) CartProduct(Ptitle: i.PTitle, Price: i.price),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total items',
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          Text(
                            widget.CartProducts.length.toString(),
                            style: const TextStyle(color: Colors.green, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total items amount',
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          Text(
                            //calTotal(),
                            '27',
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text(
                'Submit order',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartProduct extends StatefulWidget {
  String Ptitle = '';
  String Price = '';
  CartProduct({required this.Ptitle, required this.Price});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    widget.Ptitle,
                    style: const TextStyle(color: Colors.green, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  Text(
                    widget.Price,
                    style: const TextStyle(color: Colors.green, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  Text(
                    widget.Price,
                    style: const TextStyle(color: Colors.green, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
