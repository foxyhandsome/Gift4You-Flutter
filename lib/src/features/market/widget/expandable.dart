import 'package:flutter/material.dart';

import '../../../constant/constants.dart';
import '../model/product.dart';

class Expandable extends StatefulWidget {
  final String? title;
  final String? description;
  final Widget trailing;
  final ProductModel? item;
  const Expandable({
    Key? key,
    this.title,
    this.item,
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
              child: Text(widget.item!.description!),
            ),
          ),
        ],
      ),
    );
  }
}
