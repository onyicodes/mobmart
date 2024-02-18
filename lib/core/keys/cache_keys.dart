class CacheKeys {
  static String accessToken(String lastUserId) => 'authToken$lastUserId';
  static String refreshToken(String lastUserId) => 'refreshToken$lastUserId';
  static String loginMethod(String lastUserId) => 'loginMethod$lastUserId';
  static String userGoogleUID(String lastUserId) => 'userGoogleUID$lastUserId';
  static const lastUserID = 'lastUserID';
  static String useBiometricAuth(String lastUserId) =>
      'fingerPrintAuth$lastUserId';
  static String acceptedTerms = 'acceptedTerms';
  static String acceptedLocationService = 'acceptedLocationService';
  static String locationServiceDenyTime = 'locationServiceDenyTime';
  static String isLoggedIn(String lastUserId) => 'isLoggedIn$lastUserId';
  static String cacheProductDetails(int productId) => 'cacheProdduct$productId';
  static String cannotLoginAsAGuest = "cannotLoginAsAGuest";
  static String isGuest(String lastUserId) => 'isGuest$lastUserId';
  static String accountType(String lastUserId) => 'accountType$lastUserId';
  static String hasOnboardedSeller(String lastUserId) =>
      'onboardedSeller$lastUserId';
  static String hasOnboardedBuyer(String lastUserId) =>
      'onboardedBuyer$lastUserId';
  static String password(String lastUserId) => 'password$lastUserId';
  static String username(String lastUserId) => 'username$lastUserId';
  static String loginEmailOrPhone(String lastUserId) =>
      'emailOrPhone$lastUserId';
  static String userData(String lastUserId) => 'user$lastUserId';
  static String accountSetupCompleted(String lastUserId) =>
      'accountSetupCompleted$lastUserId';
  static String deepLinkData(String lastUserId) => 'deepLinkData$lastUserId';
  static String lastKnownLocation(String lastUserId) =>
      "lastKnownLocation$lastUserId";
  static String notifyAnyTime(String lastUserId) =>
      "notifyWithAnyTime$lastUserId";
  static String notifyWithSound(String lastUserId) =>
      "notifyWithSound$lastUserId";
  static String notifyWithVibration(String lastUserId) =>
      "notifyWithVibration$lastUserId";
  static String notifyOnSystemNotification(String lastUserId) =>
      "notifyOnSystem$lastUserId";
  static String notifyOnGeolocation(String lastUserId) =>
      "notifyOnGeolocation$lastUserId";
  static String notifyFrom(String lastUserId) => "notifyFrom$lastUserId";
  static String notifyTill(String lastUserId) => "notifyTill$lastUserId";

  static String hasOnboarded(String lastUserId) => 'onboarded$lastUserID';
}
