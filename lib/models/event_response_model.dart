class EventResponseModel {
  List<Data>? data;
  int? status;
  String? message;

  EventResponseModel({this.data, this.status, this.message});

  EventResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? lat;
  String? long;
  String? from;
  String? to;
  String? imageUrl;
  String? status;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  double? radius;

  Data(
      {this.id,
      this.name,
      this.lat,
      this.long,
      this.from,
      this.to,
      this.imageUrl,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.radius});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    from = json['from'];
    to = json['to'];
    imageUrl = json['image_url'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    radius = double.parse(json['radius'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['from'] = this.from;
    data['to'] = this.to;
    data['image_url'] = this.imageUrl;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['radius'] = this.radius;
    return data;
  }
}
