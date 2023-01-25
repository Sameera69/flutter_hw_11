import 'package:flutter/material.dart';
import 'package:flutter_application_11/Pages/ProductClass.dart';
import 'package:flutter_application_11/Pages/ProductDetails.dart';

class HomePage extends StatelessWidget {
  Product P = Product('', 0, '', '');
  List<Product> Products;
  HomePage({required this.Products});

  @override
  Widget build(BuildContext context) {
    Products = Products;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Text(
                    'Low Price',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i in Products) ProductList(i),
                  ],
                ),
              ),
            ),
            Catigories(
                T: 'Vegetables seeds', I: 'https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063__480.jpg'),
            Catigories(
                T: 'Fruits seeds', I: 'https://cdn.pixabay.com/photo/2017/05/11/19/44/fresh-fruits-2305192__480.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Text(
                    'Comments',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Comments(),
                    SizedBox(
                      width: 20,
                    ),
                    Comments(),
                    SizedBox(
                      width: 20,
                    ),
                    Comments(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Catigories extends StatelessWidget {
  String T = '';
  String I = '';
  Catigories({required this.T, required this.I});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          I,
          width: 400,
          height: 400,
        ),
        Positioned(
          top: 300,
          child: Container(
            width: 400,
            color: Colors.white,
            child: Text(
              T,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class Comments extends StatefulWidget {
  const Comments();

  @override
  State<Comments> createState() => _Comments();
}

class _Comments extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold()));
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        // padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.circle),
                  Column(
                    children: const [
                      Text(
                        //widget.STitle,
                        'title',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        //widget.Owner,
                        'HOW',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Text(
                  //widget.STitle,
                  'Comment',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  Product P = Product('', 0, '', '');
  ProductList(this.P);

  @override
  State<ProductList> createState() => _Story();
}

class _Story extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductD(P: widget.P)));
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          // padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.P.PImage,
                      width: 160,
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(40))),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          //'${widget.time} min',
                          'new',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.P.PTitle,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.P.price.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
