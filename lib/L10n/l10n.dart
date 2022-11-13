import 'dart:ui';

class L10n{
  static final all = [
    const Locale('en'),
    const Locale('es'),
    const Locale('fr'),
    const Locale('de'),
    const Locale('it'),
    const Locale('pt'),
    const Locale('tr'),
  ];

  static String getLanguage(String code){
    switch (code){
      case 'de':
        return "German";
      case 'es':
        return "Spanish";
      case 'fr':
        return "French";
      case 'it':
        return "Italian";
      case 'pt':
        return "Portuguese";
      case 'tr':
        return "Turkish";
      default :
        return "English";

    }
  }

}