import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Location_Screen extends ConsumerStatefulWidget {
  const Location_Screen({super.key});

  @override
  ConsumerState<Location_Screen> createState() => _Location_ScreenState();
}

class _Location_ScreenState extends ConsumerState<Location_Screen> {
  @override
  Widget build(BuildContext context) {
    final result = ref.watch(getCityApiProvider);

    return Scaffold(
        backgroundColor: backGround1,
        appBar: Custom_AppBar(
          title: 'Select Your City',
          actions: null,
          isNav: true,
          isGreen: false,
        ),
        body: result.when(
          data: (data) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemCount: data?.cities?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      await storeAddressData(
                          data?.cities?[index].cityName ?? "",
                          data?.cities?[index].cityID ?? "");

                      Navigator.pop(context, true);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: white1,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 0.5, color: grey2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 10, left: 10, right: 10),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "lib/assets/Sunset.jpeg"))),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                  data?.cities?[index].cityName ?? "",
                                  style: selectCity,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis
                                  ,
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
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
                    Text('Nothing here!'),
                  ],
                ),
              ),
            ));
          },
          loading: () => Center(child: CircularProgressIndicator()),
        ));
  }
}
