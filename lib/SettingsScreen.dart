import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _buildTitle('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications Toggle
            _buildSwitchTile(
              title: 'Enable Notifications',
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),

            SizedBox(height: 20),

            // Change Language Option
            _buildListTile(
              title: 'Change Language',
              onTap: () {
                // Navigate to Language Selection screen (or implement functionality)
              },
            ),

            SizedBox(height: 20),

            // Change Profile Picture
            _buildListTile(
              title: 'Change Profile Picture',
              onTap: () {
                // Implement functionality to change the profile picture
              },
            ),

            SizedBox(height: 20),

            // Manage Account
            _buildListTile(
              title: 'Manage Account',
              onTap: () {
                // Navigate to Account Management screen
              },
            ),

            SizedBox(height: 20),

            // Privacy Settings
            _buildListTile(
              title: 'Privacy Settings',
              onTap: () {
                // Navigate to Privacy Settings screen
              },
            ),

            SizedBox(height: 20),

            // Help & Support
            _buildListTile(
              title: 'Help & Support',
              onTap: () {
                // Navigate to Help & Support screen
              },
            ),

            SizedBox(height: 30),
            Divider(color: Colors.grey.shade700),

            // Logout Option
            _buildListTile(
              title: 'Logout',
              onTap: () {
                // Implement logout functionality
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Color(0xFF00C896),
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey.shade600,
      contentPadding: EdgeInsets.zero, // Remove extra padding around switch
    );
  }

  Widget _buildListTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 16.0,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF00A6ED)),
      onTap: onTap,
      contentPadding:
          EdgeInsets.zero, // Remove extra padding around the list tile
    );
  }
}
