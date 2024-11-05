import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Common_Widgets/Common_Button.dart';
import 'package:vilfresh/Common_Widgets/Common_List.dart';
import 'package:vilfresh/Common_Widgets/Custom_App_Bar.dart';
import 'package:vilfresh/Common_Widgets/Text_Form_Field.dart';
import 'package:vilfresh/Model/GetWalletModel.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';
import 'package:vilfresh/utilits/Text_Style.dart';

class Wallet_Screen extends ConsumerStatefulWidget {
  const Wallet_Screen({super.key});

  @override
  ConsumerState<Wallet_Screen> createState() => _Wallet_ScreenState();
}

class _Wallet_ScreenState extends ConsumerState<Wallet_Screen> {
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _promocode = TextEditingController();

  final _amountListArr = ["100", "500", "1000"];

  var promoCode = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _promocode.text = promoCode;
  }

  @override
  Widget build(BuildContext context) {
    final getwalletResponse = ref.watch(getWalletProvider);

    return Scaffold(
        backgroundColor: backGround1,
        appBar: Custom_AppBar(
          title: 'Wallet',
          actions: null,
          isNav: true,
          isGreen: false,
        ),
        body: getwalletResponse.when(data: (data) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(child: _MainBody(data)),
          );
        }, error: (Object error, StackTrace stackTrace) {
          return Text("ERROR$error");
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }));
  }

  //MAIN BODY
  Widget _MainBody(GetWalletModel? getWalletData) {
    SingleTon().walletBalance =
        double.parse(getWalletData?.balance?[0].balance ?? "");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //WALLET BALANCE
        _walletBalance(getWalletData),
        //ENTER AMOUNT
        _enterAmmount(),
        //ENTER PROMO CODE
        _enterPromoCode(),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }

  //WALLET BALANCE
  Widget _walletBalance(GetWalletModel? getWalletData) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 30),
      width: MediaQuery.sizeOf(context).width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: white1),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 10),
            //   child: Row(
            //     children: [
            //       Container(
            //           width: MediaQuery.sizeOf(context).width / 2,
            //           child: Text(
            //             'Platform Fee',
            //             style: walletBalanceT1,
            //             maxLines: 2,
            //           )),
            //       const Spacer(),
            //       RichText(
            //         text: TextSpan(
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.w600,
            //             color: Colors.black,
            //           ),
            //           children: <TextSpan>[
            //             TextSpan(
            //               text: "₹${balance.platformFee}",
            //               style: TextStyle(
            //                 decoration: TextDecoration.lineThrough,
            //                 decorationColor: Colors.black,
            //                 decorationThickness: 2.0,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         '₹0',
            //         style: walletBalanceT1,
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 25),
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: Text(
                        'Wallet Balance',
                        style: walletBalanceT,
                      )),
                  const Spacer(),
                  Text(
                    '₹ ${getWalletData?.balance?[0].balance == "" ? "0" : getWalletData?.balance?[0].balance}',
                    style: walletBalanceT,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: Text(
                        'Reserved for Basket Orders Value',
                        style: walletBalanceT1,
                        maxLines: 2,
                      )),
                  const Spacer(),
                  Text(
                    '₹ ${getWalletData?.reservedBalance?[0].balance == "" ? "0" : getWalletData?.reservedBalance?[0].balance}',
                    style: walletBalanceT1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: Text(
                        'Net Balance',
                        style: walletBalanceT1,
                        maxLines: 2,
                      )),
                  const Spacer(),
                  Text(
                    '₹ ${double.parse(getWalletData?.balance?[0].balance ?? "0") - double.parse(getWalletData?.reservedBalance?[0].balance ?? "0")}',
                    style: walletBalanceT1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //ENTER AMOUNT
  Widget _enterAmmount() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: white1),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "Enter Amount",
                style: enterAmountT,
              ),
            ),
            textFormField2(
              hintText: 'Enter Amount',
              keyboardtype: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              Controller: _amount,
              validating: (value) {
                if (value!.isEmpty) {
                  return "Please enter Ammount";
                } else {
                  return "Please enter Ammount";
                }
              },
              onChanged: null,
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 15),
              height: 40,
              child: _amountList(),
            ),
            Center(
                child: Text(
              'To save time recharge more amount',
              style: rechargeHintT,
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 5),
              child: CommonElevatedButtonYelow(context, 'Pay', () {}),
            )
          ],
        ),
      ),
    );
  }

  //ENTER PROMO CODE
  Widget _enterPromoCode() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: MediaQuery.sizeOf(context).width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: white1),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "Do you have a promocode?",
                style: enterAmountT,
              ),
            ),
            textFormField3(
              hintText: 'Enter promocode',
              keyboardtype: TextInputType.multiline,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              Controller: _promocode,
              validating: (value) {
                if (value!.isEmpty) {
                  return "Please enter promocode";
                } else {
                  return "Please enter promocode";
                }
              },
              onChanged: null,
            ),
            const SizedBox(
              height: 10,
            ),
            promoCode == ""
                ? Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 20),
                    child: CommonElevatedButtonYelow(context, 'Apply', () {
                      // setState(() {
                      //   promoCode = _promocode.text;
                      // });
                      if (_promocode.text != "") {
                        ShowToastMessage("Promo Code Applied");
                      } else {
                        ShowToastMessage("Enter Promo Code");
                      }
                    }),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  //AMOUNT LIST
  Widget _amountList() {
    return ListView.builder(
      itemCount: _amountListArr.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              _amount.text = _amountListArr[index];
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: AmountContain(amount: _amountListArr[index]),
          ),
        );
      },
    );
  }
}
