import 'package:flutter/material.dart';

import 'package:contacts/src/features/contacts/presentation/contacts_list/contacts_list_screen.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const ContactsListScreen(),
        )),
        child: const Text('Go'),
      ),
    );
  }
}
