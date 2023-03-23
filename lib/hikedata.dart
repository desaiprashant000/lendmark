class hikedata {
  String? name;
  int? id;
  double? distance;
  int? difficulty;
  List<Observations>? observations;

  hikedata(
      {this.name, this.id, this.distance, this.difficulty, this.observations});

  hikedata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    distance = json['distance'];
    difficulty = json['difficulty'];
    if (json['observations'] != null) {
      observations = <Observations>[];
      json['observations'].forEach((v) {
        observations!.add(new Observations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['distance'] = this.distance;
    data['difficulty'] = this.difficulty;
    if (this.observations != null) {
      data['observations'] = this.observations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Observations {
  List<double>? elevation;
  List<double>? pace;
  List<double>? heartRate;
  double? distanceFromStart;

  Observations(
      {this.elevation, this.pace, this.heartRate, this.distanceFromStart});

  Observations.fromJson(Map<String, dynamic> json) {
    elevation = json['elevation'].cast<double>();
    pace = json['pace'].cast<double>();
    heartRate = json['heartRate'].cast<double>();
    distanceFromStart = json['distanceFromStart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elevation'] = this.elevation;
    data['pace'] = this.pace;
    data['heartRate'] = this.heartRate;
    data['distanceFromStart'] = this.distanceFromStart;
    return data;
  }
}
