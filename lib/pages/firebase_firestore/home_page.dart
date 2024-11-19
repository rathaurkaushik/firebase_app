import 'package:authenticate/pages/auth/login_page.dart';
import 'package:authenticate/pages/firebase_firestore/add_post.dart';
import 'package:authenticate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageFirestore extends StatefulWidget {
  const HomePageFirestore({super.key});

  @override
  State<HomePageFirestore> createState() => _HomePageFirestoreState();
}

class _HomePageFirestoreState extends State<HomePageFirestore> {
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Firestore No sql',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
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
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Utils().toastMeassage('Some Error');
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final title =
                        snapshot.data!.docs[index]['title'].toString();
                    if (searchController.text.isEmpty) {
                      return ListTile(
                        title: Text(
                            snapshot.data!.docs[index]['title'].toString()),
                        subtitle:
                            Text(snapshot.data!.docs[index]['id'].toString()),
                      );
                    } else if (title.toLowerCase().contains(
                        searchController.text.toLowerCase().toLowerCase())) {
                      return ListTile(
                          title: Text(
                              snapshot.data!.docs[index]['title'].toString()),
                          subtitle: Text(
                              snapshot.data!.docs[index]['id'].toString()));
                    } else {
                      Container();
                    }
                  },
                  itemCount: snapshot.data!.docs.length,
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 130.0),
        child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPostFirestore()));
            }),
      ),
    );
  }
}
