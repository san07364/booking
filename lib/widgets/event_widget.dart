import 'package:booking/model/event.dart';
import 'package:booking/utils/pallet.dart';
import 'package:booking/utils/textstyle.dart';
import 'package:booking/widgets/icon_text.dart';
import 'package:booking/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Container(
              height: 2,
              width: 25,
              color: Pallet.unselected,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              event.time,
              style: Style.largeHeading,
            ),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: event.activities.length,
            itemBuilder: (_, i) {
              var activity = event.activities[i];
              return Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Pallet.border.withOpacity(0.4),
                    border: Border.all(color: Pallet.border),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            activity.title,
                            style: activity.isActive
                                ? Style.heading
                                : Style.heading.copyWith(
                                    decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        StarRating(
                          rating: activity.rating,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.loose,
                          child: Wrap(
                            runSpacing: 5,
                            children: [
                              IconText(
                                  text: activity.time,
                                  asset: "asset/image/clock.svg"),
                              const SizedBox(
                                width: 18,
                              ),
                              IconText(
                                  text: activity.mode,
                                  asset: "asset/image/flag.svg"),
                              const SizedBox(
                                width: 18,
                              ),
                            ],
                          ),
                        ),
                        IconText(
                            text: activity.status,
                            asset: "asset/image/loading.svg")
                      ],
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}
