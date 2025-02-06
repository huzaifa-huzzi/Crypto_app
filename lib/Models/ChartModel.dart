class ChartModel {
  final int timestamp;
  final double open;
  final double high;
  final double low;
  final double close;

  ChartModel({
    required this.timestamp,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory ChartModel.fromJson(List<dynamic> json) {
    return ChartModel(
      timestamp: json[0] as int,
      open: json[1] as double,
      high: json[2] as double,
      low: json[3] as double,
      close: json[4] as double,
    );
  }

  List<dynamic> toJson() {
    return [timestamp, open, high, low, close];
  }

  @override
  String toString() {
    return 'ChartModel(timestamp: $timestamp, open: $open, high: $high, low: $low, close: $close)';
  }
}
