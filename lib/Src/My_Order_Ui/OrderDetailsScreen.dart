import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/utilits/ApiService.dart';

class OrderDetailsScreen extends ConsumerStatefulWidget {
  final String headerID;
  OrderDetailsScreen({super.key, required this.headerID});

  @override
  ConsumerState<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends ConsumerState<OrderDetailsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final OrderHistoryDetailsRes =
        ref.watch(orderHistoryDetailsProvider(widget.headerID));
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
        ),
        body: OrderHistoryDetailsRes.when(
          data: (data) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data?.data?[0].itemDetails?.length ?? 0,
                      itemBuilder: (context, index) {
                        final item = data!.data?[0].itemDetails![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  "${item?.itemName ?? ""} - ${item?.variantName ?? ""}",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${item?.quantity ?? ""} X",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "₹ ${item?.itemPrice ?? ""}",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(),
                  buildSummaryRow(
                      "Gross Amount", data?.data?[0].grossAmount ?? ""),
                  buildSummaryRow(
                      "Platform Fee", data?.data?[0].platformFee ?? ""),
                  buildSummaryRow("Discounts Applied (0)",
                      data?.data?[0].discountAmount ?? ""),
                  Divider(),
                  buildSummaryRow("Net Amount", data?.data?[0].netAmount ?? "",
                      isBold: true),
                ],
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Text(error.toString());
          },
          loading: () => Center(child: CircularProgressIndicator()),
        ));
  }

  Widget buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "₹ $value",
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
