// import 'package:any_link_preview/any_link_preview.dart';
// import 'package:chat_app/presentation/signup_screen.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   bool isLoading = false;

//   final String _url1 = "https://www.youtube.com/watch?v=mepWc1QBNO4&list=UULFoGHeFY7jE2OB_TJS_87MOA"; 
//   final String _url2 = "https://pub.dev/packages/any_link_preview";


//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [    

//               AnyLinkPreview(
//                 link: _url1,
//                 displayDirection: UIDirection.uiDirectionHorizontal, 
//                 cache: Duration(hours: 1), 
//                 backgroundColor: Colors.grey[300], 
//                 errorWidget: Container(
//                   color: Colors.grey[300], 
//                   child: Text('Oops!'), 
//                 ),
//                 ),

   
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
//                 child: ElevatedButton(onPressed: (){}, child: Text("Login",style: TextStyle(
//                   color: Colors.white
//                 )),style: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 4, 133, 240))
//                 ),)),
//               SizedBox(height: 20,),
//               TextButton(onPressed: (){
//                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignUpScreen(),), (route) => false);
//               }, child: Text("SignUp"))

//             ],
//           ),
//         ),
//       ),
//     );

//   }
// }