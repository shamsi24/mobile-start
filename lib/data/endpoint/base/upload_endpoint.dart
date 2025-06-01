import 'package:dio/dio.dart';
import 'package:rht_mobile_template/data/endpoint/base/endpoint.dart';

abstract class UploadEndpoint extends Endpoint {
  FormData data();
}
