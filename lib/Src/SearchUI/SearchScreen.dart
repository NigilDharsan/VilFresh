import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Home%20Screen/Cart_Screen.dart';
import 'package:vilfresh/Src/Subscription_Detail_Ui/Subscription_Detail_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenScreenState();
}

class _SearchScreenScreenState extends ConsumerState<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  String searchText = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSearchResults(String query) {
    setState(() {
      searchText = query;
      //  ref.refresh(SearchItemsListProvider(query));
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchData = ref.watch(SearchItemsListProvider(searchText));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            // Handle back action
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: _filterSearchResults,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                        ),
                        searchText != ""
                            ? IconButton(
                                icon: Icon(Icons.clear, color: Colors.black54),
                                onPressed: () {
                                  _searchController.clear();
                                  _filterSearchResults('');
                                },
                              )
                            : Container(),
                        IconButton(
                          icon: Icon(Icons.mic, color: Colors.red),
                          onPressed: () {
                            // Handle voice search action
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: searchData.when(data: (data) {
          return data?.data != null
              ? ListView.builder(
                  itemCount: data?.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if ((data?.data?[index].type ?? "") ==
                            "Subscription Items") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Subscription_Detail_Screen(
                                        varient_ID: data?.data?[index].itemID,
                                        Item_Id: data?.data?[index].itemID,
                                      )));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cart_Screeen(
                                        Categories_Id:
                                            data?.data?[index].categoryID ?? "",
                                        Item_Id:
                                            data?.data?[index].itemID ?? "",
                                        Item_Name:
                                            data?.data?[index].itemName ?? "",
                                        deliveredDate: '',
                                        countUpdate: (index, qty) {},
                                      )));
                        }
                      },
                      title: Text(data?.data?[index].itemName ?? ""),
                      leading: Image.network(
                        data?.data?[index].image ?? "", // Placeholder image
                        width: 50,
                        height: 50,
                      ),
                      trailing: Icon(Icons.search),
                    );
                  },
                )
              : Center(
                  child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 300,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImgPathPng('nopreview.png'),
                        Text('No Search Items!'),
                      ],
                    ),
                  ),
                ));
        }, error: (Object error, StackTrace stackTrace) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImgPathPng('nopreview.png'),
                  Text('No Search Items!'),
                ],
              ),
            ),
          ));
        }, loading: () {
          return Center(child: CircularProgressIndicator());
        }));
  }
}
