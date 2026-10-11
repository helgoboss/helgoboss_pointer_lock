#include <flutter_linux/flutter_linux.h>

#include "include/helgoboss_pointer_lock/helgoboss_pointer_lock_plugin.h"

// This file exposes some plugin internals for unit testing. See
// https://github.com/flutter/flutter/issues/88724 for current limitations
// in the unit-testable API.

FlMethodResponse* pointer_position_on_screen(const HelgobossPointerLockPlugin* plugin);
FlMethodResponse* last_pointer_delta(const HelgobossPointerLockPlugin* plugin);
FlMethodResponse* set_pointer_visible(HelgobossPointerLockPlugin* plugin, bool visible);
FlMethodResponse* set_helgoboss_pointer_locked(HelgobossPointerLockPlugin* plugin, bool locked);