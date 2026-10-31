import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:helgoboss_pointer_lock/helgoboss_pointer_lock.dart';

class MouseInfo extends StatefulWidget {
  const MouseInfo({super.key});

  @override
  State<MouseInfo> createState() => _MouseInfoState();
}

class _MouseInfoState extends State<MouseInfo> with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  Offset _mousePosOnScreen = Offset.zero;

  @override
  void initState() {
    if (pointerLock.isSupportedPlatform()) {
     final ticker =createTicker((elapsed) async {
       final pos = await pointerLock.pointerPositionOnScreen();
       setState(() {
         _mousePosOnScreen = pos;
       });
     });
     ticker.start();
     _ticker = ticker;
    }
    super.initState();
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Mouse pointer position on screen: $_mousePosOnScreen"),
      ),
    );
  }
}
