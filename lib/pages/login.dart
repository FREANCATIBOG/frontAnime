import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.orange[100],
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0,),
                        child: Image(
                          image: AssetImage('assets/Kyuubi.jpg'),
                        ),
                      ),
                    )
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
                          label: Text('Email'),
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
                          label: Text('Password'),
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
                            print(email);
                            print(password);
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          }
                        },
                        child: Text('Log in'),
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
              ],
            ),
          ),
        )
    );
  }
}