import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_guide/provider_api/viewmodels/post_vewmodel.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PostViewModel>().fetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts API")),
      body: Consumer<PostViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.errorMessage.isNotEmpty) {
            return Center(child: Text(vm.errorMessage));
          }

          return ListView.builder(
            itemCount: vm.posts.length,
            itemBuilder: (context, index) {
              final post = vm.posts[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
