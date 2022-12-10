import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:test/model/details.dart';

class DetailsProvider extends ChangeNotifier {
  static const String _boxName = 'details';
  List<Details> _details = [];
  List<Details> get details => _details;

  void add(Details details) async {
    var box = await Hive.openBox<Details>(_boxName);
    await box.put(details.id, details);
    _details = box.values.toList();
    notifyListeners();
  }

  Details getDetail(index) {
    return _details[index];
  }
}
