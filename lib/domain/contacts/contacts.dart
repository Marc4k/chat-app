import 'package:chat_app/domain/contacts/models/contact_screen_models.dart';

import '../../error/failures.dart';
import 'package:dartz/dartz.dart';

import 'models/contact_model.dart';

abstract class Contacts {
  Future<List<ContactModel>> searchInContacts(String serachTerm);

  Future<List<ContactScreenModel>> getAllContacts();

  Future<Either<String, Failure>> addContact(String userIdOfAddedUser);
}
