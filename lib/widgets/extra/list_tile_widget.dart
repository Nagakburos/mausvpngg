import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';

class CustomListTileWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function function;
  final Widget? trailing;
  final bool color;

  const CustomListTileWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.function,
    this.trailing,
    this.color = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ListTile(
        onTap: () {
          function();
        },
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: color
                  ? TextStyle(
                      color: Colors.red,
                      fontSize: Dimensions.mediumTextSize,
                      fontWeight: FontWeight.w600,
                    )
                  : CustomStyle.drawerTitleStyle,
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              width: 2,
            ),
          ],
        ),
        leading: icon,
        trailing: trailing,
      ),
    );
  }
}
