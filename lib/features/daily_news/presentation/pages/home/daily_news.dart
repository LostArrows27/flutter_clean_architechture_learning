import 'package:flutter/material.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  } 

  _buildAppbar() {
    return AppBar(
        title: Text('Daily News', style: TextStyle(color: Colors.black)));
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is RemoteArticlesDone) {
        return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('$index'),
              );
            });
      }
      return const SizedBox();
    });
  }
}
