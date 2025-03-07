import 'package:flutter/material.dart';

class LoginSecurityScreen extends StatelessWidget {
  const LoginSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Login & Security',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Protect your account with these security tools',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 24),

                // Personal Info Section
                _buildSectionHeader('Personal Information'),
                _buildSettingTile(
                  context,
                  title: 'Legal name',
                  subtitle: 'Sarah Johnson',
                  leadingIcon: Icons.person_outline,
                ),
                _buildSettingTile(
                  context,
                  title: 'Email address',
                  subtitle: 'sarah.johnson@example.com',
                  leadingIcon: Icons.email_outlined,
                ),
                _buildSettingTile(
                  context,
                  title: 'Phone number',
                  subtitle: '+1 (123) 456-7890',
                  leadingIcon: Icons.phone_outlined,
                ),

                const SizedBox(height: 32),

                // Login Settings Section
                _buildSectionHeader('Login Settings'),
                _buildSettingTile(
                  context,
                  title: 'Change password',
                  subtitle: 'Last updated 3 months ago',
                  leadingIcon: Icons.lock_outline,
                ),
                _buildSettingTile(
                  context,
                  title: 'Two-factor authentication',
                  subtitle: 'Enabled via SMS',
                  leadingIcon: Icons.security_outlined,
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.black,
                  ),
                ),
                _buildSettingTile(
                  context,
                  title: 'Social accounts',
                  subtitle: 'Google, Facebook',
                  leadingIcon: Icons.link_outlined,
                ),

                const SizedBox(height: 32),

                // Security Section
                _buildSectionHeader('Security'),
                _buildSettingTile(
                  context,
                  title: 'Login devices',
                  subtitle: '2 devices currently logged in',
                  leadingIcon: Icons.devices_outlined,
                ),
                _buildSettingTile(
                  context,
                  title: 'Login history',
                  subtitle: 'View your recent login activity',
                  leadingIcon: Icons.history_outlined,
                ),
                _buildSettingTile(
                  context,
                  title: 'Get alerts about unrecognized logins',
                  subtitle: 'We\'ll notify you if someone logs in from a new device',
                  leadingIcon: Icons.notifications_outlined,
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.black,
                  ),
                ),

                const SizedBox(height: 32),

                // Additional Security Section
                _buildSectionHeader('Additional Security'),
                _buildSettingTile(
                  context,
                  title: 'Require verification code at login',
                  subtitle: 'Add an extra layer of security to your account',
                  leadingIcon: Icons.verified_user_outlined,
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                    activeColor: Colors.black,
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Danger Zone
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border.all(color: Colors.red.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning_amber_outlined, color: Colors.red[400]),
                          const SizedBox(width: 8),
                          Text(
                            'Account Management',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.red[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                        ),
                        child: const Text(
                          'Deactivate my account',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 1),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildSettingTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData leadingIcon,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(leadingIcon, color: Colors.black87, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            trailing ?? const Icon(Icons.chevron_right, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}

