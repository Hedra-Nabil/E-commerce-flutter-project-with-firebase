import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _storage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final RxBool _isFirstTime = true.obs;
  final RxBool _isLoggedIn = false.obs;
  final Rx<User?> _firebaseUser = Rx<User?>(null);

  bool get isFirstTime => _isFirstTime.value;
  bool get isLoggedIn => _isLoggedIn.value;
  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _loadInitialState();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void _loadInitialState() {
    _isFirstTime.value = _storage.read('isFirstTime') ?? true;
    _isLoggedIn.value = _auth.currentUser != null;
  }

  void setFirstTimeDone() {
    _isFirstTime.value = false;
    _storage.write('isFirstTime', false);
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'fullName': fullName,
        'email': email,
        'profileImage': '',
      });

      _isLoggedIn.value = true;
      _storage.write('isLoggedIn', true);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _isLoggedIn.value = true;
      _storage.write('isLoggedIn', true);
      return true;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _isLoggedIn.value = false;
    _storage.write('isLoggedIn', false);
  }
}
