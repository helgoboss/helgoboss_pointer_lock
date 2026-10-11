#include "include/helgoboss_pointer_lock/helgoboss_pointer_lock_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "helgoboss_pointer_lock_plugin.h"

void HelgobossPointerLockPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  helgoboss_pointer_lock::HelgobossPointerLockPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
