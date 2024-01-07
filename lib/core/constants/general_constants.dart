import 'package:easy_localization/easy_localization.dart';
import 'package:mobmart/generated/locale_keys.g.dart';

enum ListSpacingValue {
  spacingV100(100),
  spacingV80(80),
  spacingV54(54),
  spacingV48(48),
  spacingV32(32),
  spacingV24(24),
  spacingV16(16),
  spacingV12(12),
  spacingV8(8);

  const ListSpacingValue(this.value);
  final double value;
}

class LocaleKeysSettingsTexts {
  static String logoutSuccess = LocaleKeys.pages_settings_logoutSuccess.tr();
}

enum FirestoreCollections { banners }

enum EnumAccountProviders { google, credentials, apple, facebook }

enum RequestStatus { initial, loading, success, error }
