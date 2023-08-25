import 'package:auth_playground/Shared/exports.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.text,
    this.ontap,
  });

  final String text;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: lightgrey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // google icon
            Image.asset('images/svg0 1.png'),
            SizedBox(width: 20.w),

            Center(
              child: Text(
                text,
                style: styledtext.copyWith(
                  color: black,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
