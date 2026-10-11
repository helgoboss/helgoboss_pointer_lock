import 'dart:ui';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'helgoboss_pointer_lock.dart';
import 'helgoboss_pointer_lock_channel.dart';

abstract class HelgobossPointerLockPlatform extends PlatformInterface {
  /// Constructs a HelgobossPointerLockPlatform.
  HelgobossPointerLockPlatform() : super(token: _token);

  static final Object _token = Object();

  static HelgobossPointerLockPlatform _instance = ChannelPointerLock();

  /// The default instance of [HelgobossPointerLockPlatform] to use.
  ///
  /// Defaults to [ChannelPointerLock].
  static HelgobossPointerLockPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HelgobossPointerLockPlatform] when
  /// they register themselves.
  static set instance(HelgobossPointerLockPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> ensureInitialized() {
    throw UnimplementedError('ensureInitialized() has not been implemented.');
  }

  Stream<PointerLockMoveEvent> createSession({
    required PointerLockWindowsMode windowsMode,
    required PointerLockCursor cursor,
    required bool unlockOnPointerUp,
  }) {
    throw UnimplementedError('createSession() has not been implemented.');
  }

  Future<void> hidePointer() {
    throw UnimplementedError('hidePointer() has not been implemented.');
  }

  Future<void> showPointer() {
    throw UnimplementedError('showPointer() has not been implemented.');
  }

  Future<Offset> pointerPositionOnScreen() {
    throw UnimplementedError(
        'pointerPositionOnScreen() has not been implemented.');
  }
}
