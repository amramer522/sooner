import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooner/helper/helper_methods.dart';
import 'package:sooner/screens/home_details/view.dart';
import 'package:sooner/screens/statuses/view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 130.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage:
                        const AssetImage("assets/images/img_bg.png"),
                        foregroundImage:
                        const AssetImage("assets/images/person.png"),
                      ),
                      const Spacer(),
                      Text(
                        "NAME PERSON",
                        style: TextStyle(fontSize: 24.sp, color: Colors.white),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset("assets/icons/back.png",
                                  height: 24.h, width: 24.h)),
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/app_bar.png"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 200.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      navigateTo(context,
                          page: StatusesScreen(
                            mainImagePath: "assets/icons/police.png",
                            type: 0,
                          ));
                    },
                    child: Image.asset(
                      "assets/icons/police.png",
                      width: 164.w,
                      height: 144.h,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateTo(context,
                          page: StatusesScreen(
                            mainImagePath: "assets/icons/hospitals.png",
                            type: 1,
                          ));
                    },
                    child: Image.asset("assets/icons/hospitals.png",
                        width: 164.w, height: 144.h),
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                  onTap: () {
                    navigateTo(context,
                        page: HomeDetailsScreen(
                          mainImagePath: "assets/icons/matafi.png",
                          type: 2,
                        ));
                  },
                  child: Image.asset("assets/icons/matafi.png",
                      width: 164.w, height: 144.h)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Text(
          "By continuing, you agree to accept our\nPrivacy Policy & Terms of Service.",
          style: TextStyle(fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
