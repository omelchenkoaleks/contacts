import 'package:contacts/src/constants/test_contacts.dart';
import 'package:contacts/src/features/contacts/domain/contact.dart';

class FakeContactsRepository {
  FakeContactsRepository._();
  static FakeContactsRepository instance = FakeContactsRepository._();

  List<Contact> getContactsList() {
    return kTestContacts;
  }

  Contact getContact(String id) {
    return kTestContacts.firstWhere((contact) => contact.id == id);
  }
}
