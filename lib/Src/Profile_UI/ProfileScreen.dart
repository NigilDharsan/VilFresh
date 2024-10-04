import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vilfresh/Src/Login_Ui/Login_Screen.dart';
import 'package:vilfresh/Src/Sign_Up_Ui/Survey_Screen.dart';
import 'package:vilfresh/utilits/ApiService.dart';
import 'package:vilfresh/utilits/Common_Colors.dart';
import 'package:vilfresh/utilits/Generic.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  TextEditingController _address = TextEditingController();
  TextEditingController _stateoforigin = TextEditingController();

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _weddingdate = TextEditingController();
  String? _selectedGender;
  DateTime? _selectedDate;
  bool _isEditing = false;
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dob.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectWeddingDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _weddingdate.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  Future<void> _updateProfile() async {
    if (_isEditing) {
      if (_email.text.isEmpty ||
          _phone.text.isEmpty ||
          _username.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in all fields')),
        );
      } else {
        final updateProfileresponse = ApiService(ref.read(dioProvider));
        String _base64String = "";
        if (_imageFile != null) {
          // Read bytes from the file object
          Uint8List _bytes = await _imageFile!.readAsBytes();

          _base64String = base64.encode(_bytes);
        }

        Map<String, dynamic> formData = {
          "User_ID": SingleTon().user_id,
          "User_Name": _username.text,
          "Email": _email.text,
          "Mobile_No": _phone.text,
          "State": "1",
          "Profile_Image": _imageFile != null ? _base64String : ""
        };
        final updateprofileResponse = await updateProfileresponse
            .updateprofileApiService(formData: formData);
        if (updateprofileResponse.status == "True") {
          ShowToastMessage(updateprofileResponse.message ?? "");
          _imageFile = null;
          ref.refresh(getProfileApiProvider);
          _toggleEdit();
        } else {
          ShowToastMessage(updateprofileResponse.message ?? "");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(getProfileApiProvider);

    return Scaffold(
        backgroundColor: backGround1,
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios)),
          title: Text("Profile"),
          actions: [
            IconButton(
              icon: Icon(Icons.edit_rounded),
              onPressed: _toggleEdit,
            ),
          ],
        ),
        body: result.when(
          data: (data) {
            _username.text = _username.text == ""
                ? (data?.data?[0].userName ?? "")
                : _username.text;
            _phone.text = _phone.text == ""
                ? (data?.data?[0].mobileNo ?? "")
                : _phone.text;
            _email.text =
                _email.text == "" ? (data?.data?[0].email ?? "") : _email.text;
            _dob.text =
                _dob.text == "" ? (data?.data?[0].dOB ?? "") : _dob.text;

            _weddingdate.text = _weddingdate.text == ""
                ? (data?.data?[0].weddingDate ?? "")
                : _weddingdate.text;

            _address.text = _address.text == ""
                ? (data?.data?[0].Address ?? "")
                : _address.text;
            _stateoforigin.text = _stateoforigin.text == ""
                ? (data?.data?[0].State ?? "")
                : _stateoforigin.text;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Center(
                              child: Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 95,
                                    width: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: _imageFile != null
                                            ? FileImage(File(_imageFile!.path))
                                                as ImageProvider
                                            : NetworkImage(
                                                data?.data?[0].profileImage ??
                                                    ""),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: _isEditing == true
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.edit,
                                          size: 20, color: Colors.black),
                                      onPressed: _pickImage,
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Text(
                        data?.data?[0].userName ?? "",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    _isEditing == true
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                labelText: "User Name",
                                labelStyle: TextStyle(color: Colors.black),
                                contentPadding:
                                    EdgeInsets.only(top: 7, bottom: 7),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _username,
                              readOnly: !_isEditing,
                            ),
                          )
                        : Container(),

                    TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: "Address",
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.only(top: 7, bottom: 7),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      controller: _address,
                      readOnly: !_isEditing,
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: "State of Origin",
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.only(top: 7, bottom: 7),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      controller: _stateoforigin,
                      readOnly: !_isEditing,
                    ),
                    const SizedBox(height: 10),

// PHONE
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: "Phone",
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.only(top: 7, bottom: 7),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      controller: _phone,
                      readOnly: !_isEditing,
                    ),
                    const SizedBox(height: 10),

                    // EMAIL
                    TextFormField(
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.only(top: 7, bottom: 7),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      controller: _email,
                      readOnly: !_isEditing,
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Survey_Screen()));
                          },
                          child: Text(
                            "Help us to serve",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    // // DOB
                    // GestureDetector(
                    //   onTap: () {
                    //     if (_isEditing) _selectDate(context);
                    //   },
                    //   child: AbsorbPointer(
                    //     child: TextFormField(
                    //       controller: _dob,
                    //       decoration: InputDecoration(
                    //         floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //         labelText: "Date of Birth",
                    //         labelStyle: TextStyle(color: Colors.black),
                    //         contentPadding: EdgeInsets.only(top: 7, bottom: 7),
                    //         enabledBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.black),
                    //         ),
                    //         focusedBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.black),
                    //         ),
                    //       ),
                    //       readOnly:
                    //           true, // Set to true as it will only be editable via date picker
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 10),

                    // // GENDER
                    // DropdownButtonFormField<String>(
                    //   value: _selectedGender,
                    //   decoration: InputDecoration(
                    //     floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //     labelText: "Gender",
                    //     labelStyle: TextStyle(color: Colors.black),
                    //     contentPadding: EdgeInsets.only(top: 7, bottom: 7),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.black),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.black),
                    //     ),
                    //   ),
                    //   items: [
                    //     DropdownMenuItem(child: Text("Male"), value: "Male"),
                    //     DropdownMenuItem(
                    //         child: Text("Female"), value: "Female"),
                    //     DropdownMenuItem(child: Text("Other"), value: "Other"),
                    //   ],
                    //   onChanged: _isEditing
                    //       ? (String? newValue) {
                    //           setState(() {
                    //             _selectedGender = newValue;
                    //           });
                    //         }
                    //       : null,
                    // ),
                    // const SizedBox(height: 10),

                    // // WEDDING DATE
                    // GestureDetector(
                    //   onTap: () {
                    //     if (_isEditing) _selectWeddingDate(context);
                    //   },
                    //   child: AbsorbPointer(
                    //     child: TextFormField(
                    //       controller: _weddingdate,
                    //       decoration: InputDecoration(
                    //         floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //         labelText: "Wedding Date",
                    //         labelStyle: TextStyle(color: Colors.black),
                    //         contentPadding: EdgeInsets.only(top: 7, bottom: 7),
                    //         enabledBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.black),
                    //         ),
                    //         focusedBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.black),
                    //         ),
                    //       ),
                    //       readOnly:
                    //           true, // Set to true as it will only be editable via date picker
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 30),

                    // UPDATE BUTTON
                    _isEditing == true
                        ? InkWell(
                            onTap: () {
                              _updateProfile();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Center(child: Text("Update")),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // Prevents closing the dialog by tapping outside of it
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Vilfresh'),
                                    content: Text('Are you sure to Logout'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Closes the dialog
                                        },
                                      ),
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () async {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login_Screen()),
                                              (Route<dynamic> route) => false);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Center(child: Text("Logout")),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
