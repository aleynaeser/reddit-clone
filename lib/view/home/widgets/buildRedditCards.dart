import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/view/home/widgets/redditCard.dart';

import '../../../core/bloc/reddit_bloc.dart';
import '../../../core/data/model/reddit.dart';
import 'buildShimmerCard.dart';

class BuildRedditCards extends StatefulWidget {
  const BuildRedditCards({Key? key}) : super(key: key);

  @override
  _BuildRedditCardsState createState() => _BuildRedditCardsState();
}

class _BuildRedditCardsState extends State<BuildRedditCards> {
  final RedditBloc _redditBloc = RedditBloc();

  @override
  void initState() {
    _redditBloc.add(GetRedditData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _redditBloc,
      child: BlocListener<RedditBloc, RedditState>(
          listener: (context, state) {
            if (state is RedditError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<RedditBloc, RedditState>(
              builder: (context, state) {
                if (state is RedditLoaded) {
                  print("Success");
                  return buildRedditCardList(state.redditModel);
                } else if (state is RedditError) {
                  return SnackBar(
                    content: Text(state.message!),);
                } else {
                  return buildLoadingShimmer();
                }
              })
      ),
    );
  }
}

Widget buildLoadingShimmer() {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return buildRedditShimmer();
      });
}

Widget buildRedditCardList(Future<List<Reddit>> reddit) {
  return FutureBuilder<List<Reddit>>(
      future: reddit, builder: (context, snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            var store = snapshot.data![index];
            return RedditCard(
              store: store,
            );
          });
    } else if (snapshot.hasError) {
      return Center(child: Text('${snapshot.error}'));
    }
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return buildRedditShimmer();
        });
  });
}