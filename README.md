# Backdrop Modal Route
[![pub package](https://img.shields.io/pub/v/backdrop_modal_route.svg)](https://pub.dartlang.org/packages/backdrop_modal_route)
[![GitHub Stars](https://img.shields.io/github/stars/hey24sheep/backdrop_modal_route.svg?logo=github)](https://github.com/hey24sheep/backdrop_modal_route)
[![Platform](https://img.shields.io/badge/platform-android%20|%20ios-green.svg)](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green.svg)

**Get best of both worlds, backdrop with actual backdrop unlike material design and non sticky bottom sheet**

This flutter package will help you create **backdrop modal route** or **non sticky bottom sheet** with **minimal code and efforts with dynamic content**. 

- **Android and IOS**
- **simple and easy**
- **no other dependencies**
- **well documented**
- **production-ready**

This package was created as a need for our in-production app, as there is no single solution which gives you a route enabled bottom-sheet or backdrop which is route enabled and a new page with an actual backdrop unlike material design.

<p>
<img src="https://github.com/hey24sheep/backdrop_modal_route/raw/master/screenshots/example1.gif" width="220" height="440" />
<img src="https://github.com/hey24sheep/backdrop_modal_route/raw/master/screenshots/example2.gif" width="220" height="440" />
<img src="https://github.com/hey24sheep/backdrop_modal_route/raw/master/screenshots/example3.gif" width="220" height="440" />
<img src="https://github.com/hey24sheep/backdrop_modal_route/raw/master/screenshots/example4.gif" width="220" height="440" />
</p>

## Getting Started
Add the dependency `backdrop_modal_route: ^0.1.0` to your project and start using **Backdrop Modal Route** everywhere:
```dart
import 'package:backdrop_modal_route/backdrop_modal_route.dart';
```

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

### Creating custom block modal transitions

```dart
// NOTE : only for on UIBlock.block as this uses Modal Barrier
// widget block is inline widget replacement with loader widget

// ... more code
customBuildBlockModalTransitions:
    (context, animation, secondaryAnimation, child) {
    return RotationTransition(
        turns: animation,
        child: child,
    );
},
// ... more code

```

For more details have a look at the other [examples](https://github.com/hey24sheep/backdrop_modal_route/tree/master/example).

## Properties
| Property                          | Type         | Default                           |                                                           Note |
| ------------------------          |:------------:| --------------------------------: | -------------------------------------------------------------: |
| DEFAULT_BACKDROP_TOP_PADDING      | double       | 56.0                              |                                                                |
| overlayContentBuilder (required)  | Function     | you implement it                  |                                                                |
| backgroundColor                   | Color        | White                             |                                                                |
| topPadding                        | double       | 56.0                              |                                                                |
| barrierOpacity                    | double       | 0.5                               |                                                                |
| transitionDurationVal             | Duration     | milliseconds:500                  |                                                                |
| isOpaque                          | boolean      | false                             |                                                                |
| canBarrierDismiss                 | boolean      | true                              |                                                                |
| barrierColorVal                   | Color        | black.withOpacity(barrierOpacity) |                                                                |
| barrierLabelVal                   | String       | null                              |                                                                |
| shouldMaintainState               | bool         | true                              |                                                                |
| backdropShape                     | ShapeBorder  | RoundedRectangleBorder            |                                                                |
| safeAreaLeft                      |     bool     |            true                   |                     Set as 'false' to disable 'Left' Safe Area |
| safeAreaTop                       |     bool     |            true                   | Set as 'false' to disable 'Top' (usually status bar) Safe Area |
| safeAreaRight                     |     bool     |            true                   |                    Set as 'false' to disable 'Right' Safe Area |
| safeAreaBottom                    |     bool     |            true                   |                   Set as 'false' to disable 'Bottom' Safe Area |
| safeAreaMinimumPadding            |  EdgeInsets  | topPadding                        | 'topPadding' is used to set this. Default 56.0.                |
| safeAreaMaintainBottomViewPadding |     bool     |           false                   |                                                                |
| isSlideTransitionDefault          |     bool     |           true                    | Toggle between slide or fade transition                        |
| buildBlockModalTransitions        |   Function   |               -                   | Use this to create custom transition other than fade/slide     |

## FAQ
Q. How to hide content using scroll ?</br>
A. You have to implement it yourself and you could add it as parent of OverlayContent.
   Check this [#1](https://github.com/hey24sheep/backdrop_modal_route/issues/1)

## Improve

Help me by reporting bugs, **submit new ideas** for features or anything else that you want to share.

- Just [write an issue](https://github.com/hey24sheep/backdrop_modal_route/issues) on GitHub. ✏️
- And don't forget to hit the **like button** for this package ✌️

## More

Check out my other useful packages on [pub.dev](https://pub.dev/packages?q=email%3Ahey24sheep%40gmail.com)