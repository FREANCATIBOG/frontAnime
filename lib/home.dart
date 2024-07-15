import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
            'User Profile',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
            ),
        ),
        backgroundColor: Colors.brown[50],
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                  child: ExpandableCarousel(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                    ),
                    items: [
                      'assets/Hunter Hunter.jpg',
                      'assets/Junji.jpg',
                      'assets/Kyuubi.jpg',
                      'assets/AnimeApp.jpg',
                    ].map((String imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.pink
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                ),
                              )
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Divider(
                  height: 55.0,
                  color: Colors.red[700],
                  thickness: 5.0,
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Icon(
                      Icons.person_2,
                      color: Colors.orange[900],
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'NAME',
                      style: TextStyle(
                        fontSize: 18.0,
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
                      color:Colors.orange[900],
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'YEAR',
                      style: TextStyle(
                        fontSize: 18.0,
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
                      color: Colors.orange[900],
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'EMAIL',
                      style: TextStyle(
                        fontSize: 18.0,
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


