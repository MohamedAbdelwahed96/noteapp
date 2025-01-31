class NoteModel {
  String headline;
  String description;
  DateTime time;
  String image;

  // Constructor
  NoteModel({
    required this.headline,
    required this.description,
    required this.time,
    required this.image
  });

  // Convert a Map to a NoteModel object
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      headline: map['headline'] ?? '',
      description: map['description'] ?? '',
      time: DateTime.parse(map['time']),
      image: map['image'] ?? '',
    );
  }

  // Convert a NoteModel object to a Map
  Map<String, dynamic> toMap() {
    return {
      'headline': headline,
      'description': description,
      'time': time.toIso8601String(),  // You can customize the format here if needed
      'image': image.toString()
    };
  }
}
