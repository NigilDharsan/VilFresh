import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Image_Picker.dart';
import 'package:vilfresh/Model/ProductDescriptionModel.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
class Farmer_Detail_Screen extends StatefulWidget {
  List<AboutFarmerData>? aboutFarmerData;
   Farmer_Detail_Screen({super.key,required this.aboutFarmerData});

  @override
  State<Farmer_Detail_Screen> createState() => _Farmer_Detail_ScreenState();
}

class _Farmer_Detail_ScreenState extends State<Farmer_Detail_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.green.shade900,)),
        title: Text("Know your Farmer",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.green.shade900),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.account_balance_wallet,color: Colors.green.shade900,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //FARMER DETAIL
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 15),
                child: Text("Farmer Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color:green2),),
              ),
              //FARMER IMAGE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _farmerImg(context,FarmerImg: widget.aboutFarmerData?[0].farmerImage ?? ""),
                  _farmerImg(context,FarmerImg: widget.aboutFarmerData?[0].farmerImage ?? ""),
                ],
              ),
              const SizedBox(height: 20,),
              //FARMER NAME
              Center(child: Text(widget.aboutFarmerData?[0].farmerName ?? "",style:TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: green1) ,)),
              const SizedBox(height: 20,),
              Text(widget.aboutFarmerData?[0].aboutFarmer ?? "",style: TextStyle(color: Colors.black,fontSize: 16),),
              const SizedBox(height: 20,),
              Container(
                height: 220,
                  child: _FarmerRelatedList()),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
  //FARMER RELATED LIST
  Widget _FarmerRelatedList(){
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return               Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Related_Farmer_List(),
        );

      },);
  }
}


//FARMER IMAGE
Widget _farmerImg(context,{required String FarmerImg}){
  return Container(
    width: MediaQuery.sizeOf(context).width/2.5,
    height: MediaQuery.sizeOf(context).height/2,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2,color: green2),
    ),
    child: buildImage(FarmerImg, border: Radius.circular(20), fit: BoxFit.cover),
  );
}