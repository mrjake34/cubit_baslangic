part of 'home_cubit.dart';

enum Status { initial, loading, success, failure }

final class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    this.postDetailStatus = Status.initial,
    this.posts,
    this.comments,
    this.error,
  });

  final Status status;
  final Status postDetailStatus;
  final List<PostModel>? posts;
  final List<CommentModel>? comments;
  final String? error;

  @override
  List<Object?> get props => [status, postDetailStatus, posts, comments, error];

  HomeState copyWith({
    Status? status,
    Status? postDetailStatus,
    List<PostModel>? posts,
    List<CommentModel>? comments,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      postDetailStatus: postDetailStatus ?? this.postDetailStatus,
      posts: posts ?? this.posts,
      comments: comments ?? this.comments,
      error: error ?? this.error,
    );
  }
}
