import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/contacts/contacts_impl.dart';
import 'package:chat_app/domain/contacts/models/contact_screen_models.dart';

class GetContactCubit extends Cubit<List<ContactScreenModel>> {
  GetContactCubit() : super([]);

  Future<void> getAllContacts() async =>
      emit(await ContactsImpl().getAllContacts());

  @override
  void onChange(Change<List<ContactScreenModel>> change) {
    super.onChange(change);
  }
}
