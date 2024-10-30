import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback voidCallback;
  final bool loading;
  const Button(
      {super.key,
      required this.title,
      required this.voidCallback,
      this.loading = false
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ))),
    );
  }
}
