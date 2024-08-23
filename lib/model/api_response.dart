class ApiResponse {
  ApiResponse({
    this.message,
    this.status,
  });

  ApiResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
  }

  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    return map;
  }

  @override
  String toString() {
    return 'ApiResponse{message: $message, status: $status}';
  }
}
