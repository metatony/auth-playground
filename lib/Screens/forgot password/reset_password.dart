// ignore_for_file: prefer_const_constructors




import 'package:auth_playground/Screens/signup%20screen/signup.dart';
import 'package:auth_playground/Shared/exports.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  'images/character-1.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 20.h),

            //body text
            Text(
              'Reset Password ?',
              style: styledtext.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.h),

            //forgot password form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // New password
                  TextFormField(
                    controller: newpasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: inputdecoration.copyWith(
                      hintText: 'new password',
                    ),
                    validator: (value) =>
                        value == null ? 'password don\'t match' : null,
                  ),

                  // Confirm new password
                  TextFormField(
                    controller: confirmNewpasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: inputdecoration.copyWith(
                      hintText: 'confirm new password',
                    ),
                    validator: (value) =>
                        value == null ? 'password don\'t match' : null,
                  ),

                  SizedBox(height: 100.h),

                  ReuseableButton(
                    ontap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: SignUp(),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                    text: 'Reset Password',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
