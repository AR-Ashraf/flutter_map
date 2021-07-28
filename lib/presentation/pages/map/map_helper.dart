class GeoHelper{
  final Geo geo;

  GeoHelper(this.geo);
}

class Geo{
  final List<GeoCode> geocode;
  const Geo(this.geocode);
}
class GeoCode{
  final double x;
  final double y;
  final String name;
  final double money;
  final String address;
  final String time;

  const GeoCode( this.x, this.y, this.name, this.money, this.address, this.time);


}