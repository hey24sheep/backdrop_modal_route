/// Brings all the features of modal route with ease.
/// Create dynamic modal route with state/stateless widgets

library backdrop_modal_route;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const DEFAULT_BACKDROP_TOP_PADDING = 56.0;

typedef Widget OverlayContentBuilder(BuildContext context);

/// abstract base, extend from this to create custom modal route
abstract class BackdropModalRouteBase<T> extends ModalRoute<T> {
  BackdropModalRouteBase({
    this.backgroundColor,
    this.topPadding,
    this.barrierOpacity,
    this.transitionDurationVal,
    this.isOpaque,
    this.canBarrierDismiss,
    this.barrierColorVal,
    this.barrierLabelVal,
    this.shouldMaintainState,
    this.backdropShape,
  }) {
    backgroundColor ??= Colors.white;
    topPadding ??= DEFAULT_BACKDROP_TOP_PADDING;
    barrierOpacity ??= 0.5;
    transitionDurationVal ??= const Duration(milliseconds: 500);
    isOpaque ??= false;
    canBarrierDismiss ??= true;
    barrierColorVal ??= Colors.black.withOpacity(barrierOpacity);
    shouldMaintainState ??= true;
    backdropShape ??= RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    );
  }

  Color backgroundColor;
  double topPadding;
  double barrierOpacity;
  Duration transitionDurationVal;
  bool isOpaque;
  bool canBarrierDismiss;
  Color barrierColorVal;
  String barrierLabelVal;
  bool shouldMaintainState;
  ShapeBorder backdropShape;

  @override
  Duration get transitionDuration => transitionDurationVal;

  @override
  bool get opaque => isOpaque;

  @override
  bool get barrierDismissible => canBarrierDismiss;

  @override
  Color get barrierColor => barrierColorVal;

  @override
  String get barrierLabel => barrierLabelVal;

  @override
  bool get maintainState => shouldMaintainState;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return SafeArea(
      minimum: EdgeInsets.only(
        top: topPadding,
      ),
      child: Material(
        type: MaterialType.canvas,
        elevation: 1.0,
        color: backgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: backdropShape,
        child: Wrap(
          children: <Widget>[
            buildOverlayContent(context),
          ],
        ),
      ),
    );
  }

  Widget buildOverlayContent(BuildContext context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Create transition from bottom to top, like bottom sheet
    return SlideTransition(
      position: CurvedAnimation(
        parent: animation,
        curve: Curves.fastLinearToSlowEaseIn,
      ).drive(
        Tween<Offset>(
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ),
      child: child,
    );
  }
}

/// default backdrop modal
class BackdropModalRoute<T> extends BackdropModalRouteBase<T> {
  BackdropModalRoute({
    @required this.overlayContentBuilder,
    Color backgroundColor,
    double topPadding,
    double barrierOpacity,
    Duration transitionDurationVal,
    bool isOpaque,
    bool canBarrierDismiss,
    Color barrierColorVal,
    String barrierLabelVal,
    bool shouldMaintainState,
    ShapeBorder backdropShape,
  })  : assert(overlayContentBuilder != null),
        super(
          backgroundColor: backgroundColor,
          topPadding: topPadding,
          barrierOpacity: barrierOpacity,
          transitionDurationVal: transitionDurationVal,
          isOpaque: isOpaque,
          canBarrierDismiss: canBarrierDismiss,
          barrierColorVal: barrierColorVal,
          barrierLabelVal: barrierLabelVal,
          shouldMaintainState: shouldMaintainState,
          backdropShape: backdropShape,
        );

  final OverlayContentBuilder overlayContentBuilder;

  @override
  Widget buildOverlayContent(BuildContext context) {
    return overlayContentBuilder(context);
  }
}
