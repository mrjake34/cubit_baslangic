// {
//   "postId": 1,
//   "id": 1,
//   "name": "id labore ex et quam laborum",
//   "email": "Eliseo@gardner.biz",
//   "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
// },

import 'package:cubit_baslangic/product/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
final class CommentModel extends BaseModel<CommentModel> {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  CommentModel({this.postId, this.id, this.name, this.email, this.body});

  @override
  List<Object?> get props => [postId, id, name, email, body];

  @override
  CommentModel fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
