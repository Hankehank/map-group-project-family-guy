import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FDF2),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('My Appointments'),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert_outlined),
            tooltip: 'Add Reminder',
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upcoming Appointments",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  AppointmentCard(
                    title: "Doctor Visit",
                    date: "Monday, 10 June",
                    time: "10:00 AM",
                    icon: Icons.local_hospital,
                    location: "Sunway Medical Centre",
                    note: "Bring previous reports",
                  ),
                  AppointmentCard(
                    title: "Blood Test",
                    date: "Tuesday, 11 June",
                    time: "8:30 AM",
                    icon: Icons.bloodtype,
                    location: "Pathlab Clinic",
                    note: "Fasting required",
                  ),
                  AppointmentCard(
                    title: "Medication Reminder",
                    date: "Daily",
                    time: "8:00 AM",
                    icon: Icons.medication,
                    location: "Home",
                    note: "Take after breakfast",
                  ),
                  AppointmentCard(
                    title: "Dentist Checkup",
                    date: "Friday, 14 June",
                    time: "2:00 PM",
                    icon: Icons.medical_services_outlined,
                    location: "Happy Dental Clinic",
                    note: "Review x-ray results",
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

class AppointmentCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final IconData icon;
  final String location;
  final String note;

  const AppointmentCard({
    Key? key,
    required this.title,
    required this.date,
    required this.time,
    required this.icon,
    required this.location,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: const Color(0xFFE7F9E7),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(icon, size: 36, color: Colors.green[800]),
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text("$date \u2022 $time"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location: $location",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Note: $note",
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
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
