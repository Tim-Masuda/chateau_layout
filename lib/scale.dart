import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

@immutable
class Scale extends StatelessWidget {
  final Widget child;
  final int layoutWidth;

  const Scale({
    Key? key,
    this.layoutWidth = 360,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => kIsWeb
      ? _ObservableScale(
          child: child,
        )
      : child;
}

@immutable
class _ObservableScale extends StatefulWidget {
  final Widget child;

  const _ObservableScale({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<_ObservableScale> createState() => __ObservableScaleState();
}

class __ObservableScaleState extends State<_ObservableScale> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() => setState(() {});

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _ScaleScope(
        scale: _scale,
        child: widget.child,
      );
}

class _ScaleScope extends InheritedWidget {
  final double scale;

  const _ScaleScope({
    Key? key,
    required this.scale,
    required Widget child,
  }) : super(key: key, child: child);

  static _ScaleScope of(BuildContext context) {
    final _ScaleScope? result = context.dependOnInheritedWidgetOfExactType<_ScaleScope>();
    assert(result != null, 'No _ScaleScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(_ScaleScope old) => old.scale != scale;
}

double get _scale => (window.physicalSize.width / window.devicePixelRatio) / 360;

double __scale = _scale;

extension ScaleX on BuildContext {
  double get sc => kIsWeb ? _ScaleScope.of(this).scale : __scale;
}
