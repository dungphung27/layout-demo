import 'package:flutter/material.dart';
import 'profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double padding = 16;
  double gap = 12;
  int alignIndex = 3;
  bool showFrame = true;

  final List<String> alignNames = [
    'start',
    'center',
    'spaceBetween',
    'spaceEvenly',
  ];

  final List<MainAxisAlignment> alignValues = [
    MainAxisAlignment.start,
    MainAxisAlignment.center,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceEvenly,
  ];

  List<Widget> buildChips() {
    List<Widget> chips = [];
    for (int i = 0; i < alignNames.length; i++) {
      chips.add(
        ChoiceChip(
          label: Text(alignNames[i]),
          selected: alignIndex == i,
          onSelected: (value) {
            setState(() {
              alignIndex = i;
            });
          },
        ),
      );
    }
    return chips;
  }

  Widget legend(Color color, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Container(width: 16, height: 16, color: color),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  Widget treeLine(int level, String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0 * level, bottom: 2),
      child: Text(text),
    );
  }

  Widget heading(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget buildPanel() {
    return Container(
      width: 300,
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading('Điều chỉnh bố cục'),
            SizedBox(height: 12),
            Text('Padding của thẻ: ${padding.round()}'),
            Slider(
              value: padding,
              min: 0,
              max: 40,
              onChanged: (value) {
                setState(() {
                  padding = value;
                });
              },
            ),
            Text('Khoảng cách SizedBox: ${gap.round()}'),
            Slider(
              value: gap,
              min: 0,
              max: 40,
              onChanged: (value) {
                setState(() {
                  gap = value;
                });
              },
            ),
            SizedBox(height: 8),
            Text('mainAxisAlignment của hàng dưới:'),
            SizedBox(height: 8),
            Wrap(spacing: 8, children: buildChips()),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Hiện khung bố cục'),
              value: showFrame,
              onChanged: (value) {
                setState(() {
                  showFrame = value;
                });
              },
            ),
            Divider(),
            heading('Chú thích màu'),
            SizedBox(height: 8),
            legend(Colors.orange, 'Padding'),
            legend(Colors.purple, 'Column (xếp dọc)'),
            legend(Colors.blue, 'Row (xếp ngang)'),
            legend(Colors.green.shade200, 'SizedBox (khoảng trống)'),
            Divider(),
            heading('Cây widget của thẻ'),
            SizedBox(height: 8),
            treeLine(0, 'Padding'),
            treeLine(1, 'Column'),
            treeLine(2, 'Row (avatar, SizedBox, Expanded)'),
            treeLine(2, 'SizedBox'),
            treeLine(2, 'Text'),
            treeLine(2, 'SizedBox'),
            treeLine(2, 'Row (3 InfoBox)'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Demo bố cục giao diện Flutter')),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPanel(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: ProfileCard(
                  padding,
                  gap,
                  alignValues[alignIndex],
                  showFrame,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
