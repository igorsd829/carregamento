import 'package:flutter/material.dart';

class RowCardColorsTrucks extends StatefulWidget {
  final void Function() onPressed;
  final Color color;
  final bool selected;
  const RowCardColorsTrucks(
      {required this.onPressed,
      required this.color,
      this.selected = false,
      super.key});

  @override
  State<RowCardColorsTrucks> createState() => _RowCardColorsTrucksState();
}

class _RowCardColorsTrucksState extends State<RowCardColorsTrucks> {
  bool selecteding = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 4,
                color: selecteding ? Colors.black45 : Colors.transparent)),
        height: 30,
        width: 60,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(widget.color),
                elevation: MaterialStateProperty.all(selecteding ? 15 : 5)),
            onPressed: widget.onPressed,
            child: Text(
              '',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 30),
            )),
      ),
    );
  }
}
