import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String number;
  final String label;

  const InfoBox(this.number, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      padding: EdgeInsets.all(8),
      color: Colors.blue.shade50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(label),
        ],
      ),
    );
  }
}
