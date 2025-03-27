import 'package:flutter/material.dart';
import 'package:zad_almuslem/core/translations/translation.dart';

class TCWidget extends StatelessWidget {
  const TCWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Last updated: 13/02/2025\n\n"
              "Welcome to Zad Almuslem! By using our app, you agree to the following terms:\n\n"
              "1. User Roles\n"
              "Contributors: Must provide accurate, respectful, and Sharia-compliant content. False, offensive, or misleading content is strictly prohibited.\n"
              "Users: All content is for informational and spiritual purposes only. Please verify any religious information through trusted sources.\n\n"
              "2. Content Ownership\n"
              "Contributors retain full ownership of their content but grant Zad Almuslem the right to display, distribute, and adapt it to ensure alignment with Islamic values and app quality standards.\n\n"
              "3. Location Usage\n"
              "Zad Almuslem may request access to your location in order to provide accurate prayer times based on your geographical position. Your location data is used solely for this purpose and is not stored or shared.\n\n"
              "4. Privacy Policy\n"
              "We are committed to protecting your privacy. Personal data collected through the app is handled with strict confidentiality and is never shared with third parties without your consent. For more details, please refer to our full Privacy Policy within the app settings."
          .i18n,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
