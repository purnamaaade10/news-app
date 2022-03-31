import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/api/api_service.dart';
import 'package:untitled/detail_screen.dart';
import 'package:untitled/list_item.dart';
import 'package:untitled/model/tourism_place.dart';
import 'package:untitled/provider/done_tourism_provider.dart';

class TourismList extends StatefulWidget {
  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList> {
  late Future<PlaceResult> _place;

  @override
  void initState() {
    super.initState();
    _place = ApiService().findAll();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _place,
        builder: (context, AsyncSnapshot<PlaceResult> snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var place = snapshot.data?.places[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(place: place!);
                      }));
                    },
                    child: Consumer<DoneTourismProvider>(
                        builder: (context, DoneTourismProvider data, widget) {
                      return ListItem(
                        place: place!,
                        isDone: data.doneTourismPlaceList.contains(place),
                        onCheckboxClick: (bool? value) {
                          data.complete(place, value!);
                        },
                      );
                    }),
                  );
                },
                itemCount: snapshot.data?.places.length,
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Text("error");
            }
          }
        });
  }
}
