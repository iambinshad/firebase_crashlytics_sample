import 'package:flutter/material.dart';

class SecondHomePage extends StatelessWidget {
  const SecondHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: TextButton(onPressed: (){
        throw const FormatException("Format Exception b_donate");
      }, child: const Text("create exception")),),
    );
  }
}