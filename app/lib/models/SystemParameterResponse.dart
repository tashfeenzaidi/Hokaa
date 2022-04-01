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
  OrderStatus? orderStatus;

  Data({this.appSetting, this.orderStatus});

  Data.fromJson(Map<String, dynamic> json) {
    appSetting = json['app_setting'] != null ? new AppSetting.fromJson(json['app_setting']) : null;
    orderStatus =
        json['order_status'] != null ? new OrderStatus.fromJson(json['order_status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appSetting != null) {
      data['app_setting'] = this.appSetting!.toJson();
    }
    if (this.orderStatus != null) {
      data['order_status'] = this.orderStatus!.toJson();
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
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;

  OrderStatus({this.s1, this.s2, this.s3, this.s4, this.s5});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    return data;
  }
}
