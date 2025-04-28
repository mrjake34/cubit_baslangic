import 'package:cubit_baslangic/feature/home/domain/model/comment_model.dart';
import 'package:cubit_baslangic/feature/home/domain/model/post_model.dart';
import 'package:cubit_baslangic/product/base/model/base_response_model.dart';
import 'package:cubit_baslangic/product/base/service/i_service_manager.dart';

final class HomeRepository {
  const HomeRepository(IServiceManager serviceManager)
    : _serviceManager = serviceManager;

  final IServiceManager _serviceManager;

  Future<BaseResponseModel<List<PostModel>>> getPosts() async {
    final response = await _serviceManager.get('/posts');

    if (response.isSuccess) {
      final data = response.data;
      if (data is List<dynamic>) {
        final posts = data.map((e) => PostModel.fromJson(e)).toList();
        return BaseResponseModel<List<PostModel>>(
          data: posts,
          isSuccess: response.isSuccess,
          error: response.error,
          statusCode: response.statusCode,
        );
      }
      return BaseResponseModel<List<PostModel>>(
        data: [],
        isSuccess: false,
        error: 'Data is not a list',
        statusCode: response.statusCode,
      );
    }
    return BaseResponseModel<List<PostModel>>(
      data: [],
      isSuccess: false,
      error: response.error,
      statusCode: response.statusCode,
    );
  }

  Future<BaseResponseModel<List<CommentModel>>> getPostById(String id) async {
    final response = await _serviceManager.get('/posts/$id/comments');
    if (response.isSuccess) {
      final data = response.data;
      if (data is List<dynamic>) {
        final comments = data.map((e) => CommentModel.fromJson(e)).toList();
        return BaseResponseModel<List<CommentModel>>(
          data: comments,
          isSuccess: response.isSuccess,
          error: response.error,
          statusCode: response.statusCode,
        );
      }
      return BaseResponseModel<List<CommentModel>>(
        data: [],
        isSuccess: false,
        error: 'Data is not a list',
        statusCode: response.statusCode,
      );
    }
    return BaseResponseModel<List<CommentModel>>(
      data: [],
      isSuccess: false,
      error: response.error,
      statusCode: response.statusCode,
    );
  }
}
