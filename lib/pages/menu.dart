import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';
import 'package:untitled/services/menuCard.dart';
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "Oshi no Ko", price: 500.99),
    Product(productName: "Dragon Quest", price: 600.99),
    Product(productName: "Magic and Muscle", price: 900.99),
    Product(productName: "Slam Dunk", price: 950.99),
    Product(productName: "Kingdom", price: 800.99),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.black87,
        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(9.0),
        child: Column(
          children: products.map((product) => Menucard(product: product)).toList(),
        ),
      )
    );
  }
}
