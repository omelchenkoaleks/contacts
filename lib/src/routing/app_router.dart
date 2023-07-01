import 'package:go_router/go_router.dart';

import 'package:contacts/src/features/contacts/presentation/contact/contact_detail_screen.dart';
import 'package:contacts/src/features/contacts/presentation/contacts_list/contacts_list_screen.dart';

enum AppRoute {
  home,
  contact,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const ContactsListScreen(),
      routes: [
        GoRoute(
          path: 'contact/:id',
          name: AppRoute.contact.name,
          // builder: (context, state) => const ContactScreen(contactId: '1'),
          builder: (context, state) {
            final productId = state.params['id']!;
            return ContactDetailScreen(contactId: productId);
          },
        ),
      ],
    )
  ],
);
