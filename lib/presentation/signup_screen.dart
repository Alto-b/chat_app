// import 'package:chat_app/presentation/login_screen.dart';
// import 'package:flutter/material.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {

//   final TextEditingController _name = TextEditingController();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return  Scaffold(
//       appBar: AppBar(),
//       body:Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _name,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person_pin_outlined,color: Colors.grey,),
//                   hintText: "Name",
//                   border: OutlineInputBorder()
//                 ),
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 controller: _email,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
//                   hintText: "Email id",
//                   border: OutlineInputBorder()
//                 ),
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 controller: _password,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.password_outlined,color: Colors.grey,),
//                   hintText: "Password",
//                   border: OutlineInputBorder()
//                 ),
//               ),
//               SizedBox(height: 30,),
//               Container(
//                 width: size.width/2,
//                 child: ElevatedButton(onPressed: (){}, child: Text("SignUp",style: TextStyle(
//                   color: Colors.white
//                 )),style: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 4, 133, 240))
//                 ),)),
//               SizedBox(height: 20,),
//               TextButton(onPressed: (){
//                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
//               }, child: Text("Already has an account ?"))

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }