import 'package:flutter/cupertino.dart';

class HamsterPage<T> extends Page<T> {
  /// Creates a material page.
  const HamsterPage({
    required this.child,
    this.maintainState = true,
    this.fullscreenDialog = false,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  })  : assert(child != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(
            key: key,
            name: name,
            arguments: arguments,
            restorationId: restorationId);

  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  /// {@macro flutter.widgets.ModalRoute.maintainState}
  final bool maintainState;

  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  final bool fullscreenDialog;

  @override
  Route<T> createRoute(BuildContext context) {
    return _HamsterPageRoute<T>(page: this);
  }
}

class _HamsterPageRoute<T> extends PageRoute<T> {
  _HamsterPageRoute({
    required HamsterPage<T> page,
  })  : assert(page != null),
        super(settings: page) {
    assert(opaque);
  }

  HamsterPage<T> get _page => settings as HamsterPage<T>;

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _page.child;
  }

  @override
  Duration get transitionDuration => Duration.zero;
}
