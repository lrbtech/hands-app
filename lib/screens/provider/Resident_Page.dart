import 'package:flutter/material.dart';
import 'package:hands_user_app/screens/provider/Utils/Custom_Dailog_Botton.dart';
import 'package:hands_user_app/screens/provider/Utils/Gender_Radio.dart';
import 'package:hands_user_app/screens/provider/Utils/Single_Radiobutton.dart';
import 'package:hands_user_app/screens/provider/Widgets/Custom_Textfield.dart';
import 'package:hands_user_app/screens/provider/Widgets/Dailog_Container.dart';
import 'package:hands_user_app/screens/provider/Widgets/Image_Urls.dart';
import 'package:hands_user_app/screens/provider/Widgets/Title_Text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

class ResidentPage extends StatefulWidget {
  ResidentPage({super.key, required void Function() onNext});

  @override
  State<ResidentPage> createState() => _ResidentPageState();
}

class _ResidentPageState extends State<ResidentPage> {
  String? _selectedGender;
  TextEditingController _dobController = TextEditingController();
  bool isAgreed = false;
  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  final ImagePicker _picker = ImagePicker();
  XFile? uploadEmiratesId;
  captureFiles() async {
    _picker
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((XFile? recordedVideo) {
      if (recordedVideo != null && recordedVideo.path != null) {
        setState(() {
          uploadEmiratesId = recordedVideo;
        });
      }
    });
  }

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
  List emirates = [
    "Dubai",
    "Abu Dhabi",
    "Sharjah",
    "Ajman",
    "Umm Al Quwain",
    "Ras Al Khaimah",
    "Fujairah"
  ];
  String? emirate;
  bool error_emirate = false;
  bool error_pro = false;
  String? select_pro;
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
            heading(context: context, text: "Choose Emirates"),
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
                          color: error_emirate
                              ? Colors.pinkAccent
                              : Color(0xff323345),
                          width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text("Select Emirates",
                              style: TextStyle(color: Colors.grey)),
                        ),
                        dropdownColor: Colors.white,
                        elevation: 2,
                        //icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36.0,
                        isExpanded: true,
                        value: emirate,
                        onChanged: (value) {
                          setState(() {
                            emirate = value;
                          });
                        },
                        items: emirates.map<DropdownMenuItem>((value) {
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
                      Icons.location_on,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            heading(context: context, text: "Emirates ID NO."),
            customTextField(
              context: context,
              hintText: "00-0000-0000000-0",
              assets1: "",
              // assets2: AppIcons.dropdownIcon,
              obscureText: false,
            ),
            GestureDetector(
              onTap: () {
                captureFiles();
              },
              child: customDialogContainer(
                  context: context,
                  title: "Upload Emirates ID",
                  description:
                      "Upload your scope of work images.\nOr use camera to capture them.",
                  imagePath: uploadEmiratesId != null
                      ? uploadEmiratesId!.path
                      : AppIcons.browseIcon,
                  buttonText: "Brows images",
                  network: uploadEmiratesId != null ? true : false),
            ),
            heading(context: context, text: "Gender"),
            genderSelection(
              context: context,
              activeColor: Colors.white,
              selectedGender: _selectedGender,
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
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
            agreeToPolicyRadioButton(
              isSelected: isAgreed,
              onChanged: (bool? newValue) {
                setState(() {
                  isAgreed = newValue ?? false;
                });
              },
              context: context,
              text: 'Agree to policy',
              activeColor: Colors.white,
              textColor: Theme.of(context).colorScheme.onSecondary,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
            ),
            customDialogButton(
              text: 'Submit',
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
