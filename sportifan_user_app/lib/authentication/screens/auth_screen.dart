import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportifan_user/authentication/widgets/auth_name_widget.dart';
import 'package:sportifan_user/authentication/widgets/auth_widget.dart';
import 'package:sportifan_user/constants/routes.dart';
import 'package:sportifan_user/widgets/snackbar.dart';
import 'package:sizer/sizer.dart';

String? uid;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController name = TextEditingController();
  bool numadded = false;
  bool addName = false;
  bool otpAdded = false;
  String? myverificationId;
  void addPhoneNumber() {
    String phoneNumber = controller.text;
  }

  void toggleNumAdded() {
    setState(() {
      numadded = !numadded;
    });
  }

  Future<void> signInPhoneNumber(
      BuildContext context, String phoneNumber) async {
    try {
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceSendingToken) {
            myverificationId = verificationId;

            numadded = true;
            setState(() {});
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showBar(context, e.toString());
    }
  }

  void verifyOtp(
      {required BuildContext context,
      required String otp,
      required verificationId,
      required Function onSuccess}) async {
    try {
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      User? user =
          (await _firebaseAuth.signInWithCredential(phoneAuthCredential)).user;
      if (user != null) {
        uid = user.uid;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", uid!);
        onSuccess();
      }
      otpAdded = true;
      setState(() {});
    } on FirebaseAuthException catch (e) {
      showBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF238F20),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        width: 100.w,
                        height: (484 / 8).h,
                        decoration: const BoxDecoration(
                          // gradient: RadialGradient(
                          //   center: Alignment(0.45, 0.51),
                          //   radius: 0.26,
                          //   colors: [Color(0xFF228F20), Color(0x9941F03C)],
                          // ),
                          color: Color(0xFF228F20),
                        ),
                        child: Image.asset(
                          'assets/images/Login Banner.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    if (!numadded)
                      AuthWidget(
                        inputType: TextInputType.number,
                        controller: controller,
                        mainText: 'Enter Your Mobile Number to Login',
                        secMainText: 'You will recieve an OTP',
                        hintText: "Enter Your Phone Number",
                        callback: () {
                          signInPhoneNumber(context, "+91" + controller.text);
                        },
                      ),
                    if (numadded && !otpAdded)
                      AuthWidget(
                        inputType: TextInputType.number,
                        controller: otpcontroller,
                        mainText: 'Enter Your OTP',
                        secMainText:
                            'You will recieve an OTP to ${controller.text}',
                        hintText: "Enter Your OTP",
                        isOtpScreen: true,
                        onEdit: toggleNumAdded,
                        callback: () {
                          if (otpcontroller.text.isNotEmpty) {
                            verifyOtp(
                                context: context,
                                otp: otpcontroller.text,
                                verificationId: myverificationId,
                                onSuccess: () {
                                  otpAdded = true;
                                });
                          } else {
                            showBar(context, "Enter Six digit code");
                          }
                        },
                      ),
                    if (numadded && otpAdded)
                      AddName(
                          controller: name,
                          hintText: "Enter your Profile name",
                          callback: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              homePageRoute,
                              (route) => false,
                            );
                          })
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
