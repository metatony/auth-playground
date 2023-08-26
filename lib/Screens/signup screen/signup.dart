// ignore_for_file: prefer_const_constructors

import 'package:auth_playground/Screens/signup%20screen/form.dart';
import 'package:auth_playground/Shared/exports.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final stream = AuthServices();

    return loading
        ? Loading()
        : StreamBuilder(
            stream: stream.auth.authStateChanges(),
            builder: (context, snapshot) => snapshot.hasData
                ? Welcome()
                : Scaffold(
                    body: SafeArea(
                      child: ListView(
                        padding: EdgeInsets.only(
                            top: 25.h, left: 25.w, right: 25.w, bottom: 10.h),
                        children: [
                          // image
                          SizedBox(
                            width: 280.w,
                            height: 230.h,
                            child: Image.asset(
                              'images/Group 19.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Sign Up',
                            style: styledtext.copyWith(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.h),

                          // signup form
                          SizedBox(
                            width: double.infinity,
                            child: SignupForm(),
                          ),

                          SizedBox(height: 20.h),

                          // footer
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'Joined us before? ',
                                style: styledtext.copyWith(
                                    color: grey, fontSize: 10.sp),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            child: LogIn(),
                                            type:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        );
                                      },
                                    text: 'Login',
                                    style: styledtext.copyWith(
                                      fontSize: 10.sp,
                                      color: blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
  }
}
