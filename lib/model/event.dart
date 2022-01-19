import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:booking/model/activity.dart';

class Event {
  final String time;
  final List<Activity> activities;
  Event({
    required this.time,
    required this.activities,
  });

  Event copyWith({
    String? time,
    List<Activity>? activities,
  }) {
    return Event(
      time: time ?? this.time,
      activities: activities ?? this.activities,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'activities': activities.map((x) => x.toMap()).toList(),
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      time: map['time'] ?? '',
      activities: List<Activity>.from(
          map['activities']?.map((x) => Activity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));

  @override
  String toString() => 'Event(time: $time, activities: $activities)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Event &&
        other.time == time &&
        listEquals(other.activities, activities);
  }

  @override
  int get hashCode => time.hashCode ^ activities.hashCode;
}
