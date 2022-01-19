import 'package:booking/model/activity.dart';
import 'package:booking/model/event.dart';

final kDummyData = [
  Event(time: "10:00-10:15", activities: [
    Activity(
        title: "Barbara Streisand",
        time: "15min",
        mode: "Cruise",
        isActive: true,
        rating: 4.5,
        status: "Riding"),
    Activity(
        title: "John Davies",
        time: "15min",
        mode: "Advanced mode",
        isActive: true,
        rating: 4,
        status: "Sheduled"),
    Activity(
        title: "Frank de Beer",
        time: "15min",
        mode: "Advanced mode",
        isActive: false,
        rating: 4,
        status: "Canceled"),
  ]),
  Event(time: "10:15-10:30", activities: [
    Activity(
        title: "Sofia Goldberg",
        time: "15min",
        mode: "Advanced mode",
        isActive: true,
        rating: 4,
        status: "Sheduled"),
  ])
];
