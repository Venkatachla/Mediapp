import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/appointmentscon.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key});

  @override
  _BookAppointmentViewState createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  final _mobileController = TextEditingController();
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _nameController.dispose();
    _messageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _navigateToConfirmationPage() {
    if (_formKey.currentState?.validate() ?? false) {
      final appointmentDate = _selectedDate == null
          ? 'Not selected'
          : '${_selectedDate!.toLocal()}'.split(' ')[0];
      final mobile = _mobileController.text;
      final name = _nameController.text;
      final message = _messageController.text;
      final email = _emailController.text; // Ensure email is captured here

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AppointmentConfirmationPage(
            appointmentDate: appointmentDate,
            mobile: mobile,
            name: name,
            message: message,
            email: email, // Pass email parameter
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Center(
          child: Text(
            'Doctor Name',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Appointment Day'),
                SizedBox(height: 10),
                TextFormField(
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  controller: TextEditingController(
                      text: _selectedDate == null
                          ? 'Pick a date'
                          : '${_selectedDate!.toLocal()}'.split(' ')[0]),
                  decoration: InputDecoration(
                    hintText: 'Select Date',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text('Mobile Number'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Patient's Full Name"),
                SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Enter Email-ID"),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Message'),
                SizedBox(height: 10),
                TextFormField(
                  controller: _messageController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Enter your message',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: _navigateToConfirmationPage,
          child: Text("Book an Appointment"),
        ),
      ),
    );
  }
}
