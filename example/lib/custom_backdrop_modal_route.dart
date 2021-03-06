import 'package:backdrop_modal_route/backdrop_modal_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// single purpose custom backdrop modal route
class CustomBackdropModalRoute extends BackdropModalRouteBase<List<String>> {
  CustomBackdropModalRoute()
      : super(
          topPadding: 100.0,
          backdropShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        );

  @override
  Widget buildOverlayContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Custom Backdrop Modal Route'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Return Type : List<String>'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Return Data : "[Random Data, Foo, Bar]"'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, ['Random Data', 'Foo', 'Bar']);
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
