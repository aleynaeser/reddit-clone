part of 'reddit_bloc.dart';

abstract class RedditState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RedditInitial extends RedditState {}

class RedditLoading extends RedditState {}

class RedditLoaded extends RedditState {
  late Future<List<Reddit>> redditModel;

  RedditLoaded(this.redditModel);
}

class RedditError extends RedditState {
  final String? message;

  RedditError(this.message);
}
