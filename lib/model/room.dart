class Room {
  static String collectionName = 'rooms';
  String id;
  String title;
  String description;
  String categoryId;

  Room(
      {required this.id,
      required this.title,
      required this.description,
      required this.categoryId});

  Room.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          categoryId: json['categoryId'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'categoryId': categoryId,
    };
  }
}
