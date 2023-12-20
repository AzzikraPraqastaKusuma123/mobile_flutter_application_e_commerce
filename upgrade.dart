import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class UpgradeService {
  final String name;
  final String description;
  final double price;

  UpgradeService({
    required this.name,
    required this.description,
    required this.price,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpgradePage(),
    );
  }
}

class UpgradePage extends StatelessWidget {
  final List<UpgradeService> upgradeServices = [
    UpgradeService(
      name: 'Upgrade Processor',
      description: 'Boost your computer\'s processing power.',
      price: 99.99,
    ),
    UpgradeService(
      name: 'Upgrade RAM',
      description: 'Improve your computer\'s multitasking capability.',
      price: 49.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upgrade Services'),
      ),
      body: ListView.builder(
        itemCount: upgradeServices.length,
        itemBuilder: (context, index) {
          return UpgradeServiceCard(
            upgradeService: upgradeServices[index],
          );
        },
      ),
    );
  }
}

class UpgradeServiceCard extends StatelessWidget {
  final UpgradeService upgradeService;

  const UpgradeServiceCard({
    required this.upgradeService,
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
              upgradeService.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              upgradeService.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${upgradeService.price.toString()}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to handle the upgrade button
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Upgrade Confirmation'),
                      content: Text('Do you want to proceed with the upgrade?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Handle upgrade confirmation
                            Navigator.pop(context);
                            // You can implement further logic here
                          },
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle canceling the upgrade
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Upgrade'),
            ),
          ],
        ),
      ),
    );
  }
}
