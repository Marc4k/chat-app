import '../../error/failures.dart';
import 'package:dartz/dartz.dart';

import 'models/contact_model.dart';

abstract class Contacts {
  Future<List<ContactModel>> searchInContacts(String serachTerm);
}
