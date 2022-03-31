import 'package:flutter/material.dart';
import 'package:untitled/model/tourism_place.dart';

class DoneTourismList extends StatelessWidget{
  final List<Place> doneTourismPlaceList;
  const DoneTourismList({Key? key, required this.doneTourismPlaceList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata telah dikunjungi'),
      ),
      body: ListView.builder(
          itemBuilder:(context, index){
            final Place place = doneTourismPlaceList[index];
            return Card(
              color: Colors.white60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Expanded(
                    flex: 1,
                    child: Image.network(place.image!),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 10),
                          Text(place.location),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: const Icon(Icons.done_outline),
                  ),
                ],
              ),
            );
          },
          itemCount: doneTourismPlaceList.length,
        ),
    );
  }
}