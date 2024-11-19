import 'package:authenticate/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';

class AddPostFirestore extends StatefulWidget {
  const AddPostFirestore({super.key});

  @override
  State<AddPostFirestore> createState() => _AddPostFirestoreState();
}

class _AddPostFirestoreState extends State<AddPostFirestore> {
  bool loading = false;
  final postController = TextEditingController();
  final firebaseFirestore = FirebaseFirestore.instance.collection('users');

  void addPosts() async {
    setState(() {
      loading = true;
    });
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      await firebaseFirestore
          .doc(id)
          .set({'title': postController.text.toString(), 'id': id});
      Utils().toastMeassage('Post Added');
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      Utils().toastMeassage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Add Post',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: postController,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "Add Posts",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              title: 'Add',
              voidCallback: addPosts,
              loading: loading,
            )
          ],
        ),
      ),
    );
  }
}
