// ignore_for_file: prefer_const_constructors

import 'package:auth_playground/Shared/exports.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
              top: 100.h, left: 25.w, right: 25.w, bottom: 10.h),
          children: [
            // image
            SizedBox(
              width: 280.w,
              height: 270.h,
              child: Image.asset(
                'images/amico2.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30.h),

            //body text
            SizedBox(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Know Before You Meet',
                      style: styledtext.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Center(
                    child: Text(
                      'Talk to your Roommate, know each other and make decision together',
                      textAlign: TextAlign.center,
                      style: styledtext.copyWith(
                        color: grey,
                        fontSize: 14.sp,
                        height: 1.5.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 54.h),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      //child: streamProvider == null ? LogIn() : Welcome(),
                      child: SignUp(),
                      type: PageTransitionType.rightToLeft),
                );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
