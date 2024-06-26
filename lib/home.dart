import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
class Home extends StatefulWidget {
  const Home({super.key});
@override
State<Home>  createState() => _HomeState();

}
class _HomeState extends State<Home> {
  int year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.red[600],
        centerTitle: true,
      ),
      body:  Padding(
        padding:EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/woman.png'),
                    backgroundColor: Colors.red[600],

                    radius: 60.0,
                  ),
                ),
                Divider(
                  height: 55.0,
                  color: Colors.black54,
                  thickness: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_2,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'NAME',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'FREAN R. CATIBOG',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_sharp,
                      color:Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'YEAR',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$year Year',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.email_sharp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'EMAIL',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'freanrajascatibog@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        year += 1;
                      });
                    },
                    child: Text('Add Year'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

