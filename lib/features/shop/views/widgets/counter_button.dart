import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final int counter;

  const CounterButton({
    super.key,
    required this.counter,
  });

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      decoration: BoxDecoration(border: Border.all()),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.remove,
              size: 12.0,
            ),
            onPressed: _counter > 1 ? _decrementCounter : null,
          ),
          Text(
            '$_counter',
            style: const TextStyle(fontSize: 12.0),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 12.0,
            ),
            onPressed: _incrementCounter,
          ),
        ],
      ),
    );
  }
}
