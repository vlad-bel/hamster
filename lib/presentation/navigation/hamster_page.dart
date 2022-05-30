import 'package:flutter/cupertino.dart';

class HamsterPage<T> extends Page<T> {
  /// Creates a material page.
  const HamsterPage({
    required this.child,
    this.maintainState = true,
    this.fullscreenDialog = false,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  final bool fullscreenDialog;

  /// {@macro flutter.widgets.ModalRoute.maintainState}
  final bool maintainState;

  @override
  Route<T> createRoute(BuildContext context) {
    return _HamsterPageRoute<T>(page: this);
  }
}

class _HamsterPageRoute<T> extends PageRoute<T> {
  _HamsterPageRoute({
    required HamsterPage<T> page,
  }) : super(settings: page);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _page.child;
  }

  @override
  String get debugLabel => '${super.debugLabel}(${_page.name})';

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  bool get maintainState => _page.maintainState;

  @override
  Duration get transitionDuration => Duration.zero;

  HamsterPage<T> get _page => settings as HamsterPage<T>;
}
