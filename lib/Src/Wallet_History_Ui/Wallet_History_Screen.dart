import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Image_Path.dart';
import 'package:vilfresh/Model/WalletHistoryModel.dart';
import 'package:vilfresh/Src/Wallet_Ui/Wallet_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Wallet_History_Screen extends ConsumerStatefulWidget {
  const Wallet_History_Screen({super.key});

  @override
  ConsumerState<Wallet_History_Screen> createState() =>
      _Wallet_History_ScreenState();
}

class _Wallet_History_ScreenState extends ConsumerState<Wallet_History_Screen> {
  @override
  Widget build(BuildContext context) {
    final getwalletResponse = ref.watch(getWalletHistoryProvider);

    return Scaffold(
        backgroundColor: backGround1,
        appBar: Custom_AppBar(
          title: "Wallet History",
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 20),
                height: 35,
                width: 35,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Wallet_Screen()));
                    },
                    child: ImgPathSvg("wallet.svg")))
          ],
          isNav: true,
          isGreen: false,
        ),
        body: getwalletResponse.when(data: (data) {
          return data?.data == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      _noTransaction(),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: _MainBody(data?.data ?? []),
                );
        }, error: (Object error, StackTrace stackTrace) {
          return Text("ERROR$error");
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }));
  }

  Widget _MainBody(List<WalletHistoryData>? data) {
    return ListView.builder(
        itemCount: data?.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              width: MediaQuery.sizeOf(context).width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Remitted On",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          data?[index].createdDate ?? "",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Transaction ID",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          data?[index].transactionID ?? "",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Amount",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          data?[index].amount ?? "",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Payment Gateway",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          data?[index].paymentMethod ?? "",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Status",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          data?[index].status ?? "",
                        )
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  //NO TRANSACTION DATA
  Widget _noTransaction() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: white1,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                height: 100,
                width: 100,
                child: ImgPathPng('logo.png')),
            Text(
              'Nothing here!',
              style: Textfield_Style2,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                'You don’t have any transactions. Keep adding money to your wallet.',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: radioT,
              ),
            )
          ],
        ),
      ),
    );
  }
}
