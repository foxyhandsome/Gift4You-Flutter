import 'package:flutter/material.dart';

import '../../../constant/constants.dart';

class Expandable extends StatefulWidget {
  final String? title;
  final String? description;
  final Widget trailing;
  const Expandable({
    Key? key,
    this.title,
    this.description,
    required this.trailing,
  }) : super(key: key);

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title.toString(), style: kTitleStyle),
                Spacer(),
                if (widget.trailing != null) widget.trailing,
                RotatedBox(
                  quarterTurns: _expanded ? 3 : 0,
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 200),
            vsync: this,
            child: ConstrainedBox(
              constraints:
                  _expanded ? BoxConstraints() : BoxConstraints(maxHeight: 0),
              child: Text(widget.description ??
                  'คัดสรรพันธุ์ข้าวหอม 5 สายพันธุ์ ทั้งข้าวหอมมะลิ 105 ข้าวหอมมะลิแดง ข้าวหอมปทุมเทพ ข้าวหอมนิล และข้าวหอมช่อราตรี ผ่านการ ‘เบลนด์’ สัดส่วนที่ให้ความอร่อยได้อย่างลงตัวพร้อมคุณค่าที่หลากหลาย และร่วมเป็นพลังขับเคลื่อนให้เกษตรกรปลูกพันธุ์ข้าวประจำถิ่น เพื่อรักษาความหลากหลายทางสายพันธุ์เอาไว้ สู่วิถีเกษตรกรที่ยั่งยืน'),
            ),
          ),
        ],
      ),
    );
  }
}
