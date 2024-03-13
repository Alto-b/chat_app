import 'package:chat_app/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String? a;

   TextEditingController _content = TextEditingController();

   final DatabaseReference databaseReference = FirebaseDatabase.instance.ref('messages');

   @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
     a =await pref.getString('name');
  }

  @override
  Widget build(BuildContext context) {

    getUser();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final DatabaseReference chatRef = FirebaseDatabase.instance.reference().child('messages');

    return Scaffold(
      appBar: AppBar(
        title: Text(a??"name"),
        actions: [
          IconButton(onPressed: ()async{
            SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('name', "");
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),), (route) => false);
          }, icon: Icon(Icons.logout))
        ],
      ),
    
      body: SingleChildScrollView(   
        child: Column(
          children: [
            Container(
              height: screenHeight-200,
              width: screenWidth,
              color: Colors.amber,
              child: StreamBuilder(
                stream: chatRef.onValue, 
                builder: (context,AsyncSnapshot<DatabaseEvent> snapshot) {
                  
                  if(snapshot.hasData){
                    Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];
                    list.clear();
                    list = map.values.toList();
                    return ListView.builder(
                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list[index]['content']),
                        subtitle: Text(list[index]['dateTime']),
                      );
                    },);
                  }
                  return CircularProgressIndicator();
                }, 
                ),

          ),Divider(),
            TextFormField(
              controller: _content,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  Map<String,dynamic> data = {
                      "senderId" : a,
                      "content_type" : "text",
                      "content" : _content.text.trim(),
                      "dateTime" : DateTime.now().toString()
                  };
                  sendMessageRealTime(data);
                  // sendFireStore();
                }, icon: Icon(Icons.send)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessageRealTime(Map<String,dynamic> data){
//     databaseReference.child('messages').set({
//         'messageId': 1,
//         'text': 'Hello, Firebase!'
// });

databaseReference.child('messages').push().set(data).whenComplete((){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("done")));
  _content.clear();
});

  }
  
  void sendFireStore()async{
    await FirebaseFirestore.instance.collection("messages")
    .doc()
    .set({
      "sender" : "1",
      "content" : "aaa"
    }).whenComplete((){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("done")));
    });
  }
}