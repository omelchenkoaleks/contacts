import 'package:flutter/material.dart';

import 'package:contacts/src/constants/app_sizes.dart';
import 'package:contacts/src/features/contacts/domain/contact.dart';

class ContactsCard extends StatelessWidget {
  const ContactsCard({Key? key, required this.contact, this.onPressed})
      : super(key: key);

  final Contact contact;
  final VoidCallback? onPressed;

  static const productCardKey = Key('product-card');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        key: productCardKey,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Divider(),
              Text(contact.fullName,
                  style: Theme.of(context).textTheme.headline6),
              Text(contact.phone, style: Theme.of(context).textTheme.headline6),
              Text(contact.email, style: Theme.of(context).textTheme.headline6),
              Text(contact.contactPerson,
                  style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ),
      ),
    );
  }
}
