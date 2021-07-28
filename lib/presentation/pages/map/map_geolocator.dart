
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/blocs/map_bloc/map_bloc.dart';
import 'package:flutter_map/blocs/map_bloc/map_event.dart';
import 'package:flutter_map/blocs/map_bloc/map_state.dart';
import 'package:flutter_map/presentation/core/theme/style.dart';
import 'package:flutter_map/presentation/pages/map/strings/map_page_strings.dart';
import 'package:flutter_map/presentation/widgets/snackbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'confirm_pharmacy.dart';
import 'map_helper.dart';

class MapGeoLocatorPage extends StatefulWidget {
  @override
  _MyGeoLocatorPageState createState() => _MyGeoLocatorPageState();
}

class _MyGeoLocatorPageState extends State<MapGeoLocatorPage> {
  Completer<GoogleMapController> _mapController = Completer();
  static LatLng _initialPosition;
  Set<Marker> myMarkers = {};
  final TextEditingController _searchController = TextEditingController();
  MapBloc _mapBloc;

  bool get isPopulated => _searchController.text.isNotEmpty;

  bool isSearchEnabled(MapState state) {
    return isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    // _getUserLocation();
    _mapBloc = BlocProvider.of<MapBloc>(context);
    _mapBloc.add(MapOnLoadEvent());
  }

  /*void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    /* setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });*/
  } */

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

  _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  Future<void> _addMarker(String markerId, LatLng latLongi, String title,
      String money, String address, String time) async {
    final Uint8List desiredMarker = await getBytesFromCanvas(money);

    setState(() {
      myMarkers.add(
        Marker(
            markerId: MarkerId(markerId),
            position: latLongi,
            infoWindow: InfoWindow(
              title: title,
            ),
            icon: BitmapDescriptor.fromBytes(desiredMarker),
            onTap: () {
              _showBottomSheet(context, title, money, address, time, latLongi);
            }),
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void back() {
    Navigator.pop(context);
  }

  void confirmPage(BuildContext context, String name, String address,
      LatLng latLongi, String money) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPharmacyPage(
            name: name,
            address: address,
            latLng: latLongi,
            money: money,
          ),
        ));
  }

  _showBottomSheet(context, String name, String money, String address,
      String time, LatLng latLongi) {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        backgroundColor: bottom_sheet_bgColor,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            decoration: BoxDecoration(color: bottom_sheet_bgColor),
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                  width: 1.0,
                ),
                Padding(
                  padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 3.0),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: bottom_sheet_nameText,
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        MapPageStrings.address,
                        style: bottom_sheet_addressText,
                      ),
                      Text(
                        address,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: bottom_sheet_addressValue,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        MapPageStrings.open,
                        style: bottom_sheet_openText,
                      ),
                      Text(
                        time,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: bottom_sheet_openValue,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        MapPageStrings.rate,
                        style: bottom_sheet_rateText,
                      ),
                      Text(
                        money + " taka",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: bottom_sheet_rateValue,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                FlatButton(
                  color: select_pharmacy_buttonColor,
                  textColor: select_pharmacy_button_textColor,
                  padding: EdgeInsets.all(12.0),
                  onPressed: () {
                    confirmPage(context, name, address, latLongi, money);
                  },
                  child: Text(
                    MapPageStrings.select_pharmacy_btn,
                    style: select_pharmacy_buttonText,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildChild(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
      listener: (context, state) {},
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state.geocode.length > 0) {
            List<GeoCode> geoCodeList = state.geocode;
            for (int i = 0; i < geoCodeList.length; i++) {
              GeoCode geoCode = geoCodeList[i];
              GeoCode geocodeTarget = geoCodeList[0];
              var latLongi = LatLng(geoCode.x, geoCode.y);
              _initialPosition = LatLng(geocodeTarget.x, geocodeTarget.y);
              _addMarker(geoCode.name, latLongi, geoCode.name,
                  geoCode.money.toString(), geoCode.address, geoCode.time);
            }
            return GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                bearing: 270,
                target: _initialPosition,
                tilt: 30.0,
                zoom: 10.0,
              ),
              markers: myMarkers,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          back();
        },
        child: Scaffold(
          body: BlocListener<MapBloc, MapState>(
            listener: (context, state) {
              if (state.isFailure) {
                Scaffold.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    CustomSnackBar(
                        snackBarMessage: MapPageStrings.mapError,
                        icon: Icons.error),
                  );
              }

              if (state.isSubmitting) {
                Scaffold.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    CustomSnackBar(
                        snackBarMessage: MapPageStrings.searchProgress,
                        icon: Icons.refresh),
                  );
              }

              if (state.isSuccess) {
                Scaffold.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    CustomSnackBar(
                        snackBarMessage: MapPageStrings.searchSuccess,
                        icon: Icons.check),
                  );
              }
            },
            child: BlocBuilder<MapBloc, MapState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: _buildChild(context),
                      ),
                      Positioned(
                        top: 35.0,
                        left: 5.0,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: map_page_back_arrowColor),
                          onPressed: () {
                            back();
                          },
                          iconSize: 30.0,
                        ),
                      ),
                      Positioned(
                        top: 30.0,
                        right: 40.0,
                        left: 50.0,
                        child: Container(
                          height: 55.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: map_page_search_bgColor),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                hintText: MapPageStrings.searchHint,
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {
                                      _onSearchChanged();
                                      if (isSearchEnabled(state)) {
                                        _onSearchSubmitted();
                                      }
                                    },
                                    iconSize: 30.0)),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }

  void _onSearchChanged() {
    _mapBloc.add(MapSearchChanged(search: _searchController.text));
  }

  void _onSearchSubmitted() {
    _mapBloc.add(MapWithSearchPressed(search: _searchController.text));
  }
}
