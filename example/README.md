# Example

Flutter example of Backdrop Modal Route package.

## Using default backdrop modal route

Open backdrop with your custom widget which could be stateful/stateless.

```dart
// with custom return type T
final result = await Navigator.push(
      context,
      BackdropModalRoute<T>(
        overlayContentBuilder: (context) => 
            YourStatelessOrStatefulBackdropOverlayContentWidget(),
      ),
    );
```

Open backdrop with inline widget

```dart
// with inline widget
await Navigator.push(
      context,
      BackdropModalRoute<void>(
        overlayContentBuilder: (context) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(24),
            child: RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Inline Close'),
            ),
          );
        },
      ),
    );
```



## Using abstract base to create your own backdrop modal route

```dart
/// single purpose custom backdrop modal route
/// could be a single purpose modal like form filling, location show, etc
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
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context, ['Random Data', 'Foo', 'Bar']);
                  },
                  child: Text('Close with data'),
                ),
                FlatButton(
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

```