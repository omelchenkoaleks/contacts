import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:contacts/src/common_widgets/responsive_two_column_layout.dart';
import 'package:contacts/src/common_widgets/async_value_widget.dart';
import 'package:contacts/src/common_widgets/empty_placeholder_widget.dart';
import 'package:contacts/src/common_widgets/responsive_center.dart';
import 'package:contacts/src/constants/app_sizes.dart';
import 'package:contacts/src/features/contacts/data/fake_contacts_repository.dart';
import 'package:contacts/src/features/contacts/domain/contact.dart';
import 'package:contacts/src/localiation/string_hardcoded.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({super.key, required this.contactId});
  final String contactId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'.hardcoded),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final contactValue = ref.watch(contactProvider(contactId));
          return AsyncValueWidget(
            value: contactValue,
            data: (contact) => contact == null
                ? EmptyPlaceholderWidget(
                    message: 'Contact not found'.hardcoded,
                  )
                : CustomScrollView(
                    slivers: [
                      ResponsiveSliverCenter(
                        padding: const EdgeInsets.all(Sizes.p16),
                        child: ContactDetail(contact: contact),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class ContactDetail extends StatelessWidget {
  const ContactDetail({super.key, required this.contact});
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ResponsiveTwoColumnLayout(
      spacing: Sizes.p16,
      endContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(contact.fullName,
                  style: Theme.of(context).textTheme.headline6),
              gapH8,
              Text(contact.phone, style: Theme.of(context).textTheme.headline6),
              // Only show average if there is at least one rating
              gapH8,
              Text(contact.email, style: Theme.of(context).textTheme.headline6),
              const Divider(),
              gapH8,
              Text(contact.contactPerson,
                  style: Theme.of(context).textTheme.headline6),
              const Divider(),
              gapH8,
            ],
          ),
        ),
      ),
    );
  }
}
