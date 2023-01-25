import 'package:flutter/material.dart';
import 'package:flutter_application_11/Pages/Cart.dart';
import 'package:flutter_application_11/Pages/HomePage.dart';
import 'package:flutter_application_11/Pages/ProductClass.dart';
import 'package:flutter_application_11/Pages/Profile.dart';

class ProductD extends StatefulWidget {
  Product P = Product('', 0, '', '');
  List<Product> Products = [];
  List<Product> CartProducts = [];
  ProductD({required this.P});

  @override
  State<ProductD> createState() => _ProductD();
}

class _ProductD extends State<ProductD> {
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
            Image.network(
              widget.P.PImage,
              width: 300,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      widget.P.PImage,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      widget.P.PImage,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      widget.P.PImage,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      widget.P.PImage,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      widget.P.PImage,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    widget.P.PTitle,
                    style: const TextStyle(color: Colors.blueGrey, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '${widget.P.price} SAR',
                    style: const TextStyle(color: Colors.blueGrey, fontSize: 15),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.favorite,
                    color: Colors.blueGrey,
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.CartProducts.add(widget.P);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage(
                              Products: widget.Products,
                              CartProducts: widget.CartProducts,
                            )));
                setState(() {});
              },
              child: const Text(
                'Add to Cart',
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
