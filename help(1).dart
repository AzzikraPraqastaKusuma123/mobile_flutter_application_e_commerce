import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelpPage(),
    );
  }
}

class HelpPage extends StatelessWidget {
  final List<FaqItem> faqItems = [
    FaqItem(
      question: 'How do I place an order?',
      answer: 'To place an order, go to the product page, select the desired quantity, and click the "Add to Cart" button. After that, proceed to the checkout page to complete your order.',
    ),
    FaqItem(
      question: 'Can I cancel my order?',
      answer: 'Once an order is placed, it cannot be canceled. Please review your order carefully before confirming the purchase.',
    ),
    FaqItem(
      question: 'How can I track my order?',
      answer: 'You can track your order in the "Order History" section of your account. Additionally, you will receive email updates with the tracking information once your order is shipped.',
    ),
    // Add more FAQ items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            FaqList(faqItems: faqItems),
            SizedBox(height: 32.0),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ContactInfo(),
          ],
        ),
      ),
    );
  }
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem({
    required this.question,
    required this.answer,
  });
}

class FaqList extends StatelessWidget {
  final List<FaqItem> faqItems;

  const FaqList({
    required this.faqItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: faqItems.map((faqItem) {
        return FaqItemWidget(faqItem: faqItem);
      }).toList(),
    );
  }
}

class FaqItemWidget extends StatelessWidget {
  final FaqItem faqItem;

  const FaqItemWidget({
    required this.faqItem,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        faqItem.question,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            faqItem.answer,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email: levelup0@example.com',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'Phone: +62 857-0612-5411',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
