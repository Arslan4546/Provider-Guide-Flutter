import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  Future<List<PostModel>> fetchPosts() async {
    final url = Uri.parse('https://dummyjson.com/posts');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List posts = data['posts'];

        return posts.map((e) => PostModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
