import 'package:b_donate/add_screen.dart';
import 'package:flutter/material.dart';


class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton:CircleAvatar(
        child: IconButton(icon:const Icon(Icons.add),onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DonarAddScreen(),));
        } ,),
      ) ,
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Blood Donation'),
      ),
      body:null ,
    );
  }
}