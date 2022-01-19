import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;

  const StarRating({Key? key, this.starCount = 5, required this.rating})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if (index >= rating) {
      icon = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SvgPicture.asset("asset/image/no_star.svg"),
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SvgPicture.asset("asset/image/half_star.svg"),
      );
    } else {
      icon = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SvgPicture.asset("asset/image/star.svg"),
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
