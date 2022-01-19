import 'package:booking/pallet.dart';
import 'package:booking/textstyle.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({Key? key}) : super(key: key);

  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  List<String> days = ["M", "T", "W", "T", "F", "S", "S"];
  List<String> dates = ["6", "7", "8", "9", "10", "11", "12"];
  List<bool> isSelected = List.filled(7, false);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
          color: Pallet.primary,
          child: Column(
            children: [
              SizedBox(
                height: 13,
                width: size.width,
              ),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(days.length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          days[index],
                          style: Style.small.copyWith(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.3)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: isSelected[index]
                                ? Colors.white.withOpacity(0.3)
                                : Colors.transparent,
                            child: Text(
                              dates[index],
                              style: Style.small
                                  .copyWith(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          )),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
