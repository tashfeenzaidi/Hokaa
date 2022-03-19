import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:gold_crowne/models/event_response_model.dart';
import 'package:gold_crowne/service/event_service.dart';

class EventController extends GetxController with StateMixin<EventResponseModel> {
  @override
  onInit() {
    getEvents();
    super.onInit();
  }

  getEvents() {
    EventService().getEvents().then((value) {
      change(null, status: RxStatus.loading());
      if (value.statusCode == 200) {
        change(EventResponseModel.fromJson(jsonDecode(value.bodyString!)),
            status: RxStatus.success());
      }
    });
  }
}
