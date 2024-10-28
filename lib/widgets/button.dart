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
