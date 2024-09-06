import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/custom_style.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.index,
      this.subTitle = ''})
      : super(key: key);

  final String image, title, subTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      child: Stack(
        children: [
          Visibility(
            visible: index == 1,
            child: Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title.tr,
                  style: CustomStyle.onboardTitleStyle,
                ),
              ),
            ),
          ),
          Visibility(
            visible: index != 1,
            child: Positioned(
              bottom: 300,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      title.tr,
                      style: index == 0
                          ? CustomStyle.onboardTitleStyle2
                          : CustomStyle.onboardTitleStyle,
                    ),
                    Visibility(
                      visible: index == 0,
                      child: Text(
                        subTitle.tr,
                        style: CustomStyle.onboardTitleStyle3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
