class DataSeries {
  final List<DataItem> dataModel;

  DataSeries({required this.dataModel});

  factory DataSeries.fromJson(Map<String, dynamic> json) {
    var list = json['consolidated_weather'] as List;

    List<DataItem> dataList =
        list.map((dataModel) => DataItem.fromJson(dataModel)).toList();

    return DataSeries(dataModel: dataList);
  }
}

class DataItem {
  final String state;
  final String date;
  final double temp;

  DataItem({required this.state, required this.date, required this.temp});

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(state: json['weather_state_name'], date: json['applicable_date'], temp: json['the_temp']);
  }
}
