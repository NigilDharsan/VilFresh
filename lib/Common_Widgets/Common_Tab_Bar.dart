import 'package:flutter/material.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';

import 'Custom_App_Bar.dart';
import 'Text_Form_Field.dart';

class TabBarWithSearch extends StatefulWidget {
  const TabBarWithSearch({super.key});

  @override
  _TabBarWithSearchState createState() => _TabBarWithSearchState();
}

class _TabBarWithSearchState extends State<TabBarWithSearch>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white1,
      appBar: Custom_AppBar(
        actions: const [],
        title: '',
        isNav: false,
        isGreen: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              color: blue3,
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                controller: _tabController,
                padding: const EdgeInsets.only(left: 5, right: 5),
                labelColor: blue3,
                // labelStyle: TabT,
                indicator: BoxDecoration(
                    color: white5, borderRadius: BorderRadius.circular(10)),
                indicatorColor: white1,
                unselectedLabelColor: white1,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Container(
                    child: const Tab(
                      text: 'Door Step\n     Task',
                    ),
                  ),
                  Container(
                    child: const Tab(
                      text: 'Online\n  Task',
                    ),
                  ),
                  Container(
                    child: const Tab(
                      text: 'Emergency\n     Task',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 20),
              child: textFormFieldSearchBar(
                keyboardtype: TextInputType.text,
                hintText: "Search ...",
                Controller: null,
                validating: null,
                onChanged: null,
                onTap: null,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Center(child: Text('Tab 1 Content')),
                  Center(child: Text('Tab 2 Content')),
                  Center(child: Text('Tab 3 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
