import 'package:flutter/material.dart';

class ItemFieldWidget extends StatefulWidget {
  final int maxLines;
  final String text;
  final ValueChanged<String> onChanged;

  const ItemFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ItemFieldWidgetState createState() => _ItemFieldWidgetState();
}

class _ItemFieldWidgetState extends State<ItemFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          height: 34,
          width: 78,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
          ),
        ),
      );
}
