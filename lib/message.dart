

import 'package:get/get.dart';

class Messages extends Translations{



  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      TKeys.hello:"Hello",
    },
    'hi_IN':{
      TKeys.hello:"नमस्ते",
    },
    'fr_FR':{
      TKeys.hello:"bonjour",
    },
  };
}


class TKeys{
  static const String hello='hello';
  static const String hii='hii';
  static const String bye='bye';
}