// 음계 클래스
class CustomScale {
  int rowId;
  int sheetId;
  String text;
  String imageUrl;
  DateTime createdAt;

  CustomScale(
      {this.rowId, this.sheetId, this.text, this.imageUrl, this.createdAt});

  factory CustomScale.fromJson(Map<String, dynamic> json) {
    return new CustomScale(
        rowId: json['rowId'],
        sheetId: json['sheetId'],
        text: json['text'],
        imageUrl: json['imageUrl'],
        createdAt: DateTime.parse(json['createdAt']));
  }
}
