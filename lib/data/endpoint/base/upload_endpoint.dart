import 'package:dio/dio.dart';
import 'package:shamsi_mobile_template/data/endpoint/base/endpoint.dart';

abstract class UploadEndpoint extends Endpoint {
  FormData data();
}
