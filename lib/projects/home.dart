
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskproject/projects/storage_service.dart';

class Homepage extends StatefulWidget {

   Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;

  final user=FirebaseAuth.instance.currentUser?.email.toString();
  User? _user;
  void initState(){
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user=event;
      });
    });
  }

  final uservar=FirebaseAuth.instance.currentUser!.email.toString();
  // var finaluser=_user?uservar;

  @override
  Widget build(BuildContext context) {
    final storagee store=storagee();
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: () async {await FirebaseAuth.instance.signOut();}, icon: Icon(Icons.login))],title: Text("Home page"), centerTitle: true,),
      body: Column(
        children: [
          FutureBuilder(
              future: store.listFiles(),
              builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.items.length,
                  itemBuilder: (BuildContext context,int index){
                   return Padding(padding: EdgeInsets.all(8.0),
                     child:ElevatedButton(
                       onPressed: (){},
                       child:  Text(snapshot.data!.items[index].name),),
                    );
                  },
                ),
              );
            }
            if(snapshot.connectionState== ConnectionState.waiting || !snapshot.hasData ){
             print("no data");
              return CircularProgressIndicator();
            }
            return Container();
          }),
          ElevatedButton(onPressed: () async{

            final source = ImageSource.gallery;
            final pickedImage = await ImagePicker().pickImage(source: source);


            if(pickedImage==null){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("no file uploaded")));
            }else {
              final path = pickedImage.path;
              final fileName = pickedImage.name;
              // imgpath = fileName;
              // final serve = serv();
              // await store.uploadFile(path, fileName);

              print('Path is $path and filename is $fileName');
              await store.uploadFile(path, fileName);

            }
            // final platformFile = results?.files.single;
            // final name = platformFile?.name;
            // final pickedImage = await ImagePicker().pickImage(source: source);
            //
            // final bytes = platformFile?.bytes;
            //
            // print("name of file si $name");
            // final path=platformFile?.path;

            // if (kIsWeb) {
            //   print("name of file is $name");
            //   print("file bytes: $bytes");
            // } else {
            //   final path = platformFile?.path;
            //   print("file path is $path");
            //   print("name of file is $name");
            // }
            // final path=results?.files.single.path;
            // final name=results?.files.single.name;
            // print("filane oath si $path");


          }, child: Text("Upload File")),

          SizedBox(
            width:MediaQuery.of(context).size.width ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(_user!.photoURL!))),
                ),
                Text("hello ${_user!.email.toString()}!")
              ],
            ),
          )

        ],

      ),
    );
  }
}
