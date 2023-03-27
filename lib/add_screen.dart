import 'package:flutter/material.dart';

class DonarAddScreen extends StatefulWidget {
  const DonarAddScreen({super.key});

  @override
  State<DonarAddScreen> createState() => _DonarAddScreenState();
}

List<String> bloodGroupList = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'Others'];

var choosedBloodGroup ;
final bloodGroupController=TextEditingController();
final nameController = TextEditingController();
final ageController =TextEditingController();

class _DonarAddScreenState extends State<DonarAddScreen> {
  List<DropdownMenuItem<Object>> genderListObject = bloodGroupList
      .map((valueItem) =>
          DropdownMenuItem(value: valueItem, child: Text(valueItem)))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter Name'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(

              decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter Age'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              underline: const SizedBox(),
              isExpanded: true,
              disabledHint:  TextField(
                controller: bloodGroupController,
               
              ),
              hint: const Text('Select Gender'),
              items: genderListObject,
              value: choosedBloodGroup,
              onChanged: (newValue) {
                setState(() {
                  choosedBloodGroup = newValue;
                   bloodGroupController.text = newValue.toString();
                });          
                
              },

            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Add Donar',style:TextStyle(fontSize: 20),),style: ElevatedButton.styleFrom(padding: EdgeInsets.only(right: 100,left: 100,top: 15,bottom: 15)),)
        ],
      ),
    );
  }
}
