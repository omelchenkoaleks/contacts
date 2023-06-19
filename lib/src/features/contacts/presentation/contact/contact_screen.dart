import 'package:flutter/material.dart';

import 'package:contacts/src/features/contacts/presentation/app_bar/home_app_bar.dart';
import 'package:contacts/src/common_widgets/responsive_center.dart';
import 'package:contacts/src/common_widgets/responsive_two_column_layout.dart';
import 'package:contacts/src/constants/app_sizes.dart';
import 'package:contacts/src/features/contacts/domain/contact.dart';
import 'package:contacts/src/localiation/string_hardcoded.dart';
import 'package:contacts/src/common_widgets/empty_placeholder_widget.dart';
import 'package:contacts/src/constants/test_contacts.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key, required this.contactId});
  final String contactId;

  @override
  Widget build(BuildContext context) {
    final contact =
        kTestContacts.firstWhere((contact) => contact.id == contactId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Information'.hardcoded),
      ),
      body: contact == null
          ? EmptyPlaceholderWidget(
              message: 'Contact not found'.hardcoded,
            )
          : CustomScrollView(
              slivers: [
                ResponsiveSliverCenter(
                  padding: const EdgeInsets.all(Sizes.p16),
                  child: ContactDetails(contact: contact),
                ),
              ],
            ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key, required this.contact});
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ResponsiveTwoColumnLayout(
      // startContent: Card(
      //   child: Padding(
      //     padding: const EdgeInsets.all(Sizes.p16),
      //     child: CustomImage(imageUrl: contact.imageUrl),
      //   ),
      // ),
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
              Text(contact.email, style: Theme.of(context).textTheme.headline6),
              Text(contact.contactPerson,
                  style: Theme.of(context).textTheme.headline5),
            ],
          ),
        ),
      ),
    );
  }
}
