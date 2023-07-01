import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final contactsRepositoryProvider = Provider<FakeContactsRepository>((ref) {
  return FakeContactsRepository.instance;
});

final contactsListStreamProvider =
    StreamProvider.autoDispose<List<Contact>>((ref) {
  final contactsRepository = ref.watch(contactsRepositoryProvider);
  return contactsRepository.watchContactsList();
});

final contactsListFutureProvider =
    FutureProvider.autoDispose<List<Contact>>((ref) {
  final contactsRepository = ref.watch(contactsRepositoryProvider);
  return contactsRepository.fetchContactsList();
});

final contactProvider =
    StreamProvider.autoDispose.family<Contact, String>((ref, id) {
  final contactsRepository = ref.watch(contactsRepositoryProvider);
  return contactsRepository.watchContact(id);
});
