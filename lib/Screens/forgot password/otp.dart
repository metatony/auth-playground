// ignore_for_file: prefer_const_constructors


import 'package:auth_playground/Shared/exports.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w, bottom: 10.h),
          children: [
            // image
            SizedBox(
                width: 280.w,
                height: 230.h,
                child: Image.asset(
                  'images/amico1.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 20.h),

            //body text
            Center(
              child: Text(
                'Verification Code',
                style: styledtext.copyWith(
                    fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24.h),

            Text(
              'A 4 digit code has been sent to  ${forgotpasswordController.text}',
              style: styledtext.copyWith(
                color: grey,
                fontSize: 11.sp,
                height: 1.h,
              ),
            ),

            SizedBox(height: 24.h),

            // OTP form
            //

            SizedBox(height: 24.h),

            ReuseableButton(
              ontap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: ResetPasswordScreen(), type: PageTransitionType.rightToLeft),
                );
              },
              text: 'Verify',
            ),

            SizedBox(height: 12.h),

            // footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resend Code',
                  style: styledtext.copyWith(color: grey, fontSize: 11.sp),
                ),
                Text(
                  '1:20 min left',
                  style: styledtext.copyWith(color: grey, fontSize: 11.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
