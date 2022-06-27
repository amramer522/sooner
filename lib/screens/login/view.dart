import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooner/screens/home/view.dart';
import 'package:sooner/screens/register/view.dart';

import '../../helper/helper_methods.dart';
import '../../shared/app_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              Row(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text("LOG IN",
                      style: TextStyle(fontSize: 24.sp, color: Colors.white)),
                  const Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                      onTap: () {
                        navigateTo(context, page: const RegisterScreen());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      )),
                  SizedBox(
                    width: 20.w,
                  )
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              AppInput(
                  hintText: "Must be enter 14 number",
                  label: "ID",
                  fromRegister: false),
              AppInput(
                  hintText: "Must be at least 6 characters",
                  label: "Password",
                  isPassword: true,
                  fromRegister: false),
              SizedBox(
                height: 35.9.h,
              ),
              ElevatedButton(onPressed: () {
                navigateTo(context,page: HomeScreen(),);
              }, child: Text("Sign in")),
              SizedBox(
                height: 50.4.h,
              ),
              Text(
                "By continuing, you agree to accept our\nPrivacy Policy & Terms of Service.",
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
