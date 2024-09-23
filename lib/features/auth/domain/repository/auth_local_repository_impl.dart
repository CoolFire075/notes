import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/features/auth/domain/repository/auth_local_repository.dart';

class AuthLocalRepositoryImpl implements AuthLocalRepository {
  User? _user;

  final _controller = StreamController<User?>.broadcast();

  @override
  Stream<User?> get userStream => _controller.stream;

  void addToStream(User? user) => _controller.sink.add(user);

  @override
  User? getUser() {
    return _user;
  }

  @override
  void saveUser(User user) {
    _user = user;
  }
}
