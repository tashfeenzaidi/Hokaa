class ProductResponseModel {
  List<Data>? data;
  int? status;
  String? message;

  ProductResponseModel({this.data, this.status, this.message});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? image;
  String? barcode;
  String? price;
  int? quantity;
  int? status;
  String? createdAt;
  String? imageUrl;

  Data(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.barcode,
      this.price,
      this.quantity,
      this.status,
      this.createdAt,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    barcode = json['barcode'];
    price = json['price'];
    quantity = json['quantity'];
    status = json['status'];
    createdAt = json['created_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['barcode'] = this.barcode;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
