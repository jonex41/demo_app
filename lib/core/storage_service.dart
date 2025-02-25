import 'package:demo_app/model/login/login_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static const _keyToken = 'token';
  static const _email = 'email';
  static const _phoneNumber = 'phone_number';
  static const _password = '_password';
  static const _keyUser = 'user';
  static const _firstName = 'first_name';
  static const _lastName = 'last_name';
  static const _keyUId = 'uid';
  static const _keyPin = 'pin';
  static const _keyWalletId = 'walletId';
  static const _keyShirtColor = 'shirtColor';
  static const _keyTeamName = 'teamName';
  static const _keyReferalCode = 'referalCode';
  static const _keyRemainingPicks = 'remainingPicks';
  static const _keyFreeSpinDialogShowTime = 'freeSpinDialogShowTime';
  static const _keyHasFreeSpin = 'hasFreeSpin';
  static const _keyCoins = 'coins';
  static const _keyNotificationFlag = 'notificationFlag';
  static const _keySoundFlag = 'soundFlag';
  static const _keyVibrationFlag = 'vibrationFlag';
  static const _keyHasLoginFlag = 'loginFlag';
  static const defaultCompany = 'default_company';
  static const serverProducts = 'server_products';
  static const serverServices = 'server_services';
  static const useFingerPrint = 'use_fingerprint';
  static const _keyContact = 'contact';
  static const _keyContactList = 'list_contact';
  static const _biometric = 'biometric';

  final GetStorage _box = GetStorage();
  final GetStorage mBox = GetStorage();

  static const moneyList = 'moneyList';

  Future<StorageService> init() async {
    return this;
  }

  void saveToken(String token) {
    _saveString(_keyToken, token);
  }

  String? getToken() {
    final token = _readString(_keyToken);
    if (token == null) return null;
    return 'Bearer $token';
  }

  //   storageService.saveFirstName(response.data!.user.first_name);
  // storageService.saveLastName(response.data!.user.last_name);

  void saveEmail(String email) {
    _saveString(_email, email);
  }

  String? getEmail() {
    final email = _readString(_email);
    if (email == null) return null;
    return email;
  }

  void saveFirstName(String? firstName) {
    _saveString(_firstName, firstName!);
  }

  String? getFirstName() {
    final firstName = _readString(_firstName);
    if (firstName == null) return null;
    return firstName;
  }

  void saveLastName(String? lastName) {
    _saveString(_lastName, lastName!);
  }

  String? getLastName() {
    final lastName = _readString(_lastName);
    if (lastName == null) return null;
    return lastName;
  }

  void savePhoneNumber(String phoneNumber) {
    _saveString(_phoneNumber, phoneNumber);
  }

  String? getPhoneNumber() {
    final phoneNumber = _readString(_phoneNumber);
    if (phoneNumber == null) return null;
    return phoneNumber;
  }

  void savePassword(String password) {
    _saveString(_password, password);
  }

  String? getPassword() {
    final password = _readString(_password);
    if (password == null) return null;
    return password;
  }

  void saveUId(String uId) {
    _saveString(_keyUId, uId);
  }

  String? getUId() {
    final uId = _readString(_keyUId);
    if (uId == null) return null;
    return uId;
  }

  void savePin(String pin) {
    _saveString(_keyPin, pin);
  }

  String? getPin() {
    final pin = _readString(_keyPin);
    if (pin == null) return null;
    return pin;
  }

  void saveContactList(List<Contact> objectList) {
    // Convert list of MyObject to list of JSON maps
    List<Map<String, dynamic>> jsonList =
        objectList.map((obj) => obj.toJson()).toList();

    // Store JSON list in GetStorage
    _box.write(_keyContactList, jsonList);
  }

  // Retrieve List of Objects
  List<Contact> getContactList() {
    List<dynamic> jsonList = _box.read(_keyContactList) ?? [];

    // Convert JSON list back to List<MyObject>
    return jsonList.map((json) => Contact.fromJson(json)).toList();
  }

  void saveReferalCode(String referalCode) {
    _saveString(_keyReferalCode, referalCode);
  }

  String? getReferralCode() {
    final pin = _readString(_keyReferalCode);
    if (pin == null) return null;
    return pin;
  }

  void saveWalletId(String walletId) {
    _saveString(_keyWalletId, walletId);
  }

  String? getWalletId() {
    final uId = _readString(_keyWalletId);
    if (uId == null) return null;
    return uId;
  }

  void saveHasLogin(bool token) {
    _saveBoolean(_keyHasLoginFlag, token);
  }

  bool? getHasLogin() {
    final token = _readBoolean(_keyHasLoginFlag);

    return token;
  }

  void saveBiometric(bool token) {
    _saveBoolean(_biometric, token);
  }

  bool getBiometric() {
    final token = _readBoolean2(_biometric);

    return token;
  }

/*   void saveUser(LoginResponse user) {
    final userJson = user.toJson();
    _saveJson(_keyUser, userJson);
  }

  LoginResponse? getUser() {
    final userJson = _readJson(_keyUser);
    return userJson == null ? null : LoginResponse.fromJson(userJson);
  }
 */
  void saveTeamName(String teamName) {
    _saveString(_keyTeamName, teamName);
  }

  String? getTeamName({String? defaultValue}) {
    final teamName = _readString(_keyTeamName);
    if (teamName == null) return defaultValue;
    return teamName;
  }

  void saveRemainingPicks(int remainingPicks) {
    _saveInt(_keyRemainingPicks, remainingPicks);
  }

  int? getRemainingPicks({int? defaultValue}) {
    final remainingPicks = _readInt(_keyRemainingPicks);
    if (remainingPicks == -1) return defaultValue;
    return remainingPicks;
  }

  void saveShirtColor(Color color) {
    _saveInt(_keyShirtColor, color.value);
  }

  Color? getShirtColor({Color? defaultValue}) {
    final color = _readInt(_keyShirtColor);
    if (color == -1) return defaultValue;
    return Color(color);
  }

  void saveFreeSpinDialogShowTime(DateTime date) {
    final millis = date.millisecondsSinceEpoch;
    _saveInt(_keyFreeSpinDialogShowTime, millis);
  }

  DateTime? getFreeSpinDialogShowTime() {
    final millis = _readInt(_keyFreeSpinDialogShowTime);
    if (millis == -1) return null;
    return DateTime.fromMillisecondsSinceEpoch(millis);
  }

  void saveUser(LoginResponse contact) {
    final contactJson = contact.toJson();
    _saveJson(_keyContact, contactJson);
  }

  LoginResponse? getUser() {
    final userJson = _readJson(_keyContact);
    return userJson == null ? null : LoginResponse.fromJson(userJson);
  }

  void saveHasFreeSpin(bool freeSpin) {
    _saveBoolean(_keyHasFreeSpin, freeSpin);
  }

  bool getHasFreeSpin() {
    final freeSpin = _readBoolean(_keyHasFreeSpin);
    return freeSpin;
  }

  void saveCoins(int coins) {
    _saveInt(_keyCoins, coins);
  }

  int getCoins() {
    final coins = _readInt(_keyCoins);
    return coins;
  }

  void saveNotificationFlag(bool flag) {
    _saveBoolean(_keyNotificationFlag, flag);
  }

  bool getNotificationFlag() {
    return _readBoolean(_keyNotificationFlag);
  }

  void saveSoundFlag(bool flag) {
    _saveBoolean(_keySoundFlag, flag);
  }

  bool getSoundFlag() {
    return _readBoolean(_keySoundFlag);
  }

  void saveGenFlag(String key, bool flag) {
    _saveBoolean(key, flag);
  }

  bool getGenFlag(String key) {
    //bool value= _box.read(key);
    return _box.read(key) ?? false;
  }

  void saveVibrationFlag(bool flag) {
    _saveBoolean(_keyVibrationFlag, flag);
  }

  bool getVibrationFlag() {
    return _readBoolean(_keyVibrationFlag);
  }

  Future<void> clearAllData() async {
    await _box.remove(_keyToken);
    await _box.remove(_email);
    // await _box.remove(_phoneNumber);
    await _box.remove(_keyUId);
    await _box.remove(_keyUser);
    await _box.remove(_keyShirtColor);
    await _box.remove(_keyTeamName);
    await _box.remove(_keyRemainingPicks);
    await _box.remove(_keyFreeSpinDialogShowTime);
    await _box.remove(_keyHasFreeSpin);
    await _box.remove(_keyCoins);
    await _box.remove(_keyNotificationFlag);
    await _box.remove(_keySoundFlag);
    await _box.remove(_keyHasLoginFlag);
    await mBox.remove(defaultCompany);
    await mBox.remove(serverProducts);
    await mBox.remove(_keyReferalCode);
    await mBox.remove(_keyContactList);
    //await _box.erase();
  }

  void _saveString(String key, String value) async {
    await _box.write(key, value);
  }

  String? _readString(String key) {
    final value = _box.read(key);
    return value is String ? value : null;
  }

  void _saveJson(String key, Map<String, dynamic> value) async {
    await _box.write(key, value);
  }

  Map<String, dynamic>? _readJson(String key) {
    final value = _box.read(key);
    return value is Map<String, dynamic> ? value : null;
  }

  void _saveBoolean(String key, bool value) async {
    await _box.write(key, value);
  }

  bool _readBoolean(String key) {
    final value = _box.read(key);
    return value is bool ? value : false;
  }

  bool _readBoolean2(String key) {
    final value = _box.read(key);
    return value is bool ? value : true;
  }

  void _saveInt(String key, int value) async {
    await _box.write(key, value);
  }

  int _readInt(String key) {
    final value = _box.read(key);
    return value is int ? value : -1;
  }
}
