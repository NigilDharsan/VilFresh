import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Subscribed_Details_Screen extends ConsumerStatefulWidget {

  final String? ItemId;

  const Subscribed_Details_Screen({super.key,required this.ItemId});

  @override
  ConsumerState<Subscribed_Details_Screen> createState() => _Subscribed_Details_ScreenState();
}

class _Subscribed_Details_ScreenState extends ConsumerState<Subscribed_Details_Screen> {
  List<List<int>> _data = List.generate(5, (index) => [0, 0]);
  String itemId = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemId = widget.ItemId ?? "";
  }

  void _increment(int index, int period) {
    setState(() {
      _data[index][period] = (_data[index][period] ?? 0) + 1;
    });
  }

  void _decrement(int index, int period) {
    setState(() {
      if ((_data[index][period] ?? 0) > 0) {
        _data[index][period] = (_data[index][period] ?? 0) - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final subscribeditemdetailList = ref.read(SubscribeditemdetailsProvider(itemId));
    return Scaffold(
      backgroundColor: backGround1,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        toolbarHeight: 40,
        backgroundColor: Colors.green.shade100,
        centerTitle: true,
        title: Text("Subscription Details", style: subscribedapp),
      ),
      body: subscribeditemdetailList.when(data: (data){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text("A1 Milk - 500 ML", style: subscribedHT2),
                ),
                Container(
                  color: green3,
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Day', style: appTitle2),
                      Text('Morning', style: appTitle2),
                      Text('Evening', style: appTitle2),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text("Aug", style: subscribedHT3),
                              const SizedBox(height: 5),
                              Text("15", style: subscribedHT3),
                              const SizedBox(height: 5),
                              Text("Wed", style: subscribedHT3),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () => _increment(index, 0), // 0 for morning
                                ),
                                Text("${_data[index][0]}", style: subscribedHT3),
                                IconButton(
                                  icon: Icon(Icons.horizontal_rule),
                                  onPressed: () => _decrement(index, 0), // 0 for morning
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () => _increment(index, 1), // 1 for evening
                                ),
                                Text("${_data[index][1]}", style: subscribedHT3),
                                IconButton(
                                  icon: Icon(Icons.horizontal_rule),
                                  onPressed: () => _decrement(index, 1), // 1 for evening
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // SUBMIT BUTTON
                Center(
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 3,
                    color: green3,
                    child: Center(child: Text("Submit", style: subscribedHT)),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      }, error: (Object error, StackTrace stackTrace){
        return Text("ERROR$error");
      }, loading: (){
        return Center(child: CircularProgressIndicator());
      })
    );
  }
}
