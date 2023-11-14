import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final user=FirebaseAuth.instance.currentUser?.email.toString();

   Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: () async {await FirebaseAuth.instance.signOut();}, icon: Icon(Icons.login))],title: Text("Home page"), centerTitle: true,),
      body: Center(
        child: Text("welcome $user"),
      ),
    );
  }
}
