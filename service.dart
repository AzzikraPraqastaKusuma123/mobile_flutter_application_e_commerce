import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ComputerService {
  final String name;
  final String description;
  final String phoneNumber;
  final String chatId;

  ComputerService({
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.chatId,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServicePage(),
    );
  }
}

class ServicePage extends StatelessWidget {
  final List<ComputerService> computerServices = [
    ComputerService(
      name: 'Virus Removal',
      description: 'Remove viruses and malware from your computer.',
      phoneNumber: '+1 123-456-7890',
      chatId: '@virus_removal_expert',
    ),
    ComputerService(
      name: 'Hardware Repair',
      description: 'Fix hardware issues and replace faulty components.',
      phoneNumber: '+1 987-654-3210',
      chatId: '@hardware_repair_specialist',
    ),
    // Add more services as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Services'),
      ),
      body: ListView.builder(
        itemCount: computerServices.length,
        itemBuilder: (context, index) {
          return ComputerServiceCard(
            computerService: computerServices[index],
          );
        },
      ),
    );
  }
}

class ComputerServiceCard extends StatelessWidget {
  final ComputerService computerService;

  const ComputerServiceCard({
    required this.computerService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              computerService.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              computerService.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement logic to handle phone call
                    // You can use a package like url_launcher to initiate a phone call
                  },
                  child: Text('Call'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic to handle chat
                    // You can use a package like url_launcher to open a chat app with the given chat ID
                  },
                  child: Text('Chat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
