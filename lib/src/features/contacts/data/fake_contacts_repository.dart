import 'package:contacts/src/constants/test_contacts.dart';
import 'package:contacts/src/features/contacts/domain/contact.dart';

class FakeContactsRepository {
  FakeContactsRepository._();
  static FakeContactsRepository instance = FakeContactsRepository._();

  final List<Contact> _contacts = kTestContacts;

  List<Contact> getContactsList() {
    return _contacts;
  }

  Contact getContact(String id) {
    return _contacts.firstWhere((contact) => contact.id == id);
  }

  Future<List<Contact>> fetchContactsList() {
    return Future.value(_contacts);
  }

  Stream<List<Contact>> watchContactsList() {
    return Stream.value(_contacts);
  }

  Stream<Contact> watchContact(String id) {
    return watchContactsList()
        .map((contacts) => contacts.firstWhere((contact) => contact.id == id));
  }
}
