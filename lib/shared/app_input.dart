import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  final String hintText, label;
  final TextEditingController? controller;
  final bool isPassword;
  final bool fromRegister;

  AppInput(
      {Key? key,
      this.hintText = "",
      this.controller,
      this.label = "",
      this.isPassword = false, this.fromRegister= true})
      : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 50.w, top: widget.fromRegister?27.h:34.h, end: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.label,
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
            SizedBox(
              height: 6.h,
            ),
            TextFormField(
              controller: widget.controller,
              obscureText: widget.isPassword ? isHidden : false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                  isDense: true,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(
                              isHidden ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            isHidden = !isHidden;
                            setState(() {});
                          })
                      : null,
                  hintText: widget.hintText,
                  hintStyle:
                      TextStyle(color: const Color(0xffC4C4C4), fontSize: 14.sp),
                  filled: true,
                  fillColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
