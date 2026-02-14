import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static PreferencesService? _instance;
  static SharedPreferences? _preferences;

  PreferencesService._internal();

  static Future<PreferencesService> get instance async {
    _instance ??= PreferencesService._internal();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  final _authorizationPassed = "authorizationPassed";
  final _accessToken = "accessToken";
  final _refreshToken = "refreshToken";
  final _pin = "pin";
  final _pinPassed = "pinPassed";
  final _biometric = "biometric";
  final _laterOption = "later";
  final _userId = "userId";
  final _fullName = "fullname";
  final _fcmToken = "fcmToken";
  final _mobile = "mobile";
  final _isBiometricsEnabled = "_isBiometricsEnabled";
  final _sessionUid = "sessionUid";
  final _apartmentId = "apartmentId";
  final _apartmentName = "apartmentName";
  final _count = "count";
  final _apartmentIndex = "apartmentIndex";
  final _apartmentType = "_apartmentType";

  setAuthorizationPassed(bool value) async => await _preferences?.setBool(_authorizationPassed, value);
  setPin(String value) async => await _preferences?.setString(_pin, value);
  setAccessToken(String value) async => await _preferences?.setString(_accessToken, value);
  askPin(bool value) async => await _preferences?.setBool(_pinPassed, value);
  setBiometric(bool value) async => await _preferences?.setBool(_biometric, value);
  setOptionLater(bool value) async => await _preferences?.setBool(_laterOption, value);
  setRefreshToken(String value) async => await _preferences?.setString(_refreshToken, value);
  toggleBiometrics(bool value) async => await _preferences?.setBool(_isBiometricsEnabled, value);
  setFullName(String value) async => await _preferences?.setString(_fullName, value);
  setUserId(int value) async => await _preferences?.setInt(_userId, value);
  setFcmToken(String value) async => await _preferences?.setString(_fcmToken, value);
  setMobile(String value) async => await _preferences?.setString(_mobile, value);
  setSessionUid(String value) async => await _preferences?.setString(_sessionUid, value);
  setApartmentId(int value) async => await _preferences?.setInt(_apartmentId, value);
  setApartmentIndex(int value) async => await _preferences?.setInt(_apartmentIndex, value);
  setApartmentType(String value) async => await _preferences?.setString(_apartmentType, value);
  setApartmentName(String value) async => await _preferences?.setString(_apartmentName, value);
  setCount(int value) async => await _preferences?.setInt(_count, value);

  bool get wasAuthorizationPassed => _preferences?.getBool(_authorizationPassed) ?? false;
  String? get accessToken => _preferences?.getString(_accessToken);
  bool get isBiometric => _preferences?.getBool(_biometric) ?? false;
  bool get isOptionLaterSaved => _preferences?.getBool(_laterOption) ?? false;
  bool get hasPin => _preferences?.getString(_pin) != null;
  String? get fcmToken => _preferences?.getString(_fcmToken);
  bool get wasPinPassed => _preferences?.getBool(_pinPassed) ?? false;
  String? get refreshToken => _preferences?.getString(_refreshToken);
  int? get userId => _preferences?.getInt(_userId);
  int? get count => _preferences?.getInt(_count);
  String? get fullName => _preferences?.getString(_fullName);
  String? get sessionUid => _preferences?.getString(_sessionUid);
  String? get apartmentName => _preferences?.getString(_apartmentName);
  String? get mobile => _preferences?.getString(_mobile);
  int? get apartmentId => _preferences?.getInt(_apartmentId);
  int? get apartmentIndex => _preferences?.getInt(_apartmentIndex);
  String? get pin => _preferences?.getString(_pin);
  String? get apartmentType => _preferences?.getString(_apartmentType);
  bool get isBiometricsEnabled => _preferences?.getBool(_isBiometricsEnabled) ?? false;

  Future<bool?> clear() async => await _preferences?.clear();
  Future<bool?> clearPin() async => await _preferences?.remove(_pin);
}
