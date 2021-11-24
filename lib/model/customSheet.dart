// 악보 클래스
import 'customScale.dart';

class CustomSheet {
  int rowId;
  int id; // 삭제해야하나, 우선 둠.
  String title;
  List<CustomScale> scales;
  DateTime createdAt;

  CustomSheet({this.rowId, this.id, this.title, this.scales, this.createdAt});

  factory CustomSheet.fromJson(Map<String, dynamic> json) {
    return new CustomSheet(
        rowId: json['rowId'],
        id: json['id'],
        title: json['title'],
        // scales: null,
        createdAt: DateTime.parse(json['createdAt']));
  }
}
