import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Phone Login',style: TextStyle(color: Colors.white  ,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextFormField(
              decoration: InputDecoration(
                hintText: '919099*****',
                  suffixIcon: Icon(Icons.phone_android_outlined),

                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
            ),
            SizedBox(height: 25,),
            CustomButton('Login')
          ],
        ),
      ),
    );
  }
}
