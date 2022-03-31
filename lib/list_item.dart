import 'package:flutter/material.dart';
import 'package:untitled/update_place.dart';
import 'model/tourism_place.dart';
import 'package:http/http.dart' as http;

class ListItem extends StatelessWidget {
  final Place place;
  final bool isDone;
  final Function(bool? value) onCheckboxClick;

  deleteData(int id) async {
    final uri = 'http://192.168.1.9:8000/api/place/delete/$id';
    var request = await http.get(Uri.parse(uri));
    print(request.statusCode);
    return request.statusCode;
  }

  const ListItem(
      {required this.place,
      required this.isDone,
      required this.onCheckboxClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDone ? Colors.white60 : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UpdatePlace(place: place);
                    }));
                  },
                  color: Colors.red,
                  iconSize: 20,
                ),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteData(place.id);
                    },
                    iconSize: 20),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.network(place.image!),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      place.name,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(place.location),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Checkbox(
                value: this.isDone,
                onChanged: this.onCheckboxClick,
              ))
        ],
      ),
    );
  }
}
