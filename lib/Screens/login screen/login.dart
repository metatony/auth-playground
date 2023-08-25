// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:auth_playground/Shared/exports.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding:
              EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w, bottom: 10.h),
          children: [
            // image
            SizedBox(
                width: 280.w,
                height: 230.h,
                child: Image.asset(
                  'images/rafiki.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 20.h),
            Text(
              'Login',
              style: styledtext.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),

            // signin form
            SizedBox(
              width: double.infinity,
              child: LoginForm(),
            ),

            SizedBox(height: 10.h),

            //login with google
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'OR',
                    style: styledtext.copyWith(fontSize: 11.sp, color: grey),
                  ),
                  SizedBox(height: 10.h),

                  //google button
                  GoogleButton(
                    ontap: () async {
                      final auth = AuthServices();
                      dynamic user = await auth.signInWithGoogle();

                      if (user == null) {
                        print('error signing in');
                      } else {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: Welcome(),
                              type: PageTransitionType.rightToLeft),
                        );
                      }
                    },
                    text: 'Login with Google',
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            // footer
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: styledtext.copyWith(color: grey, fontSize: 10.sp),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            PageTransition(
                                child: SignUp(),
                                type: PageTransitionType.rightToLeft),
                          );
                        },
                      text: 'SignUp',
                      style: styledtext.copyWith(fontSize: 10.sp, color: blue),
                    ),
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
