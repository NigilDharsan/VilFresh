import 'package:flutter/material.dart';
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
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 15),
                child: Text("Farmer Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.green.shade900),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 15),
                child: Center(child: Image.asset("lib/assets/nammalvar.png",height: 250,width: 250,)),
              ),
              Center(child: Text("Dr.Namalvar",style:TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.green.shade700) ,)),
              SizedBox(height: 20,),
              Text("G Nammalvar was one of a kind, a messiah of farmers who was revered as a saint-teacher by his followers. He was an agriculture scientist, a graduate of Annamalai University, who left a government job at the research station at Kovilpatti when he realised that he could do nothing for the resource-poor farmers who depend on rains to cultivate their parched land. Thus began an odyssey of half a century when Nammalvar travelled across Tamil Nadu spreading the message of organic farming in his gentle style of story-telling to make farmers understand what is good for them. “By using chemical fertilisers,” Nammalvar said early on, “I found that farmers incurred only losses and costs went up. I realised then that in order to get optimal results in farming, farmers should rely minimally on external inputs like fertilisers. This was a turning point in my life.”Here, organic farmer Ramasamy Selvam who first met Nammalvar in 1993, talks about his association with this icon of sustainable farming who passed away on December 30, 2013, while leading a campaign against the plan to extract methane gas in Cauvery delta. He was 75. Every politician of note in Tamil Nadu, from Chief Minister J Jayalalithaa to Vaiko of MDMK, mourned his death as “an irreparable loss”.",style: TextStyle(color: Colors.black,fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
