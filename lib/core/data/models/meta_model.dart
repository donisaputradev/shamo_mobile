class Meta {
  Meta({
    this.code,
    this.message,
    this.status,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    code = json['page'];
    status = json['perPage'];
    message = json['message'];
  }

  int? code;
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'message': message,
    };
  }
}
