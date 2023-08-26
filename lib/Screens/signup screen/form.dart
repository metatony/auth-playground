// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:auth_playground/Shared/exports.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  final auth = AuthServices();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // email field
                TextFormField(
                  controller: emailSignupController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputdecoration,
                ),

                //password field
                TextFormField(
                  controller: passwordSignupController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: inputdecoration.copyWith(
                    hintText: 'enter your password',
                  ),
                ),

                SizedBox(height: 24.h),

                Text(
                  'By signing up, you’ve agree to our terms and conditions and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: styledtext.copyWith(
                    fontSize: 10.sp,
                    color: grey,
                    height: 2.h,
                  ),
                ),

                SizedBox(height: 25.h),

                // signup user
                ReuseableButton(
                    text: 'Continue',
                    ontap: () async {
                      final auth = AuthServices();

                      setState(() {
                        loading = true;
                      });

                      dynamic user = await auth.signUpWithEmailAndPassword(
                          emailSignupController.text,
                          passwordSignupController.text);
                      if (user == null) {
                        print('error creating user');

                        setState(() {
                          error = 'Error occured while creating user 🥲';
                          loading = false;
                        });

                        user(passwordSignupController.clear());
                      } else {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: LogIn(),
                              type: PageTransitionType.rightToLeft),
                        );
                      }
                    }),

                if (error.isNotEmpty)
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Text(
                          error,
                          style:
                              styledtext.copyWith(color: red, fontSize: 11.sp),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
  }
}
