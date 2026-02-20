import 'package:dio/dio.dart';
import 'package:{{name.snakeCase()}}/data/endpoint/base/endpoint.dart';

abstract class UploadEndpoint extends Endpoint {
  FormData data();
}
