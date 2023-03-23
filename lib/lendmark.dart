class landmark {
  String? name;
  String? category;
  String? city;
  String? state;
  int? id;
  bool? isFeatured;
  bool? isFavorite;
  String? park;
  Map? coordinates;
  String? description;
  String? imageName;

  landmark(
      {this.name,
      this.category,
      this.city,
      this.state,
      this.id,
      this.isFeatured,
      this.isFavorite,
      this.park,
      this.coordinates,
      this.description,
      this.imageName});

  landmark.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    city = json['city'];
    state = json['state'];
    id = json['id'];
    isFeatured = json['isFeatured'];
    isFavorite = json['isFavorite'];
    park = json['park'];
    coordinates = json['coordinates'];

    description = json['description'];
    imageName = json['imageName'];
  }

  @override
  String toString() {
    return 'landmark{name: $name, category: $category, city: $city, state: $state, id: $id, isFeatured: $isFeatured, isFavorite: $isFavorite, park: $park, coordinates: $coordinates, description: $description, imageName: $imageName}';
  }
}
