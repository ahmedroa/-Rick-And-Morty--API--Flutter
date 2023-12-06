class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Map<String, String> origin;
  late Map<String, String> location;
  late String image;
  late List<String> episode;
  late String url;
  late DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  // Factory method to parse JSON data and create Character object
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: Map<String, String>.from(json['origin']),
      location: Map<String, String>.from(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }
}
