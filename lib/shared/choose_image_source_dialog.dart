import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../helper/colors.dart';

class ChooseImageSourceDialog extends StatelessWidget {
  const ChooseImageSourceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اختار صورتك الشخصية",
                style: const TextStyle(
                    color: Colors.black,),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close)),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyImageButton(
                icon: Icons.insert_photo,
                text: "الاستديو",
                source: ImageSource.gallery,
              ),
              MyImageButton(
                icon: CupertinoIcons.photo_camera_solid,
                text: "الكاميرا",
                source: ImageSource.camera,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyImageButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final ImageSource? source;

  const MyImageButton(
      {Key? key, this.icon, required this.text, required this.source})
      : super(key: key);

  Future<File> getImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final image =
          await FlutterExifRotation.rotateImage(path: pickedFile.path);
      return image;
    }
    return null!;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Row(
        children: [
          Icon(icon, color: colorPrimary),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text!,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
      onPressed: () {
        var image = getImage(context, source!);
        Navigator.pop(context, image);
      },
    );
  }
}

/***
    File personalImage;
    void chooseImage(BuildContext context) {
    showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context,
    pageBuilder: (_, __, ___) {
    return ChooseImageSourceDialog();
    },
    transitionBuilder: (_, anim, __, child) {
    return SlideTransition(
    position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
    child: child,
    );
    },
    ).then((value) {
    personalImage = value;
    updateProfileInfluential.image = personalImage;
    print("vbvbvb $value");
    setState(() {

    });
    });
    }


    or


    File? personalImage;
    void chooseImage(BuildContext context) {
    showModalBottomSheet(
    context: context,
    builder: (context) => ChooseImageSourceDialog(),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
    )).then((value) {
    personalImage = value as File;
    // updateProfileInfluential.image = personalImage;
    print("image $value");
    setState(() {});
    });
    }
 ***/
