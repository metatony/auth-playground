// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:auth_playground/Shared/exports.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final auth = AuthServices();
  String error = '';

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
                  controller: emailSigninController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputdecoration,
                ),

                //password field
                TextFormField(
                  controller: passwordSigninController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: inputdecoration.copyWith(
                    hintText: 'enter your password',
                  ),
                ),

                SizedBox(height: 20.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: ForgotPassword(),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: styledtext.copyWith(
                          fontSize: 10.sp, color: blue, letterSpacing: 0.5.w),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                //login user
                ReuseableButton(
                  text: 'Continue',
                  ontap: () async {
                    setState(() {
                      loading = true;
                    });
                    dynamic user = await auth.loginUserWithEmailAndPassword(
                        emailSigninController.text,
                        passwordSigninController.text);

                    if (user == null) {
                      print('error logging user in');

                      setState(() {
                        error = 'Error occured, please try again 🥲';
                        loading = false;
                      });
                      user(passwordSigninController.clear());
                    } else {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: Welcome(),
                            type: PageTransitionType.rightToLeft),
                      );
                    }
                  },
                ),

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
