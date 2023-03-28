import 'package:b_donate/add_screen.dart';
import 'package:b_donate/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DonarAddScreen(),
                ));
          },
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Blood Donation'),
      ),
      body: StreamBuilder(
        stream: donor.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                return 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                      child: Text(donorSnap['group']),
                    ),
                
                        ],
                      ),
                      Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(donorSnap['name'],style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                          Text(donorSnap['age'].toString())
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: (){
                                Navigator.pushNamed(context, '/edit',arguments:{'name':donorSnap['name'],
                                'age':donorSnap['age'].toString(),'group':donorSnap['group'],'id':donorSnap.id
                                } );
                              }, icon: const Icon(Icons.edit,color: Colors.blue,)),
                            IconButton(onPressed: (){}, icon:const Icon(Icons.delete,color: Colors.red,)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
                // ListTile(
                //   leading: 
                //   title: 
                //   subtitle: ,
                //   trailing: Column(
                //     children: [
                //       Row(
                //         children: [
                //           IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                //           IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
