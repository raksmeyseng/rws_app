import 'package:flutter/material.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final void Function()? onResumed;
  final void Function()? onDetached;

  LifecycleEventHandler({
    this.onResumed,
    this.onDetached,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (onResumed != null) {
          onResumed!();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (onDetached != null) {
          onDetached!();
        }
        break;
    }
  }
}
