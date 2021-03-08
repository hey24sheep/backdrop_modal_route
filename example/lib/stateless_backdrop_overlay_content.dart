import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatelessBackdropOverlayContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Stateless Backdrop Overlay Content'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Return Type : String'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Return Data : "Random Data"'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Random Data');
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
