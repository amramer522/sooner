import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooner/helper/fake_data.dart';
import 'package:sooner/helper/helper_methods.dart';
import 'package:sooner/screens/home_details/view.dart';

import '../support/view.dart';

class StatusesScreen extends StatelessWidget {
  final String mainImagePath;
  final int type;

  // 0 for police
  // 1 for hospitals
  // 2 for matafii

  const StatusesScreen({
    Key? key,
    this.mainImagePath = "assets/icons/police.png",
    this.type = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
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
              height: 10.h,
            ),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.only(start: 29.w, end: 27.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(68.r),
                    border:
                        Border.all(color: const Color(0xff707070), width: 1.h)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    Image.asset(mainImagePath, width: 164.w, height: 144.h),
                    SizedBox(
                      height: 13.h,
                    ),
                    Container(
                      height: 42.h,
                      width: 233.w,
                      child: Center(
                          child: Text(
                        "الحالات",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          color:  Color(type==0?0xff060E44:0xff851B1B),
                          borderRadius: BorderRadius.circular(7.r)),
                    ),
                    Expanded(
                        child: Container(
                      width: 233.w,
                      margin: EdgeInsets.only(top: 16.h,bottom: 100.h),
                      decoration: BoxDecoration(
                          color:  Color(type==0?0xaa060E44:0xffB74949),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: (){
                            navigateTo(context, page: HomeDetailsScreen(type: type,index: index,mainImagePath: mainImagePath,));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              type ==0?policeTitles[index]:type ==1?hospitalsTitles[index]:policeTitles[index],
                              style:
                                  TextStyle(fontSize: 20.sp, color: Colors.white),
                            ),
                          ),
                        ),
                        itemCount: type ==0?policeTitles.length:type ==1?hospitalsTitles.length:policeTitles.length,
                      ),
                    )),

                    // type == 0
                    //     ? SingleChildScrollView(
                    //   child: Padding(
                    //     padding: EdgeInsets.all(16.r),
                    //     child: Column(
                    //       children: [
                    //         Align(
                    //             alignment:
                    //             AlignmentDirectional.centerStart,
                    //             child: Text(policeQuestion,
                    //                 style: TextStyle(
                    //                     fontSize: 20.sp,
                    //                     fontWeight: FontWeight.bold))),
                    //         Column(
                    //           children: List.generate(
                    //               policeBodyList.length,
                    //                   (index) => Column(
                    //                 crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //                 children: [
                    //
                    //                   Row(
                    //                     children: [
                    //                       Text(
                    //                         numbers[index]+" : ",
                    //                         style: TextStyle(
                    //                             fontSize: 18.sp,
                    //                             fontWeight:
                    //                             FontWeight.bold),
                    //                       ),
                    //                       SizedBox(width: 5.w,),
                    //                       Text(
                    //                         policeTitles[index],
                    //                         style: TextStyle(
                    //                           fontSize: 16.sp,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                   SizedBox(
                    //                     height: 5.h,
                    //                   ),
                    //                   Text(
                    //                     policeBodyList[index],
                    //                   ),
                    //                   SizedBox(
                    //                     height: 10.h,
                    //                   )
                    //                 ],
                    //               )),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                    //     : const SizedBox.shrink(),
                    // type == 1
                    //     ? SingleChildScrollView(
                    //   child: Padding(
                    //     padding: EdgeInsets.all(16.r),
                    //     child: Column(
                    //       children: [
                    //         Text(
                    //           hospitalTitle,
                    //           style: TextStyle(
                    //               fontSize: 16.sp,
                    //               fontWeight: FontWeight.bold),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         SizedBox(
                    //           height: 20.h,
                    //         ),
                    //         Column(
                    //           children: List.generate(
                    //               policeBodyList.length,
                    //                   (index) => Column(
                    //                 children: [
                    //                   Align(
                    //                     alignment:
                    //                     AlignmentDirectional
                    //                         .centerStart,
                    //                     child: Text(
                    //                       hospitalBodyList[index],
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 10.h,
                    //                   )
                    //                 ],
                    //               )),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                    //     : const SizedBox.shrink(),
                    GestureDetector(
                      onTap: () {
                        navigateTo(context,
                            page: SupportScreen(
                              type: type,
                            ));
                      },
                      child: Container(
                        height: 80.h,
                        width: 308.w,
                        child: Center(
                            child: Text(
                          "الدعم الفوري ",
                          style:
                              TextStyle(fontSize: 28.sp, color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(68.r),
                            color: const Color(0xff181B6A).withOpacity(.85)),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
