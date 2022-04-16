import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_clone/core/data/service/reddit_api.dart';
import 'package:reddit_clone/core/data/model/reddit.dart';

part 'reddit_event.dart';

part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  RedditBloc() : super(RedditInitial()) {
    on<GetRedditData>((event, emit) async {
      try {
        emit(RedditLoading());
        final data = RedditApi.fetchReddit();
        emit(RedditLoaded(data));
      } catch (error) {
        print(error.toString());
        RedditError('Unknown Error ${error.toString()}');
      }
    });
  }
}
