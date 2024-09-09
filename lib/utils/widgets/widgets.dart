import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_age.dart';
import 'package:flutter_application_1/pages/myappointments.dart';

import 'package:flutter_application_1/pages/settings.dart';


import 'package:url_launcher/url_launcher.dart';

class Mydrawer extends StatelessWidget {
  final String name;
  const Mydrawer({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final imageurl =
        "https://media.istockphoto.com/id/1451587807/vector/user-profile-icon-vector-avatar-or-person-icon-profile-picture-portrait-symbol-vector.jpg?s=612x612&w=0&k=20&c=yDJ4ITX1cHMh25Lt1vI1zBn2cAKKAlByHBvPJ8gEiIg=";

    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Mr.$name"),
              accountEmail: Text("$name@gmail.com"),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.blue),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Optionally navigate to the HomePage if needed
            },
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.2,
            ),
            onTap: () {
              // Handle navigation to Profile Page if needed
            },
          ),
          ListTile(
            leading: Icon(
              Icons.login,
              color: Colors.white,
            ),
            title: Text(
              "Log-in",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()), // Navigate to LoginPage
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle_sharp,
              color: Colors.white,
            ),
            title: Text(
              "My Appointments",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.2,
            ),
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAppointmentsApp()), // Navigate to LoginPage
              );
              
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.white,
            ),
            title: Text(
              "Help and Support",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.2,
            ),
            onTap: () async {
              final Uri emailUri = Uri(
                scheme: 'mailto',
                path: 'venkatachalavenku029@outlook.com',
                query: Uri.encodeComponent('Subject=Support Request'),
              );

              if (await canLaunchUrl(emailUri)) {
                await launchUrl(emailUri);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not open email client')),
                );
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.2,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Settingsview()), // Navigate to Settingsview
              );
            },
          ),
        ],
      ),
    );
  }
}
