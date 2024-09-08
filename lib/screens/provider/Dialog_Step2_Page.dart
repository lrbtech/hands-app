import 'package:flutter/material.dart';

import 'package:hands_user_app/screens/provider/Utils/Custom_Dailog_Botton.dart';
import 'package:hands_user_app/screens/provider/Utils/Single_Radiobutton.dart';
import 'package:hands_user_app/screens/provider/Widgets/Dailog_Container.dart';
import 'package:hands_user_app/screens/provider/Widgets/Image_Urls.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customDialogContainer(
              context: context,
              title: "Upload Passport",
              description:
                  "Upload your passport copy in images.\nOr use camera to capture them.",
              imagePath: AppIcons.browseIcon,
              buttonText: "Browse images"),
          customDialogContainer(
              context: context,
              title: "Upload Visa",
              description:
                  "Upload your visa copy in images.\nOr use camera to capture them.",
              imagePath: AppIcons.browseIcon,
              buttonText: "Browse images"),
          customDialogContainer(
              context: context,
              title: "Take Selfie",
              description: "Use camera to capture your picture",
              imagePath: AppIcons.selfeIcon,
              buttonText: "Capture Selfie"),
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
          customDialogButton(text: "Submit", context: context)
        ],
      ),
    );
  }
}
