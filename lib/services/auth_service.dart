import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalUser {
  final String uid;
  final String email;
  final String? displayName;

  LocalUser({required this.uid, required this.email, this.displayName});

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'displayName': displayName,
  };

  factory LocalUser.fromJson(Map<String, dynamic> json) => LocalUser(
    uid: json['uid'],
    email: json['email'],
    displayName: json['displayName'],
  );
}

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal() {
    _loadUser();
  }

  final _authStateController = StreamController<LocalUser?>.broadcast();
  LocalUser? _currentUser;
  final _initCompleter = Completer<void>();
  Future<void> get initialized => _initCompleter.future;

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString('current_user');
    if (userStr != null) {
      try {
        _currentUser = LocalUser.fromJson(json.decode(userStr));
      } catch (e) {
        print('Error decoding user: $e');
        _currentUser = null;
      }
    } else {
      _currentUser = null;
    }
    _authStateController.add(_currentUser);
    if (!_initCompleter.isCompleted) _initCompleter.complete();
  }

  // Sign up with email and password
  Future<LocalUser?> signUpWithEmailAndPassword(String email, String password) async {
    // In a real local-only app, we would store (email, hash(password)) to check later.
    // For simplicity, we just "sign up" by creating the session.
    final uid = DateTime.now().millisecondsSinceEpoch.toString();
    final user = LocalUser(uid: uid, email: email);
    await _saveUser(user);
    return user;
  }

  // Sign in with email and password
  Future<LocalUser?> signInWithEmailAndPassword(String email, String password) async {
    // Fake login: check if we have a user (we'll just assume any valid-looking email works for this simple project)
    // In a slightly more advanced version, we'd check against a list of stored users.
    if (email.isNotEmpty && password.length >= 6) {
      final uid = email.split('@')[0];
      final user = LocalUser(uid: uid, email: email);
      await _saveUser(user);
      return user;
    }
    return null;
  }

  Future<void> _saveUser(LocalUser user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('current_user', json.encode(user.toJson()));
    _currentUser = user;
    _authStateController.add(_currentUser);
  }

  // Sign out
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user');
    _currentUser = null;
    _authStateController.add(null);
  }

  // Get current user
  LocalUser? get currentUser => _currentUser;

  // Auth state changes stream
  Stream<LocalUser?> get authStateChanges => _authStateController.stream;
}
