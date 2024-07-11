import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/user.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool obscure = true;
  IconData ObscureIcon = Icons.visibility_off;

  Widget buttonContent = Text('Log in');

  Widget loadingDisplay = CircularProgressIndicator();

Future<bool>  login(User user) async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
     'Content-Type' : 'application/json; charset=UTF-8',
    },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail' : user.email,
        'password' : user.password
      }),
    );
    if(response.statusCode == 200){
      return true;
    }
    return false;
    //print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.purple[50],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Hajimemashite!',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.0,
                      fontSize: 24.5,
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Column(
                  children: [
                    Container(
                      color: Colors.black,
                        child: Image(
                          image: AssetImage('assets/AnimeApp.jpg'),

                        ),
                      ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text('Email:'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Your Email Please';
                          }
                        },
                        onSaved: (value){
                          email = value!;
                        },
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Password:'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'We need your Password';
                          }
                          if (value.length < 8) {
                            return 'Should be 8 characters long';
                          }
                          if(value.length >20){
                            return 'The Password must be 20 characters long';
                          }
                          return null;
                        },
                        onSaved: (value){
                          password = value!;
                        },
                      ),
                      SizedBox(height: 20.0,),
                      ElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            User user = User(
                              username: '',
                              email: email,
                              password: password
                            );
                           /*if(login(user)){
                              Navigator.pushReplacementNamed(context, '/dashboard');
                            }*/
                            setState(() {
                              buttonContent = FutureBuilder(
                                  future: login(user),
                                  builder:(context, snapshots){
                                    if(snapshots.connectionState == ConnectionState.waiting){
                                      return loadingDisplay;
                                    }
                                    if(snapshots.hasData){

                                    }
                                    return Text('Log in');
                                  }
                              );
                            });
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          }
                        },
                        child: buttonContent,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[800],
                          foregroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(height:30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Want to Create An Account?',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          InkWell(
                            child: Text(
                              'Create Here.',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown[600],
                              ),
                            ),
                            onTap: ()=> Navigator.popAndPushNamed(context, '/signup'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0,),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 5.0,),
                    Text(
                      'Or Sign Up with:',
                      style: TextStyle(
                        color: Colors.brown[800],
                      ),
                    ),
                    const SizedBox(width: 5.0,),
                    const Expanded(
                      child: Divider(
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[50],
                        foregroundColor: Colors.black,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/google-symbol.png'),
                          ),
                          SizedBox(width: 80.0,),
                          Text('Login via Google'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                        onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[200],
                        foregroundColor: Colors.white,
                      ),
                      child: const Row(
                        children: <Widget>[
                          Icon(Icons.facebook_sharp),
                          SizedBox(width: 80.0,),
                          Text('Login via Facebook')
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}