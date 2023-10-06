import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_list/posts/bloc/post_bloc.dart';
import 'package:infinite_list/posts/bloc/post_event.dart';
import 'package:infinite_list/posts/view/post_list.dart';
import 'package:shared/shared.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
