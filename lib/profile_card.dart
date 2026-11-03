import 'package:flutter/material.dart';
import 'info_box.dart';
import 'layout_frame.dart';

class ProfileCard extends StatelessWidget {
  final double padding;
  final double gap;
  final MainAxisAlignment align;
  final bool showFrame;

  const ProfileCard(this.padding, this.gap, this.align, this.showFrame,
      {super.key});

  Widget buildHeader() {
    return LayoutFrame(
      showFrame,
      Colors.blue,
      Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.person, color: Colors.white, size: 32),
            ),
          ),
          SpaceBox(showFrame, 12, 56),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phùng Đức Dũng',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Sinh viên Bách Khoa Đà Nẵng'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow() {
    return LayoutFrame(
      showFrame,
      Colors.blue,
      Row(
        mainAxisAlignment: align,
        children: [
          InfoBox('3', 'Dự án'),
          InfoBox('12', 'Tuần học'),
          InfoBox('5', 'Demo'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 460,
      color: Colors.white,
      child: LayoutFrame(
        showFrame,
        Colors.orange,
        Padding(
          padding: EdgeInsets.all(padding),
          child: LayoutFrame(
            showFrame,
            Colors.purple,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(),
                SpaceBox(showFrame, double.infinity, gap),
                Text(
                  'Mình đang học Flutter. Thẻ này dùng để minh họa Padding, SizedBox, Row và Column.',
                ),
                SpaceBox(showFrame, double.infinity, gap),
                buildInfoRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
