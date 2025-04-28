import 'package:equatable/equatable.dart';

final class BaseResponseModel<T> extends Equatable {
  const BaseResponseModel({
    this.data,
    this.error,
    this.isSuccess = false,
    this.statusCode,
  });

  final T? data;
  final String? error;
  final bool isSuccess;
  final int? statusCode;

  @override
  List<Object?> get props => [data, error, isSuccess, statusCode];
}
