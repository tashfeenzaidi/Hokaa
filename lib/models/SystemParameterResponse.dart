class SystemParameterResponse {
  int? status;
  String? message;
  Data? data;

  SystemParameterResponse({this.status, this.message, this.data});

  SystemParameterResponse.fromJson(Map<String, dynamic> json) {
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
  AppSetting? appSetting;
  List<OrderStatus>? orderStatus;

  Data({this.appSetting, this.orderStatus});

  Data.fromJson(Map<String, dynamic> json) {
    appSetting = json['app_setting'] != null
        ? new AppSetting.fromJson(json['app_setting'])
        : null;
    if (json['order_status'] != null) {
      orderStatus = <OrderStatus>[];
      json['order_status'].forEach((v) {
        orderStatus!.add(new OrderStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appSetting != null) {
      data['app_setting'] = this.appSetting!.toJson();
    }
    if (this.orderStatus != null) {
      data['order_status'] = this.orderStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppSetting {
  String? appName;
  String? currencySymbol;
  String? tax;

  AppSetting({this.appName, this.currencySymbol, this.tax});

  AppSetting.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    currencySymbol = json['currency_symbol'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['currency_symbol'] = this.currencySymbol;
    data['tax'] = this.tax;
    return data;
  }
}

class OrderStatus {
  int? id;
  String? value;

  OrderStatus({this.id, this.value});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}
