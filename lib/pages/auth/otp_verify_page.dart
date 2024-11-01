import 'package:authenticate/pages/home_page.dart';
import 'package:authenticate/utils/utils.dart';
import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpVerifyPage extends StatefulWidget {
  final String verificationId;
  const OtpVerifyPage({super.key, required this.verificationId});

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {

  bool loading = false;

  TextEditingController otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void verifyOtp() async{
    setState(() {
      loading = true;
    });
    final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpController.text);

    try{
      setState(() {
        loading = false;
      });
      await _auth.signInWithCredential(credential);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }
    catch(e){
      setState(() {
        loading = false;
      });
      Utils().toastMeassage(e.toString());
    }

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
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: '919099*****',
                  suffixIcon: Icon(Icons.phone_android_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            SizedBox(
              height: 25,
            ),
            Button(title: 'Login', voidCallback: verifyOtp, loading: loading,)
          ],
        ),
      ),
    );
  }
}
