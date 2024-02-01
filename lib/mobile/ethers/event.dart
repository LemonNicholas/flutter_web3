part of ethers;

class Event {
  // const Event._(_EventImpl impl) : super._(impl);

  factory Event.fromJS(dynamic jsObject) => throw UnimplementedError();

  String get event => "";

  String get eventSignature => "";

  List<dynamic> get args => [];

  @override
  String toString() => 'Event: $event $eventSignature with args $args';
}
