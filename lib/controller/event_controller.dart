import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/models/event_response_model.dart';
import 'package:gold_crowne/service/event_service.dart';
import 'package:location/location.dart';
import 'dart:math' show cos, sqrt, asin;


class EventController extends GetxController with StateMixin<List<Data>> {

  List<Data> events = [];

  @override
  onInit() {
    getEvents();
    super.onInit();
  }

  getEvents() async{
    change(null, status: RxStatus.loading());
    await EventService().getEvents().then((value) {
      if (value.statusCode == 200) {
        events = EventResponseModel.fromJson(jsonDecode(value.bodyString!)).data!;
        getLocation();
      }else{
        change(null, status: RxStatus.error('No events found'));
      }
    });
  }

  getLocation() async{
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        change(events, status: RxStatus.success());
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        change(events, status: RxStatus.success());
        return;
      }
    }


    await location.getLocation().then((value) {
      var list = events.where((element) => isEventInRadius(double.parse(element.lat!), double.parse(element.long!), value.latitude!, value.longitude!,element.radius!)).toList();
      if(list.length > 0){
        change(list, status: RxStatus.success());
      }else{
        change(events, status: RxStatus.success());
        showSnackBar('No events found near you', 'Events');
      }
    });
  }

  bool isEventInRadius(double lat1,double lon1,double lat2,double lon2, double radius){
    return calculateDistance(lat1, lon1, lat2, lon2) < radius;
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

}
