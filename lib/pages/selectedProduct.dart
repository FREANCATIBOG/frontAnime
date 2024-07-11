import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';

class selectedProduct extends StatefulWidget {
  final Product product;
  const selectedProduct({super.key, required this.product});

  @override
  State<selectedProduct> createState() => _selectedProductState(product: product);
}

class _selectedProductState extends State<selectedProduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;

  _selectedProductState({required this.product});

  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            'Your Order',
                style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25.0,
            color: Colors.black
        ),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 5.0,),
              Image.network(widget.product.url),
              SizedBox(height: 5.0,),
              Text(
                  widget.product.productName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 5.0,),
              Container(
                padding: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                color: Colors.purple[50],
                child: Text(
                    widget.product.description,
                    style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color: Colors.black
                ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0,),
          Column(
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[200],
                  foregroundColor: Colors.white,
                ),
                child: const Row(
                  children: <Widget>[
                    Icon(Icons.shopping_bag),
                    SizedBox(width: 80.0,),
                    Text('Add This To Your Purchase')
                  ],
                ),
              ),
              SizedBox(height: 3.0,),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[200],
                  foregroundColor: Colors.white,
                ),
                child: const Row(
                  children: <Widget>[
                    Icon(Icons.add_shopping_cart),
                    SizedBox(width: 80.0,),
                    Text('Request for A Copy of Product'),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.grey,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₱ ${totalAmount.toString()}',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        if(numberOfOrders > 1 ){
                          numberOfOrders -= 1;
                          totalAmount = product.price * numberOfOrders;
                        }
                      });
                    },
                        icon: Icon(Icons.remove)
                    ),
                    Text(
                      numberOfOrders.toString(),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    IconButton(
                        onPressed: (){
                          setState(() {
                            numberOfOrders += 1;
                            totalAmount = product.price * numberOfOrders;
                          });
                        },
                        icon: Icon(Icons.add)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
