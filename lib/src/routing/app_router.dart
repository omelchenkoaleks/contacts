import 'package:go_router/go_router.dart';

import 'package:contacts/src/features/contacts/presentation/contact/contact_screen.dart';
import 'package:contacts/src/features/contacts/presentation/contacts_list/contacts_list_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ContactsListScreen(),
      routes: [
        GoRoute(
          path: 'contact',
          builder: (context, state) => const ContactScreen(contactId: '1'),
        ),
      ],
    )
  ],
);
