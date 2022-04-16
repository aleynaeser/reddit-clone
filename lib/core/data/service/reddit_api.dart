import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../model/reddit.dart';

class RedditApi {
  static Future<List<Reddit>> fetchReddit() async {
    final response = await http.get(Uri.parse(redditJson));
    final jsonData = json.decode(response.body);
    var dataJson = jsonData['data']['children'];
    List<Reddit> data = [];
    for (var r in dataJson) {
      Reddit redditData = Reddit.fromJson(r['data']);
      data.add(redditData);
    }
    return data;
  }
}
