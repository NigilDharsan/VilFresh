import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vilfresh/Common_Widgets/Bottom_Navigation_Bar.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Common_Widgets/Location_Picker.dart';
import 'package:vilfresh/Home%20Screen/Cart_Screen.dart';
import 'package:vilfresh/Model/HomeModel.dart';
import 'package:vilfresh/Src/Categories_Ui/Categories_Screen.dart';
import 'package:vilfresh/Src/Home_DashBoard_Ui/LoginModel.dart';
import 'package:vilfresh/Src/Location_Ui/Location_screen.dart';
import 'package:vilfresh/Src/Profile_UI/ProfileScreen.dart';
import 'package:vilfresh/Src/SearchUI/SearchScreen.dart';
import 'package:vilfresh/Src/Wallet_Ui/Wallet_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/ConstantsApi.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Loading_Overlay.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

import 'NavDrawar.dart';

class Home_Screen extends ConsumerStatefulWidget {
  const Home_Screen({super.key});

  @override
  ConsumerState<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends ConsumerState<Home_Screen> {
  int currentIndex = 0;
  int totalIndex = 0;
  Position? currentPosition;
  String currentAddress = "";
  String addressID = "0";

  Future<Position> getPosition() async {
    LocationPermission? Permision;
    Permision = await Geolocator.checkPermission();
    if (Permision == LocationPermission.denied) {
      Permision = await Geolocator.requestPermission();
      if (Permision == LocationPermission.denied) {
        return Future.error("Location Permission are Denied");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getCurrentLocation() async {
    final data = await getAddressData();
    final address = data['addressId'] ?? '';

    if (address == '') {
      try {
        currentPosition = await getPosition();
        getAddress(currentPosition!.latitude, currentPosition!.longitude);

        print("FALSE LOADING");
      } catch (e) {
        print(e);
      }
    } else {
      setState(() {
        currentAddress = data['address'] ?? "";
        addressID = data['addressId'] ?? "";
      });
    }
  }

  Future<void> getUserInfo() async {
    LoginData? user = await getUserInformation();
    if (user != null) {
      print('User Name: ${user.name}');

      LoadingOverlay.show(context);

      final apiService = ApiService(ref.read(dioProvider));

      Map<String, dynamic> data = {"mobile_no": user.phone};
      final postResponse =
          await apiService.sendOTP<LoginModel>(ConstantApi.loginUrl, data);
      await LoadingOverlay.hide();

      if (postResponse.status == "True") {
        accessToken(postResponse.tokenID ?? "");

        ref.refresh(userDataProvider(addressID));
      } else {}
    } else {
      print('No user information found.');
    }
  }

  //MAP
  Future<void> getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0]; // Access the first element
        String locality = place.locality ?? "";
        String street = place.street ?? "";
        String district = place.subAdministrativeArea ?? "";
        String area = place.thoroughfare ?? "";
        String subLocality = place.subLocality ?? "";
        String pinCode = place.postalCode ?? "";

        SingleTon singleton = SingleTon();

        if (area != "") {
          currentAddress = "${locality}"; //${pinCode}"; //${street}, ${area},
        } else {
          currentAddress = "${locality}"; //, ${pinCode}"; //${street},
        }

        // final result = await ref.read(AddressApiProvider.future);

        // final result = await ref.read(getCityApiProvider.future);

        // if ((result?.cities?.length ?? 0) != 0) {
        //   setState(() {
        //     Cities? person = result?.cities?.firstWhere(
        //         (p) => p.cityName == locality,
        //         orElse: () => Cities());
        //     if (person?.cityID != null) {
        //       print("Found: ${person?.cityID}");
        //       addressID = person?.cityID ?? "0";
        //     } else {}
        //   });
        // }

        singleton.setLocation = currentAddress;
        singleton.lattidue = latitude.toString();
        singleton.longitude = longitude.toString();
      } else {
        setState(() {
          currentPosition = null;
          currentAddress = "Location Not Found";
        });
      }
    } catch (e) {
      print("ERROR LOCATION ${e}");
      setState(() {
        currentPosition = null;
        currentAddress = "Error Fetching Location";
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getCurrentLocation();
    getUserID();
  }

  getUserID() async {
    SingleTon().user_id = await getuserId();

    final data = await getAddressData();
    final address = data['addressId'] ?? '';
    setState(() {
      currentAddress = data['address'] ?? "";
      addressID = data['addressId'] ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(userDataProvider(addressID));

    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          toolbarHeight: 50,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Container(
                  height: 25, width: 25, child: ImgPathSvg('menu.svg')),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(1.0), // Height of the bottom line
          //   child: Container(
          //     color: Colors.green, // Color of the bottom line
          //     height: 1.0, // Height of the bottom line
          //   ),
          // ),
          // title: Text("VilFresh"),
          title: Container(
            height: 40,
            child: TextFormField(
              readOnly: true,
              onTap: () {
                print("object");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: white1,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: green1, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: green1, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: green1, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: green1,
                  size: 30,
                ),
                hintText: 'Search',
                hintStyle: searchT,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          actions: [
            // Container(
            //     margin: EdgeInsets.only(right: 10),
            //     height: 35,
            //     width: 35,
            //     child: Center(
            //       child: InkWell(
            //           onTap: () {
            //             // Navigator.push(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //         builder: (context) => Wallet_Screen()));
            //           },
            //           child: Icon(
            //             Icons.search,
            //             color: green1,
            //             size: 35,
            //           )),
            //     )),
            Container(
                margin: EdgeInsets.only(right: 10),
                height: 35,
                width: 35,
                child: Center(
                  child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProfileScreen()));
                      },
                      child: Icon(
                        Icons.notifications_none,
                        color: green1,
                        size: 35,
                      )),
                )),
            Container(
                margin: EdgeInsets.only(right: 10),
                height: 35,
                width: 35,
                child: Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Wallet_Screen()));
                      },
                      child: ImgPathSvg("wallet.svg")),
                )),
            Container(
                margin: EdgeInsets.only(right: 10),
                height: 35,
                width: 35,
                child: Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: green1,
                        size: 35,
                      )),
                )),
          ],
          backgroundColor: white1,
        ),
        body: _data.when(
          data: (data) {
            totalIndex = data?.homeBanner?.length ?? 0;
            SingleTon().walletBalance =
                double.parse(data?.walletBalance?[0].balance ?? "");
            return SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Location_Screen(
                                    isbackNavHide: false,
                                  ))).then((result) async {
                        if (result == true) {
                          final data = await getAddressData();
                          setState(() {
                            currentAddress = data['address'] ?? "";
                            addressID = data['addressId'] ?? "";
                          });

                          ref.refresh(userDataProvider(addressID));
                        }
                      });
                    },
                    child: Container(
                        height: 50,
                        child: Booking_Map(
                          currentAddress: currentAddress,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        //CAROSEL SLIDER

                        CarouselSlider(
                            items: data?.homeBanner?.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return _carouselImg(context,
                                      offerImg: i.imageURL ??
                                          "lib/assets/Sunset.jpeg");
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              aspectRatio: 16 / 9,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            )),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Center(
                            child: AnimatedSmoothIndicator(
                              activeIndex: currentIndex,
                              count: totalIndex,
                              effect: ExpandingDotsEffect(
                                  dotHeight: 5,
                                  dotWidth: 5,
                                  activeDotColor: green1),
                            ),
                          ),
                        ),

                        //VIEW ALL
                        _viewAll(
                            titleT: 'Shop By Category',
                            onTap: (String) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Categories_Screen(
                                            shopByCategories:
                                                data?.shopByCategories ?? [],
                                            initialIndex: 0,
                                          )));
                            }),
                        const SizedBox(
                          height: 15,
                        ),

                        Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                                physics:
                                    NeverScrollableScrollPhysics(), // Disable scrolling
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 140,
                                  crossAxisCount: 3, // Number of items in a row
                                  crossAxisSpacing:
                                      0.0, // Spacing between items horizontally
                                  mainAxisSpacing:
                                      0, // Spacing between items vertically
                                  childAspectRatio:
                                      0.5, // Aspect ratio of each item
                                ),

                                // child: ListView.builder(
                                //     scrollDirection: Axis.horizontal,
                                //physics: NeverScrollableScrollPhysics(),
                                itemCount: data?.shopByCategories?.length ?? 0,
                                itemBuilder: (context, index) {
                                  SingleTon().categories_id =
                                      data?.shopByCategories?[0].catgID ?? "";
                                  return GestureDetector(
                                      onTap: () {
                                        // Handle item click
                                        if (index == 0) {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Categories_Screen(
                                          //                 shopByCategories:
                                          //                     data?.shopByCategories ??
                                          //                         [],
                                          //                 initialIndex:
                                          //                     index)));

                                          var parentState =
                                              context.findAncestorStateOfType<
                                                  Bottom_Navigation_BarState>();

                                          if (parentState != null) {
                                            parentState.setState(() {
                                              parentState.b(1);
                                            });
                                          } // Example: Navigate to index 1 (Search Screen)
                                        } else if (index != 0) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Categories_Screen(
                                                          shopByCategories:
                                                              data?.shopByCategories ??
                                                                  [],
                                                          initialIndex:
                                                              index - 1)));
                                        } else {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Bottom_Navigation_Bar(
                                          //               select: 1,
                                          //             )));
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            // height:150, // Total height of the grid item
                                            width:
                                                100, // Total width of the grid item
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                CircleAvatar(
                                                    radius:
                                                        40, // Radius of the circular image
                                                    backgroundImage:
                                                        NetworkImage(data
                                                                ?.shopByCategories?[
                                                                    index]
                                                                .catgImageURL ??
                                                            "")),
                                                //SizedBox(heig ht: 5),

                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          3,
                                                  child: Text(
                                                      "${data?.shopByCategories?[index].catgName ?? ""}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 10,
                                                      //overflow: TextOverflow.ellipsis,
                                                      style: cardT),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ));
                                })),

                        _Product_List(data?.homeDefaultItems ?? [],
                            data?.shopByCategories ?? []),

                        const SizedBox(
                          height: 20,
                        ),
                        //SUGGEST MISSING
                        // Container(
                        //   width: MediaQuery.sizeOf(context).width,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20),
                        //       border: Border.all(width: 2, color: green2)),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 20, right: 20),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.only(
                        //               top: 30, bottom: 20),
                        //           child: Text(
                        //             'Suggest missing product',
                        //             style: shopT,
                        //           ),
                        //         ),
                        //         textfieldDescription(
                        //           hintText: 'Type your text here....',
                        //           validating: null,
                        //         ),
                        //         Container(
                        //             margin:
                        //                 EdgeInsets.only(top: 15, bottom: 30),
                        //             alignment: Alignment.topLeft,
                        //             width: 150,
                        //             child: CommonElevatedButtonGreen(
                        //                 context, "SUBMIT", () {}))
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            getUserInfo();
            return Text("Loading");
          },
          loading: () => Center(child: CircularProgressIndicator()),
        ));
  }

  //SHOP BY CREATE
  // Widget _ShopCreate() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       circularImg(context),
  //       const Spacer(),
  //       circularImg(context),
  //       const Spacer(),
  //       circularImg(context),
  //       const Spacer(),
  //       circularImg(context),
  //     ],
  //   );
  // }
}

//CIRCULAR PRODUCT IMG
// Widget circularImg(context) {
//   return InkWell(
//     onTap: () {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => Categories_Screen()));
//     },
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           height: 80,
//           width: 80,
//           decoration: BoxDecoration(shape: BoxShape.circle, color: white7),
//           child: ImgPathPng('glassmilk.png'),
//         ),
//         Container(
//             width: 80,
//             child: Text(
//               'Daily Subscription',
//               style: circularT,
//               maxLines: 3,
//               textAlign: TextAlign.center,
//             )),
//       ],
//     ),
//   );
// }

Widget _carouselImg(context, {required String offerImg}) {
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: NetworkImage(offerImg),
        fit: BoxFit.cover,
      ),
    ),
  );
}

//VIEW ALL
Widget _viewAll({
  required Function(String) onTap,
  required String titleT,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        Text(
          titleT,
          style: shopT,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            onTap("");
          },
          child: Text(
            'View all',
            style: viewAllT,
          ),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: green1,
        )
      ],
    ),
  );
}

//BASKET CONTAINER
// Widget _basketCard() {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Container(
//         height: 180,
//         width: 150,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             image: DecorationImage(
//                 image: AssetImage("lib/assets/Sunset.jpeg"), fit: BoxFit.cover),
//             border: Border.all(width: 2, color: green1)),
//       ),
//       Container(
//           margin: EdgeInsets.only(top: 5),
//           alignment: Alignment.center,
//           width: 100,
//           child: Text(
//             "City Pride",
//             style: cardT,
//             maxLines: 2,
//           )),
//     ],
//   );
// }

//PRODUCT LIST
Widget _Product_List(List<HomeDefaultItems>? homeDefaultItems,
    List<ShopByCategories> shopByCategories) {
  return ListView.builder(
    itemCount: homeDefaultItems?.length ?? 0,
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          //VF BASKET
          _viewAll(
              titleT: homeDefaultItems?[index].categoryName ?? "",
              onTap: (String) {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Bottom_Navigation_Bar(
                                select: 1,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Categories_Screen(
                              shopByCategories: shopByCategories,
                              initialIndex: index - 1)));
                }
              }),
          _grid_View(context, homeDefaultItems?[index].defaultItems ?? [],
              CategoriesName: homeDefaultItems?[index].categoryName ?? "",
              CategoriesId: shopByCategories?[index].catgID ?? ""),
        ],
      );
    },
  );
}

Widget _grid_View(context, List<DefaultItems>? defaultItems,
    {required String CategoriesName, required String CategoriesId}) {
  return Container(
    // height: MediaQuery.sizeOf(context).height/2.5,
    child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: defaultItems?.length, // The length Of the array
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisExtent: 250,
          mainAxisSpacing: 0,
          childAspectRatio: 0.7, // 5 columns
        ), // The size of the grid box
        itemBuilder: (context, index) => Container(
              child: GridTile(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: VF_Basket_Card(
                    context,
                    TaskImg: defaultItems?[index].itemImage ?? "",
                    productName: defaultItems?[index].item ?? "",
                    weight: defaultItems?[index].variant ?? "",
                    price: defaultItems?[index].actualPrice ?? "",
                    offerPrice: defaultItems?[index].sellingPrice ?? "",
                    onTap: () {
                      if (CategoriesName == "Daily Subscription") {
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Cart_Screeen(
                                      Categories_Id: CategoriesId,
                                      Item_Id:
                                          defaultItems?[index].itemID ?? "",
                                      Item_Name:
                                          defaultItems?[index].item ?? "",
                                      deliveredDate: '',
                                      countUpdate: (index, qty) {},
                                    )));
                      }
                    },
                  ),
                ),
              ),
            )),
  );

  // GridView.count(
  //   shrinkWrap: true,
  //   scrollDirection: Axis.vertical,
  //   physics: const NeverScrollableScrollPhysics(),
  //   crossAxisCount: 2,
  //   crossAxisSpacing: 20.0,
  //   mainAxisSpacing: 20,
  //   childAspectRatio: 0.7, // 5 columns
  //   children: List.generate(4, (index) {
  //     return GridTile(
  //       child: Padding(
  //         padding: const EdgeInsets.only(
  //           top: 10,
  //         ),
  //         child: VF_Basket_Card(
  //           context,
  //           TaskImg: "lib/assets/Sunset.jpeg",
  //           productName: "Lettuce",
  //           weight: "1 Kg",
  //           price: "40",
  //           offerPrice: "80",
  //         ),
  //       ),
  //     );
  //   }),
  // );
}
