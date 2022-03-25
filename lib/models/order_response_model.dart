class OrderResponseModel {
  int? status;
  String? message;
  Data? data;

  OrderResponseModel({this.status, this.message, this.data});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  int? createdBy;
  int? statusId;
  String? subTotal;
  String? tax;
  String? totalPrice;
  String? createdAt;
  String? updatedAt;
  int? eventId;
  String? status;
  List<Items>? items;
  Event? event;
  String? paymentMethod;

  Data(
      {this.id,
      this.customerId,
      this.createdBy,
      this.statusId,
      this.subTotal,
      this.tax,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.eventId,
      this.status,
      this.items,
      this.paymentMethod,
      this.event});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    createdBy = json['created_by'];
    statusId = json['status_id'];
    subTotal = json['sub_total'];
    tax = json['tax'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    eventId = json['event_id'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['created_by'] = this.createdBy;
    data['status_id'] = this.statusId;
    data['sub_total'] = this.subTotal;
    data['tax'] = this.tax;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['event_id'] = this.eventId;
    data['status'] = this.status;
    data['payment_method'] = this.paymentMethod;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.event != null) {
      data['event'] = this.event!.toJson();
    }
    return data;
  }
}

class Items {
  int? id;
  String? itemPrice;
  String? totalItemPrice;
  int? quantity;
  int? productId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? image;

  Items(
      {this.id,
      this.itemPrice,
      this.totalItemPrice,
      this.quantity,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.image});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemPrice = json['item_price'];
    totalItemPrice = json['total_item_price'];
    quantity = json['quantity'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_price'] = this.itemPrice;
    data['total_item_price'] = this.totalItemPrice;
    data['quantity'] = this.quantity;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Event {
  int? id;
  String? name;
  String? image;

  Event({this.id, this.name, this.image});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
