// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:auth_playground/Shared/exports.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '😆',
                style: styledtext.copyWith(fontSize: 100.sp),
              ),
              Text('You made it !!'),
              TextButton(
                onPressed: () async {
                  final auth = AuthServices();
                  await auth.signOutUser();
                  Navigator.push(
                    context,
                    PageTransition(
                        child: SignUp(), type: PageTransitionType.rightToLeft),
                  );
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
