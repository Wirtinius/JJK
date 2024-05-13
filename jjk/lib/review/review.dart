import 'dart:convert';
import 'package:http/http.dart' as http;

class Review {
  final String id;
  final String text;
  final int rating;

  Review({required this.id, required this.text, required this.rating});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'],
      text: json['text'] ?? "",
      rating: json['rating'] ?? 0,
    );
  }
}

class ReviewProvider {
  static const String _baseUrl = 'http://localhost:3000';

  Future<Review> createReview(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/reviews'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return Review.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create review');
    }
  }

  Future<List<Review>> fetchAllReviews() async {
    final response = await http.get(Uri.parse('$_baseUrl/comments'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((review) => Review.fromJson(review)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  Future<Review> fetchReviewById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/comments/$id'));

    if (response.statusCode == 200) {
      return Review.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Review not found');
    } else {
      throw Exception('Failed to load review');
    }
  }

  Future<Review> updateReview(String id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/comments/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Review.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Review not found');
    } else {
      throw Exception('Failed to update review');
    }
  }
}
