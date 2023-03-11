import 'package:rws_app/config/routes/application.dart';
import 'package:flutter/material.dart';

enum DialogAnimationType {
  none,
  scale,
  fromBottom,
  fromTop,
  scaleFromBottom,
  scaleFromTop,
}

typedef TransitionBuilder = Widget Function(
  BuildContext context,
  Animation<double> a1,
  Animation<double> a2,
  Widget widget,
);

typedef PageBuilder = Widget Function(
  BuildContext,
  Animation<double>,
  Animation<double>,
);

class DialogHelper {
  static Future<T?> showAnimatedDialog<T extends Object?>({
    required PageBuilder pageBuilder,
    bool barrierDismissible = true,
    String barrierLabel = 'dialog',
    DialogAnimationType animationType = DialogAnimationType.fromBottom,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) async {
    return showGeneralDialog<T>(
      context: Application.context!,
      barrierColor: Colors.black.withOpacity(0.5), //SHADOW EFFECT
      transitionBuilder: _makeTransition(animationType),
      transitionDuration: transitionDuration,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          onWillPop: () => Future.value(barrierDismissible),
          child: pageBuilder(context, animation, secondaryAnimation),
        );
      },
    );
  }

  static TransitionBuilder? _makeTransition(DialogAnimationType type) {
    switch (type) {
      case DialogAnimationType.scale:
        return _scaleBuilder;
      case DialogAnimationType.fromBottom:
        return _fromBottomBuilder;
      case DialogAnimationType.fromTop:
        return _fromTopBuilder;
      case DialogAnimationType.scaleFromBottom:
        return _scaleFromBottomBuilder;
      case DialogAnimationType.scaleFromTop:
        return _scaleFromTopBuilder;
      default:
        return null;
    }
  }

  static Widget _scaleBuilder(
    BuildContext conext,
    Animation<double> a1,
    Animation<double> a2,
    Widget widget,
  ) {
    return Transform.scale(
      scale: a1.value,
      child: Opacity(
        opacity: a1.value,
        child: widget,
      ),
    );
  }

  static Widget _fromBottomBuilder(
    BuildContext conext,
    Animation<double> a1,
    Animation<double> a2,
    Widget widget,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: a1,
          curve: Curves.linearToEaseOut,
        ),
      ),
      child: widget,
    );
  }

  static Widget _fromTopBuilder(
    BuildContext conext,
    Animation<double> a1,
    Animation<double> a2,
    Widget widget,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: a1,
          curve: Curves.linearToEaseOut,
        ),
      ),
      child: widget,
    );
  }

  static Widget _scaleFromBottomBuilder(
    BuildContext conext,
    Animation<double> a1,
    Animation<double> a2,
    Widget widget,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: a1,
          curve: Curves.linearToEaseOut,
        ),
      ),
      child: Transform.scale(
        scale: a1.value,
        child: widget,
      ),
    );
  }

  static Widget _scaleFromTopBuilder(
    BuildContext conext,
    Animation<double> a1,
    Animation<double> a2,
    Widget widget,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: a1,
          curve: Curves.linearToEaseOut,
        ),
      ),
      child: Transform.scale(
        scale: a1.value,
        child: widget,
      ),
    );
  }
}
