class Message {
  static String collectionName = 'messages';
  String id;
  String content;
  int dateTime;
  String categoryId;
  String senderName;
  String roomId;
  String senderId;

  Message(
      {this.id = '',
      required this.content,
      required this.dateTime,
      required this.categoryId,
      required this.roomId,
      required this.senderId,
      required this.senderName});

  Message.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          content: json['content'] as String,
          dateTime: json['dateTime'] as int,
          categoryId: json['categoryId'] as String,
          roomId: json['roomId'] as String,
          senderId: json['senderId'] as String,
          senderName: json['senderName'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'dateTime': dateTime,
      'categoryId': categoryId,
      'roomId': roomId,
      'senderId': senderId,
      'senderName': senderName,
    };
  }
}
