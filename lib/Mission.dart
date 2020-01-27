import 'package:meta/meta.dart';
import 'dart:convert';

class Mission {
    final int userId;
    final int id;
    final String title;
    final bool completed;

    Mission({
        @required this.userId,
        @required this.id,
        @required this.title,
        @required this.completed,
    });

    Mission copyWith({
        int userId,
        int id,
        String title,
        bool completed,
    }) => 
        Mission(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            completed: completed ?? this.completed,
        );

    factory Mission.fromJson(String str) => Mission.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Mission.fromMap(Map<String, dynamic> json) => Mission(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        completed: json["completed"] == null ? null : json["completed"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "completed": completed == null ? null : completed,
    };
}