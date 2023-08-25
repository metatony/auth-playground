
import 'package:auth_playground/Shared/exports.dart';

class ReuseableButton extends StatelessWidget {
  const ReuseableButton({
    super.key, required this.text, this.ontap,
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
          color: black,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            text,
            style: styledtext.copyWith(
              color: white,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
