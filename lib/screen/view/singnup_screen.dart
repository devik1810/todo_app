import 'package:flutter/material.dart';

import '../../utils/sharedPrefrence.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff44B6B5),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "TODO Signup",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: txtemail,
                decoration: InputDecoration(
                  label: Text(
                    "Email",
                    style: TextStyle(color: Color(0xff44B6B5)),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xff44B6B5),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff44B6B5), width: 1),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: txtpassword,
                decoration: InputDecoration(
                  label: Text(
                    "Password",
                    style: TextStyle(color: Color(0xff44B6B5)),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Color(0xff44B6B5)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff44B6B5), width: 1),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var email = txtemail.text;
                  var password = txtpassword.text;
                  Shr shr = Shr();
                  shr.creatShr(email, password);
                  Navigator.pop(context);
                },
                child: Text("Signup"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff44B6B5)),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
