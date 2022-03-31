class PlaceResult {
  PlaceResult({required this.places});

  List<Place> places;

  factory PlaceResult.fromJson(Map<String, dynamic> json) => PlaceResult(
    places: List<Place>.from((json['data'] as List)
        .map((x) => Place.fromJson(x))
        .where((place) => place.image != null),
    )
  );
}

class Place {
  int id;
  String name;
  String location;
  String? image;
  String description;
  String open_day;
  String open_hours;
  String ticket_price;
  List<dynamic> galery ;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.description,
    required this.open_day,
    required this.open_hours,
    required this.ticket_price,
    required this.galery
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    id: json["id"],
    name: json["name"],
    location: json["location"],
    image: json["image"],
    description: json["description"],
    open_day: json["open_day"],
    open_hours: json["open_hours"],
    ticket_price: json["ticket_price"],
    galery: json["galery"],
  );

}