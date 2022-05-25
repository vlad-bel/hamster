import 'package:flutter/material.dart';

typedef HintOverlayWidgetBuilder = PreferredSizeWidget Function(BuildContext);

/// Adds functionality of show or hide hint overlay
/// Steps to use:
/// 1. Add this mixin to you state, like
///   MyWidgetState extends State<MyWidget>
///     with HinOverlayProviderMixin<MyWidget>
/// 2. Initialize overlayWidgetBuilder, like
///   overlayWidgetBuilder = MyHint();
///   MyHint class must implements PreferredSizeWidget to use with this mixin
/// 3. Wrap your widgets in build() method to CompositedTransformTarget
///       with argument link: hintLayerLink
/// 4. Invoke [showOverlay] to show your hint or [hideOverlay] to hide
mixin HintOverlayProviderMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _hintOverlay;
  final hintLayerLink = LayerLink();
  HintOverlayWidgetBuilder? _overlayWidgetBuilder;

  bool _inserted = false;

  set overlayWidgetBuilder(HintOverlayWidgetBuilder? builder) {
    _overlayWidgetBuilder = builder;
  }

  void showOverlay() {
    if (_inserted) return;

    Overlay.of(context)?.insert(_lazyHintOverlay);
    _inserted = true;
  }

  void hideOverlay() {
    if (!_inserted) return;
    _hintOverlay?.remove();
    _inserted = false;
  }

  OverlayEntry get _lazyHintOverlay {
    assert(
      _overlayWidgetBuilder != null,
      'Overlay widget builder is not initialized. '
      'Initialize overlayWidgetBuilder before',
    );
    if (_hintOverlay == null) {
      final box = context.findRenderObject() as RenderBox?;
      final size = box?.size;
      final hintOverlay = _overlayWidgetBuilder!.call(context);
      _hintOverlay = OverlayEntry(
          builder: (context) => Positioned(
                width: hintOverlay.preferredSize.width,
                height: hintOverlay.preferredSize.height,
                child: CompositedTransformFollower(
                  offset: Offset(
                    size!.width,
                    -(hintOverlay.preferredSize.height / 2) + size.height / 2,
                  ),
                  link: hintLayerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    color: Colors.transparent,
                    child: Theme(data: Theme.of(context), child: hintOverlay),
                  ),
                ),
              ));
    }
    return _hintOverlay!;
  }
}
