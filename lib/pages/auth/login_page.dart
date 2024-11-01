import 'package:authenticate/pages/auth/phone_auth_page.dart';
import 'package:authenticate/pages/auth/signUp_page.dart';
import 'package:authenticate/pages/home_page.dart';
import 'package:authenticate/utils/utils.dart';
import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
// late bool loading;
  //login function
  void loginphone() {}
  void login() async {
    setState(() {
      loading = true;
    });
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        setState(() {
          loading = false;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      Utils().toastMeassage(e.toString()).toString();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Enter your email',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  validator: (value) {
                    setState(() {
                      loading = false;
                    });
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  }),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    suffixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                validator: (value) {
                  setState(() {
                    loading = false;
                  });
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 35,
              ),
              Button(
                title: 'Login',
                voidCallback: login,
                loading: loading,
              ),
              SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 30,),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneAuthPage()));
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Login with Phone',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Button(title: 'Login With Phone',voidCallback:  )
            ],
          ),
        ),
      ),
    );
  }
}
