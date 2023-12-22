import 'package:flutter/material.dart';
import 'package:vilfresh/Home%20Screen/Otp_Request_Screen.dart';
class SignIn_Screen extends StatefulWidget {
  const SignIn_Screen({super.key});

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100,bottom: 50),
            child: Center(child: Image.asset("lib/assets/greencart.png",height: 200,width: 200,)),
          ),
          Text("Freshly Produced ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30,color: Colors.green.shade900),),
          Text("ORGANIC",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 40,color: Colors.green.shade900),),
          Spacer(),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
            ),
            child:Padding(
              padding: const EdgeInsets.only(top: 100,left: 30,right: 30,bottom: 50),
              child: Container(
                 // height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white
                ),
                // width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 9,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(context) => const Otp_Request_Screen())
                    );
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize:30,fontWeight: FontWeight.w600,color: Colors.green.shade900),)
                  ),
                )
                // child: ElevatedButton(onPressed: () {  },
                // child: Center(child: Text("Sign In",style: TextStyle(fontSize:30,fontWeight: FontWeight.w600,color: Colors.green),))),
              ),
            ),

        ],
      ),
    );
  }
}
