import 'package:flutter/material.dart';
import 'package:provider_guide/provider_api/services/post_service.dart';
import '../models/post_model.dart';

class PostViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<PostModel> _posts = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _posts = await _apiService.fetchPosts();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
