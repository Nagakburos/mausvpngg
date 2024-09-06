import 'package:flutter/material.dart';

import '../../utils/custom_style.dart';

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  HomeCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  final String title, subtitle;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.45,
      // height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: CustomStyle.tabToConnectTitleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              subtitle,
              style: CustomStyle.countrySubtitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
