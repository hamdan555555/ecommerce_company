import 'package:flutter/material.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DashboardCard(
              title: 'Section 1',
              subtitle: 'Description for Section 1',
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            DashboardCard(
              title: 'Section 2',
              subtitle: 'Description for Section 2',
              color: Colors.green,
            ),
            SizedBox(height: 16),
            DashboardCard(
              title: 'Section 3',
              subtitle: 'Description for Section 3',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  DashboardCard({required this.title, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
