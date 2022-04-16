part of 'reddit_bloc.dart';

abstract class RedditEvent extends Equatable {
  const RedditEvent();

  @override
  List<Object> get props => [];
}

class GetRedditData extends RedditEvent {}