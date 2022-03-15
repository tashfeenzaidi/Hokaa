class UserResponseModel {
  int? status;
  String? message;
  Data? data;

  UserResponseModel({this.status, this.message, this.data});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phoneNo;
  Null? emailVerifiedAt;
  String? profileImageUrl;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phoneNo,
      this.emailVerifiedAt,
      this.profileImageUrl,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    emailVerifiedAt = json['email_verified_at'];
    profileImageUrl = json['profile_image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_image_url'] = this.profileImageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
