import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooner/helper/colors.dart';
import 'package:sooner/helper/helper_methods.dart';
import 'package:sooner/screens/login/view.dart';

import '../../shared/app_input.dart';
import '../../shared/choose_image_source_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 71.h,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/icons/back.png",
                            height: 24.h, width: 24.h)),
                    const Spacer(
                      flex: 3,
                    ),
                    Text("Sign Up",
                        style: TextStyle(fontSize: 24.sp, color: Colors.white)),
                    const Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        "LOG IN",
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap: (){
                  chooseImage(context);
                },
                child: personalImage!=null? Container(
                  height: 125.h,
                  width: 125.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.file(personalImage!),
                ):CircleAvatar(
                  radius: 60.r,
                  backgroundImage:
                   AssetImage("assets/images/img_bg.png"),
                  foregroundImage:
                   AssetImage("assets/images/person.png"),
                ),
              ),
              AppInput(label: "Full Name"),
              AppInput(hintText: "Must be enter 14 number", label: "ID"),
              AppInput(label: "Email"),
              AppInput(
                  hintText: "Must be at least 6 characters",
                  label: "Password",
                  isPassword: true),
              SizedBox(
                height: 20.9.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 50.w, end: 50.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Sign up for email updates",style: TextStyle(color: Colors.white,backgroundColor: Colors.black,fontSize: 16.sp),),
                    Checkbox(value: isChecked,activeColor: Colors.white,checkColor: colorPrimary, onChanged: (val){
                      isChecked = val!;
                      setState(() {

                      });
                    }),

                  ],
                ),
              ),
              SizedBox(
                height: 20.9.h,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Sign Up")),
              SizedBox(
                height: 50.4.h,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Text(
            "By continuing, you agree to accept our\nPrivacy Policy & Terms of Service.",
            style: TextStyle(color: Colors.white, fontSize: 10.sp),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  File? personalImage;

  Future<void> chooseImage(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (context) => const ChooseImageSourceDialog(),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(25.w), topEnd: Radius.circular(25.w)),
        )).then((value) {
      if (value != null) {
        personalImage = value as File;
        setState(() {

        });
      }
    });
  }
}
