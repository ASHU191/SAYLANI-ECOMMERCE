import 'package:e_commerce/Screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/Screens/homepage.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final email =TextEditingController();
    final passwordd =TextEditingController();

    void login ()async{
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.text,
    password: passwordd.text,
  );
  Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
} on FirebaseAuthException catch (e) {
  String errorMessage;
  if (e.code == 'user-not-found') {
    errorMessage='No user found for that email.';
  } else if (e.code == 'wrong-password') {
    errorMessage='Wrong password provided for that user.';
  }else {
        errorMessage = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );

}
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
    //         Container(
    //           height: size.height*0.4,
    //           decoration: const BoxDecoration(
    //             // color: Colors.blue,
    //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
    //             image:DecorationImage(image: AssetImage("assets/images/mainimage.jpg"),fit: BoxFit.cover),
    //             boxShadow: [
    // BoxShadow(
    //   color: Colors.grey,
    //   spreadRadius: 5,
    //   blurRadius: 7,
    //   offset: Offset(0, 3), // changes position of shadow
    // ),
        // ], 
              // ),
            // ),
            SizedBox(
              height: size.height*0.07,
            ),
       
          
          Row(
            children: <Widget>[
        Expanded(
            child: Divider(
              color: Colors.black,
              height: size.height*0.036,
            )
        ),       
        
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Login",style:TextStyle(color: Colors.black,fontFamily: 'poppinsmedium')),
        ),        
        
        const Expanded(
            child: Divider(
              color: Colors.black,
            )
        ),
            ]
        ),
        
        Container(
          margin: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
          child: TextFormField(
            style:const TextStyle(
              color: Colors.black
            ),
            controller: email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText:"Enter Email",
              
              labelStyle: TextStyle(color:Colors.black,fontFamily: 'poppinsmedium',fontSize: 14),
              
          prefixIcon: Icon(Icons.mail,color: Colors.grey,),
           focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            
          ),
          
            ),
          ),
          
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0,right: 16),
          child: TextFormField(
                   obscureText: true,
              style:const TextStyle(
              color: Colors.black
            ),
            controller: passwordd,
            decoration: const InputDecoration(
              
              border: OutlineInputBorder(),
              labelText:"Enter password",
            
              labelStyle: TextStyle(color:Colors.black,fontFamily: 'poppinsmedium',fontSize: 14),
          prefixIcon: Icon(Icons.key,color: Colors.grey,),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
          ),
         
            ),
          ),
          
        ),
      SizedBox(height: size.height*0.01,),
    ButtonTheme(
      minWidth: size.width*0.9,
      child: OutlinedButton(
        
        onPressed: login,
         child: const Text("Log In",style: TextStyle(color: Colors.black,fontFamily: 'poppinsmedium'),
       
      
      )),
    ),
    
    TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Singup()));
    
    }, child: const Text("Create New Account",style: TextStyle(color: Colors.black)))
     
          ],
        ),
      ),
    );
  }
}