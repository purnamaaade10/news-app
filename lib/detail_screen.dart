import 'package:flutter/material.dart';
import 'package:untitled/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child : ListView(
          children: <Widget> [
            Image.network(place.image!),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Sansita",
                ),
              ),
            ),
            Container(
              margin : EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Column(
                    children: <Widget> [
                      Icon(Icons.calendar_today),
                      Text(place.open_day),
                    ],
                  ),
                  Column(children: <Widget>[
                    Icon(Icons.access_time),
                    Text(place.open_hours),
                  ]),
                  Column(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(place.ticket_price),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    var galery = place.galery[index];
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.network(galery.image),
                    );
                  },
                  itemCount: place.galery.length,
                )
            ),
          ],
        ),
      ),
    );
  }
}