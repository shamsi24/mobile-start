class ResponseModel<T> {
  // A generic response model that can handle different types of responses (e.g., LoginModel, NotificationModel).
  T? response; // Holds the actual response data, which can be of any type.
  int? code; // HTTP status code or similar, used to identify the success or failure of the request.
  String? message; // A message that provides additional context or details about the response.

  ResponseModel({
    this.response,
    this.code,
    this.message,
  });

  // Factory constructor to create a ResponseModel from JSON data.
  factory ResponseModel.fromJson(dynamic json) {
    // A helper function to process and return the appropriate data for the generic type T.
    T? getData(dynamic data) {
      if (data == null) return null; // Return null if data is not available.

      // TODO: Object example
      // If T is a specific model like LoginModel, we can deserialize it here.
      // if (T == LoginModel) {
      //   return LoginModel.fromJson(data) as T?;
      // }

      // TODO: List example
      // If T is a List of models like NotificationModel, we can handle it as a list.
      // else if (T == List<NotificationModel>) {
      //   return List<NotificationModel>.from((data as List).map((x) => NotificationModel.fromJson(x))) as T?;
      // }

      // For all other types, return the raw data cast as type T.
      return data as T?;
    }

    // Determine if the JSON input is of certain types.
    final isList = json is List; // Check if the response is a list.
    final isMap = json is Map; // Check if the response is a map (common for object responses).
    final isString = json is String; // Check if the response is a string (could be an error or message).

    return ResponseModel(
      // If the response is not a list, map, or string, extract the code.
      code: isList || isMap || isString ? null : json["code"],
      // If the response is not a list, map, or string, extract the message.
      message: isList || isMap || isString ? null : json["message"],
      // Use getData to process the actual response data.
      response: getData(json),
    );
  }

  // A helper getter to check if the response contains data.
  bool get hasData {
    return response != null; // True if the response is not null, false otherwise.
  }

  // A helper getter to check if the response indicates an unauthorized request (HTTP 401).
  bool get isUnauthorized {
    return code == 401; // True if the status code is 401 (Unauthorized).
  }
}
