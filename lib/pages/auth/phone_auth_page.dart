import 'package:authenticate/pages/auth/otp_verify_page.dart';
import 'package:authenticate/utils/utils.dart';
import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  TextEditingController phoneController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  void loginWithPhone() {
    setState(() {
      loading = true;
    });
    _auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (_) {
          setState(() {
            loading = false;
          });
        },
        verificationFailed: (e) {
          setState(() {
            loading = false;
          });
          Utils().toastMeassage(e.toString());
        },
        codeSent: (verificationId, int? token) {
          setState(() {
            loading = false;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OtpVerifyPage(verificationId: verificationId)));
        },
        codeAutoRetrievalTimeout: (e) {
          setState(() {
            loading = false;
          });
          Utils().toastMeassage(e.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Phone Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(

              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: '+919099*****',
                  suffixIcon: Icon(Icons.phone_android_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            SizedBox(
              height: 25,
            ),
            Button(
              title: 'Login',
              voidCallback: loginWithPhone,
              loading: loading,
            )
          ],
        ),
      ),
    );
  }
}
