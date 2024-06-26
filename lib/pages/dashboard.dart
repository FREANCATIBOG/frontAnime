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
        title: Text('HOME'),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent[200],
      ),
      backgroundColor: Colors.purple[50],
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/menu');
                  },
                  child: Text('GONNA GO TO MENU?'),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Text('GONNA GO TO PROFILE '),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
