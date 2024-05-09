import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  final String id;
  final String name;
  final String bio;
  final String image;

  News({required this.id, required this.name, required this.bio, required this.image});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['_id'],
      name: json['name'],
      bio: json['bio'] ?? "",
      image: json['image'] ?? "",
    );
  }
}

class NewsProvider {
  static const String _baseUrl = 'http://localhost:3000';

  Future<News> createNews(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/news'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return News.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create news');
    }
  }

  Future<List<News>> fetchAllNews() async {
    final response = await http.get(Uri.parse('$_baseUrl/news'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((news) => News.fromJson(news)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<News> fetchNewsById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/news/$id'));

    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('News not found');
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<News> updateNews(String id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/news/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('News not found');
    } else {
      throw Exception('Failed to update news');
    }
  }
}
