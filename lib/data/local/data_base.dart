import 'package:example/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class AppDataBase {
  static late final Store store;

  static initDataBase() async {
    store = await openStore();
  }

  putMany<T>(
    List<T> objects,
  ) {
    final box = store.box<T>();
    box.putMany(objects);
  }
}
