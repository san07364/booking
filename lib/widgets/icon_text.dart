import 'package:booking/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconText extends StatelessWidget {
  final String text;
  final String asset;
  const IconText({Key? key, required this.text, required this.asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(asset),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: Style.normal,
        ),
      ],
    );
  }
}
