import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grootanapps/resuables/size.dart';
import 'package:grootanapps/resuables/string.dart';
import 'package:grootanapps/views/qr_generator.dart';
import 'package:grootanapps/widgets/main_ui.dart';
import 'package:grootanapps/widgets/textformfield.dart';

import '../widgets/buttonwidget.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({
    super.key,
  });

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> otpForm = GlobalKey<FormState>();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();
  bool enableOTP = false;
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      pageName: "LOGIN",
      child: Padding(
        padding: EdgeInsets.only(
          top: MySize.s100!,
          left: MySize.s20!,
          right: MySize.s20!,
        ),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Phone Number',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MySize.s20,
                ),
              ),
              SizedBox(
                height: MySize.s10,
              ),
              CustomTextFormFeild(
                hintText: 'Enter Phone number',
                validator: (value) {
                  RegExp phone = RegExp(Stringsvaidators.phonevalidator);
                  if (value!.isEmpty) {
                    return "Please Enter Phone Number";
                  } else if (!phone.hasMatch(value)) {
                    return "Please Enter valid mobile number";
                  }
                  return null;
                },
                controller: phonecontroller,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.none,
                maxLength: 10,
              ),
              enableOTP
                  ? Form(
                      key: otpForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MySize.s40,
                          ),
                          Text(
                            'OTP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MySize.s20,
                            ),
                          ),
                          SizedBox(
                            height: MySize.s10,
                          ),
                          CustomTextFormFeild(
                            hintText: 'Enter OTP',
                            validator: (value) {
                              RegExp otp =
                                  RegExp(Stringsvaidators.phonevalidator);
                              if (value!.isEmpty) {
                                return "Please Enter OTP Number";
                              }
                              return null;
                            },
                            controller: otpcontroller,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.none,
                            maxLength: 10,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: MySize.s80,
              ),
              ButtonWidget(
                title: "Login",
                onPress: () async {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      enableOTP = true;
                    });

                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: "+91${phonecontroller.text}",
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent:
                          (String verificationId, int? resendToken) async {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: otpcontroller.text);

                        print("verificationId");
                        print(verificationId);

                        await auth
                            .signInWithCredential(credential)
                            .then((value) => Get.to(() => const LoginFields()));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        print("verificationId");
                        print(verificationId);
                        print(verificationId);
                      },
                    );
                    Get.to(const QRPage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
