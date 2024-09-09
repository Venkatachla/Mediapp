import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/consts/images.dart';
import 'package:flutter_application_1/consts/list.dart';
import 'package:flutter_application_1/pages/home_page.dart'; // Ensure this import is correct

class Settingsview extends StatelessWidget {
  const Settingsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to HomePage and replace the current screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage(name: '')), // Provide necessary parameters
            );
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset(AppAssets.icFace), // Adjust according to your asset path
            ),
            title: Text("username"),
            subtitle: Text("user_email@gmail.com"),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: settingsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // Handle the tap event
                    switch (index) {
                      case 0:
                        // Handle "Change Password"
                        break;
                      case 1:
                        // Handle "Terms & Conditions"
                        break;
                      case 2:
                        // Handle "Sign Out"
                        break;
                    }
                  },
                  leading: Icon(
                    settingsListicon[index], // Ensure this list is defined correctly
                    color: AppColors.blue,
                  ),
                  title: Text(settingsList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
