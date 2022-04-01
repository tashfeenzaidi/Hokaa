import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';

class EventService extends GetConnect {
  String token = GetStorage().read('token');
  Future<Response<dynamic>> getEvents() async {
    return await get(baseUrl + 'event',
            headers: {'Authorization': token}, contentType: "application/x-www-form-urlencoded")
        .then((value) {
      print(value);
      return value;
    });
  }
}
