import 'package:chat_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key});

  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _name,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            proceedButton(context,_name.text.trim());
          }, child: Text("Proceed"))
        ],
      ),
    );
  }
 void proceedButton(BuildContext context,String name)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('name', name);
  //  await Future.delayed(Duration(seconds: 3));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
  }
}