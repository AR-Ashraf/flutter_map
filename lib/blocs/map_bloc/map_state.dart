import 'dart:typed_data';

import 'package:flutter_map/presentation/pages/map/map_helper.dart';

class MapState {
  final bool isSearchValid;
  final bool isSuccess;
  final bool isFailure;
  final bool isSubmitting;
  final bool isPharmacyChosen;
  final Uint8List customMarker;
  final List<GeoCode> geocode;

  bool get isSearchable => isSearchable;

  MapState(
      {this.isSearchValid,
      this.isSuccess,
      this.isFailure,
      this.isSubmitting,
      this.isPharmacyChosen,
      this.customMarker,
      this.geocode});

  factory MapState.initial() {
    return MapState(
        isSearchValid: true,
        isSuccess: false,
        isFailure: false,
        isSubmitting: false,
        customMarker: null,
        geocode: List<GeoCode>());
  }

  factory MapState.loading() {
    return MapState(
      isSearchValid: true,
      isSuccess: false,
      isFailure: false,
      isSubmitting: true,
    );
  }
  factory MapState.failure() {
    return MapState(
      isSearchValid: true,
      isSuccess: false,
      isFailure: true,
      isSubmitting: false,
    );
  }
  factory MapState.success() {
    return MapState(
      isSearchValid: true,
      isSuccess: true,
      isFailure: false,
      isSubmitting: false,
    );
  }

  MapState update({
    List<GeoCode> geocode,
    bool isSearchValid,
    Uint8List customMarker,
  }) {
    return copyWith(
        isSearchValid: isSearchValid,
        isSuccess: true,
        isFailure: false,
        isSubmitting: false,
        customMarker: customMarker,
        geocode: geocode);
  }

  MapState copyWith({
    bool isSearchValid,
    bool isSuccess,
    bool isFailure,
    bool isSubmitting,
    Uint8List customMarker,
    List<GeoCode> geocode,
  }) {
    return MapState(
        isSearchValid: isSearchValid ?? this.isSearchValid,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        customMarker: customMarker ?? this.customMarker,
        geocode: geocode ?? this.geocode);
  }
}
