import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../error/failures.dart';

abstract class CreateUserRepository {
  Future<Either<String, Failure>> createUser(String userName, File image);
}
