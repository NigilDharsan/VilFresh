import 'package:flutter/material.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
class Farmer_Detail_Screen extends StatefulWidget {
  const Farmer_Detail_Screen({super.key});

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
                  _farmerImg(),
                  _farmerImg(),
                ],
              ),
              const SizedBox(height: 20,),
              //FARMER NAME
              Center(child: Text("Dr.Namalvar",style:TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: green1) ,)),
              const SizedBox(height: 20,),
              Text("G Nammalvar was one of a kind, a messiah of farmers who was revered as a saint-teacher by his followers. He was an agriculture scientist, a graduate of Annamalai University, who left a government job at the research station at Kovilpatti when he realised that he could do nothing for the resource-poor farmers who depend on rains to cultivate their parched land. Thus began an odyssey of half a century when Nammalvar travelled across Tamil Nadu spreading the message of organic farming in his gentle style of story-telling to make farmers understand what is good for them. “By using chemical fertilisers,” Nammalvar said early on, “I found that farmers incurred only losses and costs went up. I realised then that in order to get optimal results in farming, farmers should rely minimally on external inputs like fertilisers. This was a turning point in my life.”Here, organic farmer Ramasamy Selvam who first met Nammalvar in 1993, talks about his association with this icon of sustainable farming who passed away on December 30, 2013, while leading a campaign against the plan to extract methane gas in Cauvery delta. He was 75. Every politician of note in Tamil Nadu, from Chief Minister J Jayalalithaa to Vaiko of MDMK, mourned his death as “an irreparable loss”.",style: TextStyle(color: Colors.black,fontSize: 16),),
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
Widget _farmerImg(){
  return Container(
    width: 160,
    height: 220,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2,color: green2),
        image: DecorationImage(image: AssetImage("lib/assets/nammalvar.png"),fit: BoxFit.cover)
    ),
  );
}