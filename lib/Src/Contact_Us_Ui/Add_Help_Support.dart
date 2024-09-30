import 'package:flutter/material.dart';

class Add_Help_Support extends StatefulWidget {
  const Add_Help_Support({super.key});

  @override
  State<Add_Help_Support> createState() => _Add_Help_SupportState();
}

class _Add_Help_SupportState extends State<Add_Help_Support> {
  String? selectedCategory;
  String? selectedOption;
  String? selectedInvoice;
  String? selectedItemDetail;
  String? selectedDeliveryConcern;
  int? _selectedValue;
  int? _selectedValue2;

  final List<String> categories = ['Order Related', 'Wallet Related', 'Other'];
  final List<String> options = ['Wallet Recharged related issue', 'Other'];

  final List<String> invoices = [
    'VF-563763578637',
    'VF-563763578623',
    'VF-563763572121'
  ];

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
    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
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
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                    selectedOption = null;
                    selectedDeliveryConcern = null;
                    descriptionController.clear();
                    selectedInvoice = null;
                    selectedItemDetail = null;
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
              const SizedBox(height: 10),
              selectedCategory == 'Order Related'
                  ? Column(
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
                          items: invoices.map((String invoice) {
                            return DropdownMenuItem<String>(
                              value: invoice,
                              child: Text(invoice),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedInvoice = newValue;
                            });
                          },
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        ),
                        const SizedBox(height: 20),
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
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        ),
                        const SizedBox(height: 20),
                        const Text('Customer Order and Delivery Concerns'),

                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ListView.builder(
                            itemCount: 7,
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
                                      });
                                    },
                                  ),
                                  Text('Quantity related issues'),
                                ],
                              );
                            },
                          ),
                        ),

                        // Show description box if 'Others' is selected in delivery concerns
                        selectedDeliveryConcern == "Others"
                            ? Column(
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
                      ],
                    )
                  : selectedCategory == 'Wallet Related'
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Payment and Special Handling Requests'),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ListView.builder(
                                itemCount: 7,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Radio<int>(
                                        value: index,
                                        groupValue: _selectedValue2,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue2 =
                                                value; // Update the selected value
                                          });
                                        },
                                      ),
                                      Text('Quantity related issues'),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      : selectedCategory == 'Other'
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
                    ? Container(
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
