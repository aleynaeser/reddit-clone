import 'package:reddit_clone/core/data/model/reddit.dart';

class RedditData {
  late String kind;
  late Reddit data;

  RedditData({required this.kind, required this.data});

  RedditData.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = Reddit.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['data'] = this.data.toJson();
    return data;
  }
}