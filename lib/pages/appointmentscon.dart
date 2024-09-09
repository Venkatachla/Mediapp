import 'package:flutter/material.dart';

class AppointmentConfirmationPage extends StatelessWidget {
  final String appointmentDate;
  final String mobile;
  final String name;
  final String message;
  final String email;

  const AppointmentConfirmationPage({
    Key? key,
    required this.appointmentDate,
    required this.mobile,
    required this.name,
    required this.message,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 248, 253),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Appointment Confirmation',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Appointment Details',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
            ),
            SizedBox(height: 20),
            _buildDetailRow('Appointment Date:', appointmentDate),
            SizedBox(height: 10),
            _buildDetailRow('Mobile Number:', mobile),
            SizedBox(height: 10),
            _buildDetailRow('Full Name:', name),
            SizedBox(height: 10),
            _buildDetailRow('Email:', email),
            SizedBox(height: 10),
            _buildDetailRow('Message:', message),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Message sent successfully!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Send a Message'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
