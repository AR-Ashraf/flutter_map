
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/presentation/pages/map/map_geolocator.dart';

class Routes {
  static const String map = '/map_geolocator';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.map:
        return MaterialPageRoute(builder: (_) => MapGeoLocatorPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
