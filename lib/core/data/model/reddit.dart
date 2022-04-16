import 'dart:convert';

class Reddit {
  String? id;
  String? authorFullname;
  String? title;
  String? thumbnail;
  String? selfText;
  int? score;
  int? numComments;
  bool? noFollow;

  Reddit({
    required this.id,
    required this.authorFullname,
    required this.title,
    required this.thumbnail,
    required this.selfText,
    required this.score,
    required this.numComments,
    required this.noFollow,
  });

  factory Reddit.fromJson(Map<dynamic, dynamic> json) => Reddit(
        id: json["id"],
        authorFullname: json["author_fullname"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        selfText: json["selftext"],
        score: json["score"],
        numComments: json["num_comments"],
        noFollow: json["no_follow"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "author_fullname": authorFullname,
        "title": title,
        "thumbnail": thumbnail,
        "teletext": selfText,
        "score": score,
        "num_comments": numComments,
        "no_follow": noFollow,
      };

}
