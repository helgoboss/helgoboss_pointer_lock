import 'package:flutter_test/flutter_test.dart';
import 'package:helgoboss_pointer_lock/helgoboss_pointer_lock.dart';
import 'package:helgoboss_pointer_lock/src/helgoboss_pointer_lock_platform_interface.dart';
import 'package:helgoboss_pointer_lock/src/helgoboss_pointer_lock_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockPointerLockPlatform
//     with MockPlatformInterfaceMixin
//     implements PointerLockPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

void main() {
  final PointerLockPlatform initialPlatform = PointerLockPlatform.instance;

  test('$ChannelPointerLock is the default instance', () {
    expect(initialPlatform, isInstanceOf<ChannelPointerLock>());
  });

  test('getPlatformVersion', () async {
    // MockPointerLockPlatform fakePlatform = MockPointerLockPlatform();
    // PointerLockPlatform.instance = fakePlatform;

    // expect(await pointerLockPlugin.getPlatformVersion(), '42');
  });
}
