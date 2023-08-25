// ignore_for_file: prefer_const_constructors

import 'package:auth_playground/Shared/exports.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
      ),
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
                  'images/amico.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 20.h),

            //body text
            Text(
              'Forgot Password ?',
              style: styledtext.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.h),

            Text(
              'Don’t worry! It happens. Please enter the email address associated with your account.',
              style: styledtext.copyWith(
                color: grey,
                fontSize: 11.sp,
                height: 1.5.h,
              ),
            ),

            SizedBox(height: 24.h),

            //forgot password form
            Form(
              key: _formKey,
              child: TextFormField(
                controller: forgotpasswordController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputdecoration.copyWith(
                  hintText: 'enter your email',
                ),
                validator: (value) => value == null ? 'enter your email' : null,
              ),
            ),
            SizedBox(height: 138.h),

            ReuseableButton(
              ontap: () async {
                final auth = AuthServices();

                await auth.resetPassword(
                    forgotpasswordController.text, context);
                forgotpasswordController.clear();
              },
              text: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
