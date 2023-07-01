import 'dart:math';

import 'package:flutter/material.dart';

import 'package:contacts/src/routing/app_router.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

import 'package:contacts/src/features/contacts/data/fake_contacts_repository.dart';
import 'package:contacts/src/features/contacts/presentation/contacts_list/contacts_card.dart';
import 'package:contacts/src/constants/app_sizes.dart';
import 'package:contacts/src/localiation/string_hardcoded.dart';

class ContactsGrid extends StatelessWidget {
  const ContactsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = FakeContactsRepository.instance.getContactsList();

    return contacts.isEmpty
        ? Center(
            child: Text(
              'No contacts found'.hardcoded,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          )
        : ContactsLayoutGrid(
            itemCount: contacts.length,
            itemBuilder: (_, index) {
              final contact = contacts[index];
              return ContactsCard(
                contact: contact,
                onPressed: () => context.goNamed(
                  AppRoute.contact.name,
                  params: {'id': contact.id},
                ),
                // onPressed: () => GoRouter.of(context).go('/contact'),
                // onPressed: () => Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) => ContactScreen(contactId: contact.id),
                //   ),
                // ),
              );
            },
          );
  }
}

class ContactsLayoutGrid extends StatelessWidget {
  const ContactsLayoutGrid({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  final int itemCount;

  // Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = max(1, width ~/ 250);
        final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
        final numRows = (itemCount / crossAxisCount).ceil();
        final rowSizes = List.generate(numRows, (_) => auto);
        return LayoutGrid(
          columnSizes: columnSizes,
          rowSizes: rowSizes,
          rowGap: Sizes.p24, // equivalent to mainAxisSpacing
          columnGap: Sizes.p24, // equivalent to crossAxisSpacing
          children: [
            // render all the items with automatic child placement
            for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
          ],
        );
      },
    );
  }
}
