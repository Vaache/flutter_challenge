import 'dart:math';

import 'package:m_one/core/preference_service/preference_service.dart';
import 'package:m_one/features/auth/domain/models/user.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  _AuthStore() {
    _init();
    _disposer = reaction<String?>((_) => token, (t) async {});
  }

  late final ReactionDisposer _disposer;
  final PreferencesService _storage = PreferencesService.instance;

  Future<void> dispose() async {
    _disposer();
  }

  Future<void> _init() async {}

  @observable
  bool isLoading = false;

  @observable
  String? token;

  @observable
  Map<String, dynamic>? user;

  @observable
  String? errorMessage;

  @computed
  bool get isAuthenticated => token != null && token!.isNotEmpty;

  @action
  Future<void> login(String username, String password) async {
    isLoading = true;
    errorMessage = null;

    final json = await _storage.getJson(username);
    if (json == null) {
      isLoading = false;
      errorMessage = 'User not found';
      return;
    }
    final currentUser = User.fromJson(json);
    if (currentUser.password != password) {
      isLoading = false;
      errorMessage = 'Invalid password';
      return;
    }
  }

  @action
  Future<void> register(String username, String email, String password) async {
    isLoading = true;
    errorMessage = null;

    final existingUser = await _storage.getJson(username);

    if (existingUser != null) {
      isLoading = false;
      errorMessage = 'Username already exists';
      return;
    }

    final currentUser =
        User(username: username, email: email, password: password);

    await _storage.setJson(currentUser.username, currentUser.toJson());
    isLoading = false;
    token = 'dummy_token_${Random().nextInt(10000)}';
  }
}
