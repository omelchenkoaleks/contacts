import 'package:contacts/src/features/contacts/data/fake_contacts_repository.dart';
import 'package:flutter/material.dart';

import 'package:contacts/src/constants/test_contacts.dart';
import 'package:contacts/src/common_widgets/primary_button.dart';
import 'package:contacts/src/common_widgets/responsive_scrollable_card.dart';
import 'package:contacts/src/constants/app_sizes.dart';
import 'package:contacts/src/localiation/string_hardcoded.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, required this.contactId, this.onSubmit});
  final String contactId;

  final VoidCallback? onSubmit;

  static const fullNameKey = Key('fullName');
  static const phoneKey = Key('phone');
  static const emailKey = Key('email');
  static const contactPersonCodeKey = Key('contactPerson');

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactPersonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final contact =
        FakeContactsRepository.instance.getContact(widget.contactId);
    _fullNameController.text = contact.fullName;
    _phoneController.text = contact.phone;
    _emailController.text = contact.email;
    _contactPersonController.text = contact.contactPerson;
  }

  final _isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _contactPersonController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      widget.onSubmit?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed contact'.hardcoded),
        centerTitle: true,
      ),
      body: ResponsiveScrollableCard(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AddressFormField(
                formFieldKey: ContactScreen.fullNameKey,
                controller: _fullNameController,
                labelText: 'FullName'.hardcoded,
                keyboardType: TextInputType.name,
                enabled: !_isLoading,
              ),
              gapH8,
              AddressFormField(
                formFieldKey: ContactScreen.phoneKey,
                controller: _phoneController,
                labelText: 'Phone'.hardcoded,
                keyboardType: TextInputType.phone,
                enabled: !_isLoading,
              ),
              gapH8,
              AddressFormField(
                formFieldKey: ContactScreen.emailKey,
                controller: _emailController,
                labelText: 'Email'.hardcoded,
                keyboardType: TextInputType.emailAddress,
                enabled: !_isLoading,
              ),
              gapH8,
              AddressFormField(
                formFieldKey: ContactScreen.contactPersonCodeKey,
                controller: _contactPersonController,
                labelText: 'Contact Person'.hardcoded,
                keyboardType: TextInputType.multiline,
                enabled: !_isLoading,
              ),
              PrimaryButton(
                text: 'Submit'.hardcoded,
                onPressed: _submit,
                isLoading: _isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable address form field
class AddressFormField extends StatelessWidget {
  const AddressFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.enabled = true,
    this.formFieldKey,
  });

  /// Controller used to read out the value in the parent widget
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;

  /// Whether the text field is enabled or not
  final bool enabled;

  /// Key used in the widget tests
  final Key? formFieldKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        enabled: enabled,
      ),
      autocorrect: true,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      validator: (value) =>
          value?.isNotEmpty == true ? null : 'Can\'t be empty'.hardcoded,
    );
  }
}
