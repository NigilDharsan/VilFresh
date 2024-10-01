import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vilfresh/Model/HSCategoryModel.dart';
import 'package:vilfresh/Model/InvoiceModel.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Generic.dart';

class Add_Help_Support extends ConsumerStatefulWidget {
  const Add_Help_Support({super.key});

  @override
  ConsumerState<Add_Help_Support> createState() => _Add_Help_SupportState();
}

class _Add_Help_SupportState extends ConsumerState<Add_Help_Support> {
  String? selectedCategory;
  String? selectedOption;
  String? selectedInvoice;
  String? selectedItemDetail;
  String? selectedCategoryIssue;
  String? selectedCategoryIssueID = "";

  int? _selectedValue;
  int? _selectedValue2;

  String? choosedCategoryID;
  String? choosedInoviceID = "";

  final List<String> itemDetails = [
    'Tomato - 1 kg - Rs.30 - 21/09/2024',
    'Carrot - 2 kg - Rs.60 - 21/10/2024',
  ];

  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(GetHSCategoryProvider);
    final invoiceList = ref.watch(GetInvoiceProvider);
    final invoiceItemList = ref.watch(getInvoiceItemProvider(""));

    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryList.when(
                data: (data) {
                  return DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black45),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                    value: selectedCategory,
                    hint: const Text("Select Category"),
                    items: data!.data!.map((HSCategoryData category) {
                      return DropdownMenuItem<String>(
                        value: category.hSCategory,
                        child: Text(category.hSCategory ?? ""),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        choosedCategoryID =
                            getHsIdByCategory(data.data ?? [], newValue ?? "");
                        selectedCategory = newValue;
                        selectedOption = null;
                        descriptionController.clear();
                        selectedInvoice = null;
                        selectedItemDetail = null;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  );
                },
                error: (Object error, StackTrace stackTrace) {
                  return Text("data");
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(height: 10),
              invoiceList.when(
                data: (data) {
                  if (data?.data?.length != 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Select Invoice Details:'),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.black45),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                          ),
                          value: selectedInvoice,
                          hint: const Text("Select Invoice"),
                          items: data?.data?.map((InvoiceData invoice) {
                            return DropdownMenuItem<String>(
                              value: invoice.orderID,
                              child: Text(invoice.orderID ?? ""),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedInvoice = newValue;
                            });
                          },
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        ),
                      ],
                    );
                  }
                  return SizedBox.shrink();
                },
                error: (Object error, StackTrace stackTrace) {
                  return Text("data");
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(height: 20),
              choosedInoviceID != ""
                  ? ref
                      .watch(getInvoiceItemProvider(choosedInoviceID ?? ""))
                      .when(
                      data: (data) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Select Item Details:'),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.black45),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                              value: selectedItemDetail,
                              hint: const Text("Select Item Detail"),
                              items: itemDetails.map((String itemDetail) {
                                return DropdownMenuItem<String>(
                                  value: itemDetail,
                                  child: Text(itemDetail),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedItemDetail = newValue;
                                });
                              },
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                            ),
                          ],
                        );
                      },
                      error: (Object error, StackTrace stackTrace) {
                        return Text("");
                      },
                      loading: () {
                        return Center(child: CircularProgressIndicator());
                      },
                    )
                  : SizedBox.shrink(),
              const SizedBox(height: 20),

              selectedCategory != "Others"
                  ? ref.watch(GetIssuesProvider(choosedCategoryID ?? "")).when(
                      data: (data) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Customer Order and Delivery Concerns'),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ListView.builder(
                                itemCount: data?.data?.length ?? 0,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Radio<int>(
                                        value: index,
                                        groupValue: _selectedValue,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue = value;

                                            selectedCategoryIssue =
                                                data?.data?[value!].issues ??
                                                    "";
                                            selectedCategoryIssueID =
                                                data?.data?[value!].identity ??
                                                    "";
                                          });
                                        },
                                      ),
                                      Text(data?.data?[index].issues ?? ""),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      error: (Object error, StackTrace stackTrace) {
                        return Text("");
                      },
                      loading: () {
                        return Center(child: CircularProgressIndicator());
                      },
                    )
                  : SizedBox.shrink(),

              // Show description box if 'Others' is selected in delivery concerns
              selectedCategoryIssue == "Others" || selectedCategory == "Others"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text('Please describe your issue:'),
                        TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your description here',
                          ),
                          maxLines: 3,
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
              selectedCategory == 'Other'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text('Please describe your issue:'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your description here',
                          ),
                          maxLines: 3,
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: selectedCategory != null
                    ? InkWell(
                        onTap: () async {
                          final userRegisterApiService =
                              ApiService(ref.read(dioProvider));

                          Map<String, dynamic> formData = {
                            "Category_ID": choosedCategoryID,
                            "Order_ID": "150",
                            "Item_ID": "147",
                            "Variant_ID": "15",
                            "Issue_ID": selectedCategoryIssueID,
                            "OtherIssues": descriptionController.text,
                            "User_ID": SingleTon().user_id
                          };

                          final userRegisterResponse =
                              await userRegisterApiService
                                  .SubmitHelpSupportApiService(
                                      formData: formData);
                          if (userRegisterResponse.status == "true") {
                            ShowToastMessage(
                                userRegisterResponse.message ?? "");
                            Navigator.pop(context, true);
                          } else {
                            ShowToastMessage(
                                userRegisterResponse.message ?? "");
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black45),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text("Save"),
                            ),
                          ),
                        ),
                      )
                    : SizedBox
                        .shrink(), // Hide the button if no category is selected
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? getHsIdByCategory(List<HSCategoryData> helpsupports, String category) {
  for (var support in helpsupports) {
    if (support.hSCategory == category) {
      return support.hSID;
    }
  }
  return null; // Return null if not found
}
