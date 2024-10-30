import 'package:authenticate/pages/home_page.dart';
import 'package:authenticate/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
bool loading = false;
  void signUp() async{
    setState(() {
      loading = true;
    });

    FirebaseAuth _auth = FirebaseAuth.instance;
if(_formKey.currentState!.validate()){
  await _auth.createUserWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString()).then((value){
    setState(() {
      loading = false;
    });
Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }).onError((error, stackTraces){
    setState(() {
      loading = false;
    });
    Utils().toastMeassage(error.toString());
  });
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
          'Sign Up',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:
        Form(
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
                  }
                  else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }

                  return
                  null;

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
              Button(title: 'Sign Up', voidCallback: signUp, loading: loading,)
            ],
          ),
        ),
      ),
    );
  }
}
