import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';

class selectedProduct extends StatefulWidget {
  final Product product;
  const selectedProduct({super.key, required this.product});

  @override
  State<selectedProduct> createState() => _selectedProductState();
}

class _selectedProductState extends State<selectedProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text('ORDER SELECTION'),
        backgroundColor: Colors.brown[200],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(widget.product.productName),
              Text(widget.product.description),
            ],
          ),
          Row(
            children: [
              Text(widget.product.price.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
