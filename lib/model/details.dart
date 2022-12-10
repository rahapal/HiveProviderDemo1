import 'package:hive/hive.dart';

part 'details.g.dart';

@HiveType(typeId: 0)
class Details {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  Details({required this.id, required this.name});
}
