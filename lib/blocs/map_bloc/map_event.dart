import 'package:equatable/equatable.dart';

class MapEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class MapOnLoadEvent extends MapEvent {}

class FetchGeocode extends MapEvent{

}
class MapMarkerPressed extends MapEvent{

}
class MerkerSet extends MapEvent{
  final String money;

  MerkerSet({this.money});

  @override
  List<Object> get props => [money];
}

class MapSearchChanged extends MapEvent {
  final String search;

  MapSearchChanged({this.search});

  @override
  List<Object> get props => [search];
}

class MapWithSearchPressed extends MapEvent {
  final String search;

  MapWithSearchPressed({this.search});

  @override
  List<Object> get props => [search];
}

