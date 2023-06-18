typedef ContactID = String;

class Contact {
  const Contact({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.contactPerson,
  });

  final ContactID id;
  final String fullName;
  final String phone;
  final String email;
  final String contactPerson;
}
