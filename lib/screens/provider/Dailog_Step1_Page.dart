import 'package:flutter/material.dart';
import 'package:hands_user_app/screens/provider/Utils/Custom_Dailog_Botton.dart';
import 'package:hands_user_app/screens/provider/Utils/Gender_Radio.dart';
import 'package:hands_user_app/screens/provider/Widgets/Custom_Textfield.dart';
import 'package:hands_user_app/screens/provider/Widgets/Image_Urls.dart';
import 'package:hands_user_app/screens/provider/Widgets/Title_Text.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Widgets/countery.dart';

class Step1 extends StatefulWidget {
  const Step1({
    super.key,
    required void Function() onNext,
  });

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final TextEditingController _dobController = TextEditingController();
  String? _selectedGender;
  List professional = [
    "Painter",
    "Carpenter",
    "Driver",
    "Ac Mechanic",
    "Car Mechanic",
    "Plumper",
    "Electrician",
    "Engineer",
    "Designer",
    "Architect",
    "IT Technician",
    "Cook"
  ];
  bool error_pro = false;
  String? select_pro;
  bool error_country = false;
  String? select_country;
  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            heading(context: context, text: "Choose Professional"),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 62.0,
                    padding: EdgeInsets.only(left: 50.0, right: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color:
                              error_pro ? Colors.pinkAccent : Color(0xff323345),
                          width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text("Select Professional",
                              style: TextStyle(color: Colors.grey)),
                        ),
                        dropdownColor: Colors.white,
                        elevation: 2,
                        //icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36.0,
                        isExpanded: true,
                        value: select_pro,
                        onChanged: (value) {
                          setState(() {
                            select_pro = value;
                          });
                        },
                        items: professional.map<DropdownMenuItem>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text("${value}",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0, left: 10.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            10.height,
            heading(context: context, text: "Choose Nationality"),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 62.0,
                    padding: EdgeInsets.only(left: 50.0, right: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: error_country
                              ? Colors.pinkAccent
                              : Color(0xff323345),
                          width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text("Select Nationality",
                              style: TextStyle(color: Colors.grey)),
                        ),
                        dropdownColor: Colors.white,
                        elevation: 2,
                        //icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36.0,
                        isExpanded: true,
                        value: select_country,
                        onChanged: (value) {
                          setState(() {
                            select_country = value;
                          });
                        },
                        items: country.map<DropdownMenuItem>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text("${value}",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0, left: 10.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            heading(context: context, text: "Passport Number"),
            customTextField(
                context: context,
                hintText: "Enter the number",
                assets1: "",
                obscureText: false),
            heading(context: context, text: "Date Of Birth"),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: customTextField(
                  context: context,
                  hintText: "DD/MM/YY",
                  assets1: "",
                  obscureText: false,
                  controller: _dobController,
                ),
              ),
            ),
            heading(context: context, text: "Gender"),
            genderSelection(
              activeColor: Colors.white,
              context: context,
              selectedGender: _selectedGender,
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            customDialogButton(
              text: "Next",
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
