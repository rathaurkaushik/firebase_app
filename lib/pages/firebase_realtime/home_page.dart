import 'dart:ffi';

import 'package:authenticate/pages/firebase_firestore/home_page.dart';
import 'package:authenticate/pages/firebase_realtime/add_post.dart';
import 'package:authenticate/pages/auth/login_page.dart';
import 'package:authenticate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ref = FirebaseDatabase.instance.ref('Post');
  TextEditingController searchController = TextEditingController();
  TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: Icon(Icons.logout_outlined),
            color: Colors.white,
          )
        ],
        centerTitle: true,
        title: Text(
          'Realtime Database',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body:
      Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
              child: FirebaseAnimatedList(
            query: ref,
            itemBuilder: (context, snapshot, animation, index) {
              final title = snapshot.child('title').value.toString();

              if (searchController.text.isEmpty) {
                return ListTile(
                  title: Text(snapshot.child('title').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),
                  trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert_outlined),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  leading: Icon(Icons.edit),
                                  title: Text('Edit'),
                                  onTap: () {
                                    showMyDialog(title,
                                        snapshot.child('id').value.toString());
                                  },
                                )),
                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  leading: Icon(Icons.delete_outline),
                                  title: Text('Delete'),
                                )),
                          ]),
                );
              } else if (title.toLowerCase().contains(
                  searchController.text.toLowerCase().toLowerCase())) {
                return ListTile(
                  title: Text(snapshot.child('title').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),
                );
              } else {
                return Container();
              }
            },
          )),

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0,vertical: 10),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageFirestore()));
              }, child: Text('Firestore', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.deepPurple)),

              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageFirestore()));
              }, child: Text('Image Firebase', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.deepPurple)),

              ),
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 130.0),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPost()));
            }),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editController.text = title;
    return showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: TextField(
                controller: editController,
              ),
            ),
            title: Text('Edit'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    try {
                      ref
                          .child(id)
                          .update({'title': editController.text.toString()});
                      Utils().toastMeassage('Edit successfully');
                      Navigator.pop(context);
                    } catch (e) {
                      Utils().toastMeassage(e.toString());

                    }
                  },
                  child: Text('Update'))
            ],
          );
        },
        context: context);
  }
}

//stream builder firebase connect

/*
Expanded(
child: StreamBuilder(
stream: ref.onValue,
builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
if (!snapshot.hasData) {
return CircularProgressIndicator();
} else {
Map<dynamic, dynamic> map =
snapshot.data!.snapshot.value as dynamic;
List<dynamic> list = [];
list.clear();
list = map.values.toList();
// print(list);
return ListView.builder(
itemCount: snapshot.data!.snapshot.children.length,
itemBuilder: (context, index) {
return ListTile(
title: Text(list[index]['title']),
subtitle: Text(list[index]['id']),
);
},
);
}
},
),
),
*/
