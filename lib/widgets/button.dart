import 'package:authenticate/pages/auth/phone_auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomButton(String title) {
  return SizedBox(
    height: 40,
    width: double.infinity,
    child: ElevatedButton(
      style:
          ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.deepPurple)),
      onPressed: () {

      },
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}
Widget CustomButton2(String title, BuildContext context) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PhoneAuthPage()));
      },
      child: Container(

        decoration: BoxDecoration(
            border: Border.all(width: 1.3),
            borderRadius: BorderRadius.circular(25)),
      child: Center(child: Text(title, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)),
    ),)
  );
}
