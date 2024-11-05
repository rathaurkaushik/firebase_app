

import 'package:authenticate/utils/utils.dart';
import 'package:authenticate/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool loading = false;
  TextEditingController postController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  void addPosts() async{
   setState(() {
     loading = true;
   });
   try{

     await databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
       'title' : postController.text.toString(),
       'id': DateTime.now().millisecondsSinceEpoch.toString()
     });
     setState(() {
       loading = false;
     });
     Utils().toastMeassage('Post Add');
   }
   catch(e){
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
            ),
            ),
            SizedBox(height: 20,),
            Button(title: 'Add', voidCallback: addPosts, loading: loading,)
          ],
        ),
      ),
    );
  }
}
