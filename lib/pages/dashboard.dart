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
                TextField(
                  decoration: InputDecoration(
                      label: Text(
                        'See What is on trend',
                        style: TextStyle(
                            color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Icon(
                          Icons.search_outlined,
                      ),
                      prefixIconColor: Colors.grey[900],
                      hintText: 'See What is on trend',
                      hintStyle: TextStyle(
                          color: Colors.grey[500]
                      ),
                      filled: true,
                      fillColor: Colors.blue[50],
                  ),
                ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(3.0, 30.0, 3.0, 5.0,),
                   ),
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
