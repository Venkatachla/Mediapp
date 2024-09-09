import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(MyAppointmentsApp());
}

class MyAppointmentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppointmentsPage(),
    );
  }
}

class MyAppointmentsPage extends StatefulWidget {
  @override
  _MyAppointmentsPageState createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(118, 167, 205, 236),
      appBar: AppBar(
        backgroundColor: Colors.blue,
         elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to HomePage and replace the current screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage(name: '')), 
            );
          },
        ),
        title: Center(child: Text('My Appointments',style: TextStyle(color: Colors.white),)),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Upcoming'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('No Appointments Yet')),
          Center(child: Text('No Appointments yet')),
          Center(child: Text('No Appointments Yet')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyAppointmentsDetails(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyAppointmentsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Center(
        child: Text('Details of the appointment will be shown here.'),
      ),
    );
  }
}
