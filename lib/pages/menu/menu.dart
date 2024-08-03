import 'package:flutter/material.dart';
import 'package:app_pv/config/const.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(10, 142, 217, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 50),
            //Home
            Container(
              margin: EdgeInsets.only(right: 120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: ListTile(
                leading: Icon(Icons.home_outlined, color: Colors.blue),
                title: Text('Home', style: TextStyle(color: Colors.blue)),
                onTap: () {},
              ),
            ),
            SizedBox(height: 10),
            //Profile
            ListTile(
              leading: Icon(Icons.person_2_outlined, color: Colors.white),
              title: Text('Profile', style: textStyle),
              onTap: () {},
            ),
            SizedBox(height: 10),
            //Nearby
            ListTile(
              leading: Icon(Icons.location_on_outlined, color: Colors.white),
              title: Text('Nearby', style: textStyle),
              onTap: () {},
            ),
            SizedBox(height: 10),
            Divider(color: Colors.white54, endIndent: 120),
            SizedBox(height: 10),
            //Bookmark
            ListTile(
              leading: Icon(Icons.bookmark_outline, color: Colors.white),
              title: Text('Bookmark', style: textStyle),
              onTap: () {},
            ),
            SizedBox(height: 10),
            //Notification
            ListTile(
              leading: Icon(Icons.notifications_outlined, color: Colors.white),
              title: Text('Notification', style: textStyle),
              onTap: () {},
            ),
            SizedBox(height: 10),
            //Message
            ListTile(
              leading: Icon(Icons.mark_chat_unread_outlined,
                  color: Colors.white, size: 24),
              title: Text('Message', style: textStyle),
              onTap: () {},
            ),
            SizedBox(height: 10),
            Divider(color: Colors.white54, endIndent: 120),
            SizedBox(height: 10),
            //Settings
            ListTile(
              leading: Icon(Icons.settings_outlined, color: Colors.white),
              title: Text('Setting', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            SizedBox(height: 10),
            //Help
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.white),
              title: Text('Help', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            SizedBox(height: 10),
            //Logout
            ListTile(
              leading:
                  Icon(Icons.power_settings_new_outlined, color: Colors.white),
              title: Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
