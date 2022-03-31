import 'package:flutter/foundation.dart';
import 'package:untitled/model/tourism_place.dart';

class DoneTourismProvider extends ChangeNotifier{
  final List<Place> _doneTourismPlaceList = [];

  List<Place> get doneTourismPlaceList => _doneTourismPlaceList;

  void complete(Place place, bool isDone){
    isDone
      ? _doneTourismPlaceList.add(place)
      : _doneTourismPlaceList.remove(place);
    notifyListeners();
  }
}