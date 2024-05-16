import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Model/CategoriesModel.dart';
import 'package:vilfresh/Model/HomeModel.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Categories_Screen extends ConsumerStatefulWidget {
  List<ShopByCategories>? shopByCategories;
  int initialIndex;

  Categories_Screen(
      {super.key, required this.shopByCategories, required this.initialIndex});

  @override
  _Categories_ScreenState createState() => _Categories_ScreenState();
}

class _Categories_ScreenState extends ConsumerState<Categories_Screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: widget.shopByCategories?.length ?? 0,
        vsync: this,
        initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround1,
      appBar: Custom_AppBar(
        title: 'Categories ',
        actions: [
          Icon(
            Icons.search,
            size: 28,
            color: green2,
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 20),
              height: 35,
              width: 35,
              child: ImgPathSvg("wallet.svg")),
        ],
        isNav: true,
        isGreen: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            TabBar(
              controller: _tabController,
              dividerColor: backGround1,
              isScrollable: true,
              padding: EdgeInsets.only(left: 5, right: 5),
              labelColor: green2,
              labelStyle: productPrice,
              // labelStyle: TabT,
              indicator: BoxDecoration(
                  color: green3, borderRadius: BorderRadius.circular(10)),
              indicatorColor: green2,
              unselectedLabelColor: green2,
              unselectedLabelStyle: productPrice,
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (value) {
                print(value);
              },
              tabs:
                  List.generate(widget.shopByCategories?.length ?? 0, (index) {
                return Container(
                  child: Tab(
                    text: widget.shopByCategories?[index].catgName ?? "",
                  ),
                );
              }),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(widget.shopByCategories?.length ?? 0,
                    (index) {
                  final _categoriesData = ref.watch(CategoriesProvider(
                      widget.shopByCategories?[index].catgID ?? ""));

                  return _categoriesData.when(
                    data: (data) {
                      return Center(child: _vfBasketList(data?.data ?? []));
                    },
                    error: (Object error, StackTrace stackTrace) {
                      return Text(error.toString());
                    },
                    loading: () => Center(child: CircularProgressIndicator()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //VF BASKET LIST
  Widget _vfBasketList(List<CategoryData> data) {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Categories_List(context, data[index]),
            ),
          );
        });
  }
}
