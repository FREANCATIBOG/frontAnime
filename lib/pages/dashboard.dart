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
        backgroundColor: Colors.brown[400],
      ),
      backgroundColor: Colors.brown,
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: (){Navigator.pushNamed(context, '/menu');},
                    child: Container(
                      height: 350,
                      width: 350,
                      child: Image(
                        image: AssetImage('assets/Tomie.jpg'),
                      ),
                    )
                ),
            SizedBox(height: 10.0,),
            TextButton(
                onPressed: (){Navigator.pushNamed(context, '/profile');},
                child: Container(
                  height: 350,
                  width: 350,
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
