// ignore_for_file: use_build_context_synchronously

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zad_almuslem/core/app_colors/app_colors.dart';
import 'package:zad_almuslem/core/translations/translation.dart';
import 'package:zad_almuslem/featuers/auth/application/auth_notifier_provider.dart';
import 'package:zad_almuslem/featuers/home/presentation/controllers/prayer_controller.dart';
import 'package:zad_almuslem/featuers/settings/presentation/widget/language_dialog_widget.dart';
import 'package:zad_almuslem/test/settings_card_widget.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings".i18n),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsCardWidget(
              icon: Icons.person,
              title: "Edit Profile".i18n,
              onTap: () {
                BotToast.showText(text: 'Soon');
              },
            ),

            SettingsCardWidget(
              icon: Icons.language,
              title: "Change Language".i18n,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const LanguageDialogWidget(),
                );
              },
            ),

            SettingsCardWidget(
              icon: Icons.brightness_4,
              title: "Dark Mode".i18n,
              trailing: Consumer(
                builder: (context, ref, child) {
                  return FlutterSwitch(
                    width: 50,
                    height: 25,
                    toggleSize: 20,
                    value:
                        false,
                    borderRadius: 15,
                    padding: 2,
                    activeColor: AppColors.primary,
                    inactiveColor: Colors.grey[300]!,
                    onToggle: (value) {
                    },
                  );
                },
              ),
            ),

            SettingsCardWidget(
              icon: Icons.access_time,
              title: "Time format".i18n,
              trailing: Consumer(
                builder: (context, ref, child) {
                  final is24HourFormat =
                      ref.watch(prayerControllerProvider).is24HourFormat;

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        is24HourFormat ? '24-hour' : '12-hour',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 10),
                      FlutterSwitch(
                        width: 50,
                        height: 25,
                        toggleSize: 20,
                        value: is24HourFormat,
                        borderRadius: 15,
                        padding: 2,
                        activeColor: AppColors.primary,
                        inactiveColor: Colors.grey[300]!,
                        onToggle: (value) {
                          ref
                              .read(prayerControllerProvider.notifier)
                              .toggleTimeFormat();
                        },
                      ),
                    ],
                  );
                },
              ),
            ),

            SettingsCardWidget(
              icon: Icons.notifications,
              title: "Enable Notifications".i18n,
              trailing: Consumer(
                builder: (context, ref, child) {
                  return FlutterSwitch(
                    width: 50,
                    height: 25,
                    toggleSize: 20,
                    value:
                        true, 
                    borderRadius: 15,
                    padding: 2,
                    activeColor: AppColors.primary,
                    inactiveColor: Colors.grey[300]!,
                    onToggle: (value) {
                    },
                  );
                },
              ),
            ),

            SettingsCardWidget(
              icon: Icons.logout,
              title: "Log Out".i18n,
              onTap: () {
                _showLogoutDialog(context, ref);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure you want to log out?".i18n),
          content: Text("You will be logged out from the app.".i18n),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel".i18n),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await ref.read(authNotifierProvider.notifier).logOut();
                context.go('/logIn');
              },
              child: Text("Log Out".i18n),
            ),
          ],
        );
      },
    );
  }
}
