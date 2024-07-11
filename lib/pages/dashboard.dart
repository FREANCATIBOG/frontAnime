import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'HOME',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),

      backgroundColor: Colors.purple[50],
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: (){Navigator.pushNamed(context, '/menu');},
                    child: Container(
                      height: 300,
                      width: 300,
                      child: Image(
                        image: AssetImage('assets/Tomie.jpg'),
                      ),
                    )
                ),
            TextButton(
                onPressed: (){Navigator.pushNamed(context, '/profile');},
                child: Container(
                  height: 300,
                  width: 300,
                  child: Image(
                    image: AssetImage('assets/hunter.jpg'),
                  ),
                )
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
