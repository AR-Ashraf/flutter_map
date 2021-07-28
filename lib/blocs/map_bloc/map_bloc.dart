import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_map/presentation/pages/map/map_helper.dart';
import 'dart:ui' as ui;

import 'map_event.dart';
import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc()
      :
        super(MapState.initial());

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is MapOnLoadEvent) {
      yield* _mapOnLoadEventToState();
    } else if (event is MerkerSet) {
      yield* _markerAdded(text: event.money);
    }else if (event is MapSearchChanged) {
      yield* _mapSearchChanged(event.search);
    }
  }

  Stream<MapState> _mapOnLoadEventToState() async* {
    var geoCodes = await _loadJson();
    yield state.update(geocode: geoCodes);
  }

  Stream<MapState> _mapSearchChanged(String search) async* {
    yield state.update(isSearchValid: true);
  }

  Future<List<GeoCode>> _loadJson() async {
    var jsonData = await rootBundle.loadString('assets/geocode.json');

    Map decoded = jsonDecode(jsonData);
    List<GeoCode> geocode = new List<GeoCode>();
    for (var word in decoded["geo"]) {
      geocode.add(new GeoCode(word["x"], word["y"], word["name"], word["money"],
          word["address"], word["time"]));
    }

    return geocode;
  }

  Future<ui.Image> loadUiImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(list, completer.complete);
    return completer.future;
  }

  Future<Uint8List> getBytesFromCanvas(String text) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.red;
    final int size = 250; //change this according to your app
    canvas.drawImage(await loadUiImage("assets/images/marker.png"),
        Offset(size / 2, size / 2), paint1);
    //canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text, //you can write your own text here or take from parameter
      style: TextStyle(
          fontSize: size / 7, color: Colors.red, fontWeight: FontWeight.bold),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 6, size / 2 - painter.height),
    );

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }

  Stream<MapState> _markerAdded({String text}) async* {
    final Uint8List desiredMarker = await getBytesFromCanvas(text);
    yield state.update(customMarker: desiredMarker);
  }
}
