import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CreatePlace extends StatefulWidget {
  @override
  State<CreatePlace> createState() => _CreatePlaceState();
}

class _CreatePlaceState extends State<CreatePlace> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController openDayController = TextEditingController();
  TextEditingController openHourController = TextEditingController();
  TextEditingController ticketPriceController = TextEditingController();

  File? imageFile;
  String? fileName;

  createPlace(String name, String location, String description, String openDay,
      String openHour, String ticketPrice, File image) async {
    final uri = 'http://192.168.1.9:8000/api/place/create';
    var request = http.MultipartRequest('POST', Uri.parse(uri));

    Map<String, String> headers = {'Content-type': 'multipart/form-data'};
    request.files.add(http.MultipartFile(
      'image',
      imageFile!.readAsBytes().asStream(),
      imageFile!.lengthSync(),
      filename: fileName,
    ));

    request.headers.addAll(headers);
    request.fields.addAll({
      'name': name,
      'location': location,
      'description': description,
      'open_day': openDay,
      'open_hours': openHour,
      'ticket_price': ticketPrice
    });

    var res = await request.send();
    print(res.statusCode);
    return res.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Wisata'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'name',
                  hintText: 'nama wisata'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'lokasi',
                  hintText: 'lokasi wisata'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'deskripsi',
                  hintText: 'deskripsi'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: openDayController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'hari buka',
                  hintText: 'hari buka'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: openHourController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'jam buka',
                  hintText: 'jam buka'),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              controller: ticketPriceController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'harga tiket',
                  hintText: 'harga tiket'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                var image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  imageFile = File(image!.path);
                  fileName = image.name;
                });
              },
              child: Text('Pilih Gambar'),
            ),
            Container(
              child: imageFile == null
                  ? Container(
                child: SizedBox(),
              )
                  : Container(
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {
          createPlace(
              nameController.text,
              locationController.text,
              descriptionController.text,
              openDayController.text,
              openHourController.text,
              ticketPriceController.text,
              imageFile!);
        },
      ),
    );
  }
}