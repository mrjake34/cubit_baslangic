import 'package:bloc/bloc.dart';
import 'package:cubit_baslangic/feature/home/domain/model/comment_model.dart';
import 'package:cubit_baslangic/feature/home/domain/model/post_model.dart';
import 'package:cubit_baslangic/feature/home/domain/repository/home_repository.dart';
import 'package:cubit_baslangic/product/core/utility/dependency/dependencies.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final HomeRepository _homeRepository = Dependencies.homeRepository;

  Future<void> getPosts() async {
    emit(state.copyWith(status: Status.loading));
    final response = await _homeRepository.getPosts();
    if (response.isSuccess) {
      final posts = response.data ?? [];
      emit(state.copyWith(status: Status.success, posts: posts));
    } else {
      final error = response.error ?? 'Unknown error';
      emit(state.copyWith(status: Status.failure, error: error));
    }
  }

  Future<void> getPostById(String id) async {
    emit(state.copyWith(postDetailStatus: Status.loading));
    final response = await _homeRepository.getPostById(id);
    if (response.isSuccess) {
      final comments = response.data ?? [];
      emit(
        state.copyWith(postDetailStatus: Status.success, comments: comments),
      );
    } else {
      final error = response.error ?? 'Unknown error';
      emit(state.copyWith(postDetailStatus: Status.failure, error: error));
    }
  }
}
