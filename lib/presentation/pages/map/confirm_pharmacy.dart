
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/core/routes/routes.dart';
import 'package:flutter_map/presentation/core/theme/style.dart';
import 'package:flutter_map/presentation/pages/map/strings/map_page_strings.dart';
import 'package:flutter_map/presentation/widgets/flatbutton.dart';
import 'package:flutter_map/presentation/widgets/thank_dialogue.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class ConfirmPharmacyPage extends StatefulWidget {
  final String name;
  final String address;
  final LatLng latLng;
  final String money;
  ConfirmPharmacyPage(
      {Key key, @required this.name, this.address, this.latLng, this.money})
      : super(key: key);
  @override
  _ConfirmPharmacyState createState() => _ConfirmPharmacyState();
}

class _ConfirmPharmacyState extends State<ConfirmPharmacyPage> {
  Completer<GoogleMapController> _mapController = Completer();
  bool visibilityContainer = true;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "dialog") {
        visibilityContainer = visibility;
      }
    });
  }

  _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  void back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          back();
        },
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                bearing: 270.0,
                target: widget.latLng,
                tilt: 30.0,
                zoom: 10.0,
              ),
              mapType: MapType.normal,
              markers: {
                Marker(
                    markerId: MarkerId(widget.name),
                    position: widget.latLng,
                    icon: BitmapDescriptor.defaultMarker)
              },
            ),
            Positioned(
              top: 35.0,
              left: 5.0,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: confirm_pharmacy_back_arrowColor),
                onPressed: () {
                  back();
                },
                iconSize: 30.0,
              ),
            ),
            visibilityContainer
                ? new Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * (70 / 100),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topLeft,
                      color: confirm_pharmacy_containerColor,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                new EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 0.0),
                            child: Text(
                              MapPageStrings.confirm_your,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: confirm_pharmacyText,
                            ),
                          ),
                          Padding(
                            padding:
                                new EdgeInsets.fromLTRB(23.0, 0.0, 10.0, 10.0),
                            child: Text(
                              MapPageStrings.pharmacy,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: pharmacyText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 10.0, 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  MapPageStrings.name,
                                  style: nameText,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.name,
                                    textAlign: TextAlign.left,
                                    style: nameValue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 10.0, 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  MapPageStrings.address,
                                  style: addressText,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.address,
                                    textAlign: TextAlign.left,
                                    style: addressValue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 10.0, 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  MapPageStrings.price,
                                  style: priceText,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.money + " taka",
                                    textAlign: TextAlign.left,
                                    style: priceValue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : new Container(),
            visibilityContainer
                ? new Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          BigFlatButton(
                            buttonText: MapPageStrings.this_pharmacy,
                            onPressed: () {
                              _changed(false, "dialog");

                              showDialog(
                                context: context,
                                builder :(_) => ThankDialogue(
                                    context: context,
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.map);
                                    }),
                              );
                            },
                          ),
                          FlatButton(
                            color: another_pharmacy_buttonColor,
                            textColor: another_pharmacy_textColor,
                            padding: EdgeInsets.all(12.0),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.map);
                            },
                            child: Text(
                              MapPageStrings.another_pharmacy,
                              style: another_pharmacyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : new Container(),
          ],
        )));
  }
}
