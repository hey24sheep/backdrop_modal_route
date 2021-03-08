import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterContentStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterContentStatefulState();
}

class _CounterContentStatefulState extends State<CounterContentStateful> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Stateful Backdrop Overlay Content'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Return Type : Int'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Return Data : $_counter'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Counter : $_counter'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: TextButton(
              onPressed: _incrementCounter,
              child: Text('Increment'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, _counter);
                  },
                  child: Text('Close with data'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
