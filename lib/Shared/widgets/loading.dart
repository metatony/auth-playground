// ignore_for_file: prefer_const_constructors

import 'package:auth_playground/Shared/exports.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          SpinKitPulse(
            color: black,
            duration: Duration(seconds: 3),
            size: 50.0,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
