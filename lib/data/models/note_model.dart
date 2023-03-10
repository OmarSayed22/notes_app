import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final DateTime date;
  @HiveField(4)
  final int color;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}
