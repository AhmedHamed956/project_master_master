import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common/global.dart';

class GlobalRepository {
  Future<Locale> getLang() async {
    Locale _locale;
    langKey = await storage.read(key: "lang");
    if (langKey == null) {
      _locale = const Locale("en");
      await storage.write(key: "lang", value: "en");
    } else {
      _locale = Locale(langKey!);
    }
    if (kDebugMode) {
      print("lang ${_locale.languageCode}");
    }
    return _locale;
  }
}
