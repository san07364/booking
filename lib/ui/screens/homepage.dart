import 'package:booking/model/dummy_data.dart';
import 'package:booking/utils/pallet.dart';
import 'package:booking/utils/textstyle.dart';
import 'package:booking/widgets/date_widget.dart';
import 'package:booking/widgets/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Pallet.primary,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: Style.small.copyWith(color: Pallet.primary),
        unselectedLabelStyle: Style.small.copyWith(color: Pallet.unselected),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("asset/image/bookings.svg"),
            activeIcon: SvgPicture.asset(
              "asset/image/bookings.svg",
              color: Pallet.primary,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "asset/image/check_in.svg",
            ),
            activeIcon: SvgPicture.asset(
              "asset/image/check_in.svg",
              color: Pallet.primary,
            ),
            label: 'Check-In',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("asset/image/return.svg"),
            activeIcon: SvgPicture.asset(
              "asset/image/return.svg",
              color: Pallet.primary,
            ),
            label: 'Return',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("asset/image/tracking.svg"),
            activeIcon: SvgPicture.asset(
              "asset/image/tracking.svg",
              color: Pallet.primary,
            ),
            label: 'Tracking',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("asset/image/reporting.svg"),
            activeIcon: SvgPicture.asset(
              "asset/image/reporting.svg",
              color: Pallet.primary,
            ),
            label: 'Reporting',
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Pallet.primary,
                  border: Border.all(width: 0, color: Pallet.primary),
                ),
                height: 55,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Pallet.primary,
                  border: Border.all(width: 0, color: Pallet.primary),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.25,
                    ),
                    Center(
                      child: Text(
                        "Bookings",
                        style: Style.heading.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const DateWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      primary: true,
                      child: Column(
                        children: List.generate(kDummyData.length, (index) {
                          return EventWidget(event: kDummyData[index]);
                        }),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
