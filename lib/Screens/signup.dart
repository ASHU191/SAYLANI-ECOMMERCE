import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/Screens/login.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
     final emailone =TextEditingController();
    final passwordone =TextEditingController();

     void newacc ()async{
      try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailone.text,
    password: passwordone.text,
  );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
} 
on FirebaseAuthException catch (e) {
  String errorMessage;
  if (e.code == 'weak-password') {
    errorMessage='The password provided is too weak.';
  } else if (e.code == 'email-already-in-use') {
    errorMessage='The account already exists for that email.';
  }
  else{
    errorMessage='error';
  }
   ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
} catch (e) {
  print(e);
}
    }
    return Scaffold(
    backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     Container(
              //       height: size.height*0.4,
              //       decoration: const BoxDecoration(
              //         // color: Colors.blue,
              //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
              //         image:DecorationImage(image: AssetImage("assets/images/mainimage.jpg"),fit: BoxFit.cover),
              //          boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey,
              //             spreadRadius: 5,
              //             blurRadius: 7,
              //             offset: Offset(0, 3), // changes position of shadow
              //           ),
              //         ], 
              //       ),
                    
              //     ),
              //     IconButton(onPressed: (){
              //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
              //     },
              //     style: IconButton.styleFrom(
              //           backgroundColor: const Color(0xffF1F1F1),
              
              //         ), icon: const Icon(Icons.arrow_back))
              //   ],
              // ),
              
              SizedBox(height: size.height*0.05,),
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
            child: Text("Sign Up",style:TextStyle(color: Colors.black,fontFamily: 'poppinsmedium')),
          ),        
          
          const Expanded(
              child: Divider(
                color: Colors.black,
              )
          ),
              ]
          ),
              SizedBox(
                height: size.height*0.01,
              ),
             
          Container(
            margin: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
            child: TextField(
              style:const TextStyle(
                color: Colors.black,
              ),
              controller: emailone,
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
            child: TextField(
              obscureText: true,
                style:const TextStyle(
                color: Colors.black
              ),
              controller: passwordone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText:"Enter password",
                labelStyle: TextStyle(color:Colors.black,fontFamily: 'poppinsmedium',fontSize: 14),
            prefixIcon: Icon(Icons.key,color: Colors.grey,),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
            )
              ),
            ),
            
          ),
                SizedBox(height: size.height*0.01,),
              ButtonTheme(
                minWidth: size.width*0.9,
                child: OutlinedButton(
          
          onPressed: newacc,
           child: const Text("SignUp",style: TextStyle(color: Colors.black,fontFamily: 'poppinsmedium'),
                 
                
                )),
              ),
               
            ],
          ),
        ),
      ),
    );
  }
}