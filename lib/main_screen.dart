import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/create_place.dart';
import 'package:untitled/done_tourism_list.dart';
import 'package:untitled/model/tourism_place.dart';
import 'package:untitled/provider/done_tourism_provider.dart';
import 'package:untitled/tourism_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Surabaya'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done_outline),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Consumer<DoneTourismProvider>(
                    builder: (context, DoneTourismProvider data, widget) {
                      return DoneTourismList(doneTourismPlaceList: data.doneTourismPlaceList);
                    },
                  );
                }),);
            },
          )
        ],
      ),
      body: TourismList(),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CreatePlace();
          }));
        },
      ),
    );
  }
}

