// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  Video({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  int total;
  int totalHits;
  List<Hit> hits;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    total: json["total"],
    totalHits: json["totalHits"],
    hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalHits": totalHits,
    "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
  };
}

class Hit {
  Hit({
    required this.id,
    required this.pageUrl,
     required this.type,
    required this.tags,
    required this.duration,
    required this.pictureId,
    required this.videos,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  int id;
  String pageUrl;
  dynamic type;
  String tags;
  int duration;
  String pictureId;
  Videos videos;
  int views;
  int downloads;
  int likes;
  int comments;
  int userId;
  String user;
  String userImageUrl;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
    id: json["id"],
    pageUrl: json["pageURL"],
    type: typeValues.map[json["type"]] ,
    tags: json["tags"],
    duration: json["duration"],
    pictureId: json["picture_id"],
    videos: Videos.fromJson(json["videos"]),
    views: json["views"],
    downloads: json["downloads"],
    likes: json["likes"],
    comments: json["comments"],
    userId: json["user_id"],
    user: json["user"],
    userImageUrl: json["userImageURL"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pageURL": pageUrl,
    "type": typeValues.reverse[type],
    "tags": tags,
    "duration": duration,
    "picture_id": pictureId,
    "videos": videos.toJson(),
    "views": views,
    "downloads": downloads,
    "likes": likes,
    "comments": comments,
    "user_id": userId,
    "user": user,
    "userImageURL": userImageUrl,
  };
}

enum Type { FILM }

final typeValues = EnumValues({
  "film": Type.FILM
});

class Videos {
  Videos({
    required this.large,
    required this.medium,
    required this.small,
    required this.tiny,
  });

  Large large;
  Large medium;
  Large small;
  Large tiny;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
    large: Large.fromJson(json["large"]),
    medium: Large.fromJson(json["medium"]),
    small: Large.fromJson(json["small"]),
    tiny: Large.fromJson(json["tiny"]),
  );

  Map<String, dynamic> toJson() => {
    "large": large.toJson(),
    "medium": medium.toJson(),
    "small": small.toJson(),
    "tiny": tiny.toJson(),
  };
}

class Large {
  Large({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });

  String url;
  int width;
  int height;
  int size;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
    url: json["url"],
    width: json["width"],
    height: json["height"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
    "size": size,
  };
}

class EnumValues<T> {
  late Map<String, T> map ;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
