class TimeModel{

  TimeModel({
    this.location,
    this.time,
    this.isDay,
  });
  String location;
   String time;
   bool isDay;



  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
    location: json['location'],
    time: json["time"],
    isDay:json['isDay'],
  );

  Map<String, dynamic> toJson() => {
    "location": location,
    "time": time,
    "isDay":isDay,
  };


}