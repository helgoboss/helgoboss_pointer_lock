import 'package:flutter/material.dart';
import 'package:helgoboss_pointer_lock/helgoboss_pointer_lock.dart';
import 'package:helgoboss_pointer_lock_example/info_panel.dart';

class DragExample extends StatefulWidget {
  final PointerLockCursor cursor;
  final PointerLockWindowsMode windowsMode;

  const DragExample({
    super.key,
    required this.cursor,
    required this.windowsMode,
  });

  @override
  State<DragExample> createState() => _DragExampleState();
}

class _DragExampleState extends State<DragExample> {
  bool _dragging = false;
  Offset _lastPointerDelta = Offset.zero;
  Offset _firstPointerDelta = Offset.zero;
  Offset _accumulation = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return PointerLockDragArea(
      cursor: widget.cursor,
      windowsMode: widget.windowsMode,
      onLock: (_) => _setDragging(true),
      onMove: (details) {
        _setLastPointerDelta(details.move.delta);
      },
      onUnlock: (_) => _setDragging(false),
      child: switch (_dragging) {
        false => Center(
            child: Text(
              "Drag with left mouse button!",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        true => InfoPanel(
            firstPointerDelta: _firstPointerDelta,
            lastPointerDelta: _lastPointerDelta,
            accumulation: _accumulation,
          ),
      },
    );
  }

  void _setDragging(bool value) {
    setState(() {
      _firstPointerDelta = Offset.zero;
      _lastPointerDelta = Offset.zero;
      _accumulation = Offset.zero;
      _dragging = value;
    });
  }

  void _setLastPointerDelta(Offset delta) {
    if (!mounted) {
      return;
    }
    setState(() {
      if (_firstPointerDelta == Offset.zero) {
        _firstPointerDelta = delta;
      }
      _lastPointerDelta = delta;
      _accumulation += delta;
    });
  }
}
