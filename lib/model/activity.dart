import 'dart:convert';

class Activity {
  final String title;
  final String time;
  final String mode;
  final bool isActive;
  final double rating;
  final String status;
  Activity({
    required this.title,
    required this.time,
    required this.mode,
    required this.isActive,
    required this.rating,
    required this.status,
  });

  Activity copyWith({
    String? title,
    String? time,
    String? mode,
    bool? isActive,
    double? rating,
    String? status,
  }) {
    return Activity(
      title: title ?? this.title,
      time: time ?? this.time,
      mode: mode ?? this.mode,
      isActive: isActive ?? this.isActive,
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'time': time,
      'mode': mode,
      'isActive': isActive,
      'rating': rating,
      'status': status,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      title: map['title'] ?? '',
      time: map['time'] ?? '',
      mode: map['mode'] ?? '',
      isActive: map['isActive'] ?? false,
      rating: map['rating']?.toDouble() ?? 0.0,
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) =>
      Activity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Activity(title: $title, time: $time, mode: $mode, isActive: $isActive, rating: $rating, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Activity &&
        other.title == title &&
        other.time == time &&
        other.mode == mode &&
        other.isActive == isActive &&
        other.rating == rating &&
        other.status == status;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        time.hashCode ^
        mode.hashCode ^
        isActive.hashCode ^
        rating.hashCode ^
        status.hashCode;
  }
}
