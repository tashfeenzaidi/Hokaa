import 'package:get/get_connect.dart';
import 'package:gold_crowne/constant/constants.dart';

class EventService extends GetConnect {
  Future<Response<dynamic>> getEvents() {
    return get(baseUrl + 'event');
  }
}
