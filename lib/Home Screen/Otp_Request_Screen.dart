import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vilfresh/Home%20Screen/Otp_Verfication_Screen.dart';
class Otp_Request_Screen extends StatefulWidget {
  const Otp_Request_Screen({super.key});

  @override
  State<Otp_Request_Screen> createState() => _Otp_Request_ScreenState();
}

class _Otp_Request_ScreenState extends State<Otp_Request_Screen> {
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
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50,bottom: 5),
                    child: Text("Enter Your Phone Number",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white),),
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      textCapitalization: TextCapitalization.none,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        hintText: "+91 ",
                        hintStyle: TextStyle(fontWeight:FontWeight.w500,fontSize: 20,color: Colors.green.shade900),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontWeight:FontWeight.w500,fontSize: 20,color: Colors.green.shade900),
                      keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a mobile number';
                          } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                            return 'Please enter a valid 10-digit mobile number';
                          }
                          return null;
                        }
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 9,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context) => const Otp_Verification_Screen())
                          );
                        },
                        child: Text(
                          "Send OTP",
                          style: TextStyle(fontSize:20,fontWeight: FontWeight.w500,color: Colors.green.shade900),)
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("By Signing up you agree to our privacy Policy and Terms & Condition of use",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
