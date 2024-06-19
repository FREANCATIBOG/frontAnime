import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Anime App')
        ),
        backgroundColor: Colors.blueGrey,
      ),
          body: Center(
          child: Image.network('https://i.pinimg.com/736x/1b/64/11/1b6411cca6b0f131ffa925dacf4bc8a4.jpg'),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
          backgroundColor: Colors.brown,
        child: Icon(
          Icons.add,
          color: Colors.greenAccent,
        )
      ),
    ),
  ));
}

