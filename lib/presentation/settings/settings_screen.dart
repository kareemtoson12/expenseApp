import 'package:expense/app/styles/app_colors.dart';
import 'package:expense/app/styles/home_card_styles.dart';
import 'package:expense/app/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 60,
                left: 24,
                right: 24,
                bottom: 32,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1E6FF9),
                    Color(0xFF3A8DFF),
                    Color(0xFF0057FF),
                    Color(0xFF0057FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  SettingsListTile(title: 'About us', onTap: () {}),
                  SettingsListTile(title: 'Privacy policy', onTap: () {}),
                  SettingsListTile(title: 'Terms and conditions', onTap: () {}),
                  SettingsSwitchTile(
                    title: 'Push notifications',
                    value: pushNotifications,
                    onChanged: (val) => setState(() => pushNotifications = val),
                  ),
                  SettingsSwitchTile(
                    title: 'Dark mode',
                    value: darkMode,
                    onChanged: (val) => setState(() => darkMode = val),
                  ),
                  SettingsListTile(
                    title: 'Help & Support',
                    icon: Icons.help_outline,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onTap;
  const SettingsListTile({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      title: Text(title, style: AppTextStyles.settingsItem),
      trailing: icon != null
          ? Icon(icon, color: AppColors.primary, size: 22)
          : const Icon(Icons.chevron_right, color: Colors.grey, size: 22),
      onTap: onTap,
    );
  }
}

class SettingsSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  const SettingsSwitchTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      title: Text(title, style: AppTextStyles.settingsItem),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
      ),
    );
  }
}
