import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Login',
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
            CustomButton('Submit')
          ],
        ),
      ),
    );
  }
}
