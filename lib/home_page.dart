import 'package:b_donate/second_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondHomePage(),));
      }, child: const Text("goto next page")),),
    );
  }
}