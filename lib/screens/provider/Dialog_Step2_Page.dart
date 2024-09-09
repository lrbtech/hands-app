import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hands_user_app/screens/provider/Utils/Custom_Dailog_Botton.dart';
import 'package:hands_user_app/screens/provider/Utils/Single_Radiobutton.dart';
import 'package:hands_user_app/screens/provider/Widgets/Dailog_Container.dart';
import 'package:hands_user_app/screens/provider/Widgets/Image_Urls.dart';
import 'package:image_picker/image_picker.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  bool isAgreed = false;
  final ImagePicker _picker = ImagePicker();
  XFile? uploadPassport;
  XFile? uploadVisa;
  XFile? uploadSelfie;
  captureFiles(int types) async {
    _picker
        .pickImage(
      source: types == 2 ? ImageSource.camera : ImageSource.gallery,
    )
        .then((XFile? recordedVideo) {
      if (recordedVideo != null && recordedVideo.path != null) {
        if (types == 0) {
          setState(() {
            uploadPassport = recordedVideo;
          });
        } else if (types == 1) {
          setState(() {
            uploadVisa = recordedVideo;
          });
        } else {
          setState(() {
            uploadSelfie = recordedVideo;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              captureFiles(0);
            },
            child: customDialogContainer(
                context: context,
                title: "Upload Passport",
                description:
                    "Upload your passport copy in images.\nOr use camera to capture them.",
                imagePath: uploadPassport != null
                    ? uploadPassport!.path
                    : AppIcons.browseIcon,
                buttonText: "Browse images",
                network: uploadPassport != null ? true : false),
          ),
          GestureDetector(
            onTap: () {
              captureFiles(1);
            },
            child: customDialogContainer(
                context: context,
                title: "Upload Visa",
                description:
                    "Upload your visa copy in images.\nOr use camera to capture them.",
                imagePath:
                    uploadVisa != null ? uploadVisa!.path : AppIcons.browseIcon,
                buttonText: "Browse images",
                network: uploadVisa != null ? true : false),
          ),
          GestureDetector(
            onTap: () {
              captureFiles(2);
            },
            child: customDialogContainer(
                context: context,
                title: "Take Selfie",
                description: "Use camera to capture your picture",
                imagePath: uploadSelfie != null
                    ? uploadSelfie!.path
                    : AppIcons.selfeIcon,
                buttonText: "Capture Selfie",
                network: uploadSelfie != null ? true : false),
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
          customDialogButton(text: "Submit", context: context)
        ],
      ),
    );
  }
}
