import 'package:localstorage/localstorage.dart';

class Storage {
  static final LocalStorage storage = LocalStorage('storage.json');

  static get(String key) {
    return storage.getItem(key);
  }

  static set(String key, dynamic value) {
    storage.setItem(key, value);
  }
}