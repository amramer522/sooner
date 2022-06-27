import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sooner/helper/fake_data.dart';
import 'package:sooner/helper/helper_methods.dart';
import 'package:sooner/screens/home/view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helper/current_location.dart';
import 'controller.dart';

class SupportScreen extends StatefulWidget {
  final int type;

  // 0 for police
  // 1 for hospitals
  // 2 for matafii

  SupportScreen({
    Key? key,
    this.type = 1,
  }) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final controller = SupportController();

  @override
  void initState() {
    super.initState();
    MyCurrentLocation.getCurrentLocation(context);
  }

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
                                navigateTo(context,page: const HomeScreen());
                              },
                              child: Container(
                                color: const Color(0xff7A7C81),
                                padding: EdgeInsets.all(8.r),
                                child: const Text("home",style: TextStyle(color: Colors.white),),
                              )),
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
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsetsDirectional.only(start: 29.w, end: 27.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(68.r),
                    color: const Color(0xffC7C7C7),
                    border:
                        Border.all(color: const Color(0xff707070), width: 1.h)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    FutureBuilder(
                        future: MyCurrentLocation.getCurrentLocation(context),
                        builder: (context, snap) {
                          if (snap.hasData) {
                            controller.markers.add(Marker(
                                markerId: const MarkerId(("myPosition")),
                                position: LatLng(MyCurrentLocation.myCurrentLocation!.latitude,
                                    MyCurrentLocation.myCurrentLocation!.longitude),
                                icon:
                                BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueGreen)));
                            // setState(() {});
                            return Container(
                              height: 500.h,
                              width: 308.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(68.r)),
                              clipBehavior: Clip.antiAlias,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.markers,
                                onTap: (argument) {
                                  controller.markers.add(Marker(
                                      markerId: const MarkerId(("myPosition")),
                                      position: LatLng(argument.latitude,
                                          argument.longitude),
                                      icon:
                                          BitmapDescriptor.defaultMarkerWithHue(
                                              BitmapDescriptor.hueGreen)));
                                  setState(() {});
                                },
                                initialCameraPosition:  CameraPosition(
                                    target: LatLng(MyCurrentLocation.myCurrentLocation!.latitude,
                                        MyCurrentLocation.myCurrentLocation!.longitude),
                                    zoom: 15),
                              ),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                    SizedBox(
                      height: 13.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) =>AlertDialog(
                              backgroundColor: Color(0xff060A4A).withOpacity(.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(63.r)
                              ),

                              content: Text('تم مشاركة الموقع بنجاح\nسوف يتم الوصول اليك\nفى اسرع الوقت ممكن',style: TextStyle(fontSize: 30.sp,color: Colors.white),textAlign: TextAlign.center,),
                            )
                        );
                      },
                      child: Container(
                        height: 80.h,
                        width: 308.w,
                        child: Center(
                            child: Text(
                          "مشاركة موقعك",
                          style:
                              TextStyle(fontSize: 28.sp, color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(68.r),
                            color: const Color(0xff181B6A).withOpacity(.85)),
                      ),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    GestureDetector(
                      onTap: () async{
                        var _url = Uri.parse("tel://+${widget.type ==0?122:widget.type ==1?123:180}");
                        if (!await launchUrl(_url)) throw 'Could not launch $_url';
                      },
                      child: Container(
                        height: 80.h,
                        width: 308.w,
                        child: Center(
                            child: Text(
                          "${widget.type ==0?122:widget.type ==1?123:180}",
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
            ],
          ),
        ),
      ),
    );
  }
}

