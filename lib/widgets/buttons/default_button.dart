import 'package:flutter/material.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.title, required this.onPresssed})
      : super(key: key);
  final String title;
  final VoidCallback onPresssed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPresssed,
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
      ),
      child: Text(
        title,
        style: CustomStyle.buttonTextStyle,
      ),
    );
  }
}
