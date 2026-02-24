import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_guide/provider_api/viewmodels/post_vewmodel.dart';
import 'package:provider_guide/provider_api/views/post_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PostViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PostScreen());
  }
}
