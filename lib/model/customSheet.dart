// 악보 클래스
import 'customScale.dart';

class CustomSheet {
  int id;
  String title;
  List<CustomScale> scales;
  DateTime createdAt;

  CustomSheet({this.id, this.title, this.scales, this.createdAt});

  factory CustomSheet.fromJson(Map<String, dynamic> json) {
    return new CustomSheet(
        id: json['id'],
        title: json['title'],
        // scales: null,
        createdAt: DateTime.parse(json['createdAt']));
  }
}
