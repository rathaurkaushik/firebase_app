

import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                    hintText: 'Enter your email',
                    suffixIcon: Icon(Icons.email),

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: password,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    suffixIcon: Icon(Icons.password),

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),
              SizedBox(height: 35,),
              CustomButton('Sign Up')
            ],
          ),
        ),
      );
  }
}
