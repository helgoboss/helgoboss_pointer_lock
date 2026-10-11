#include "include/helgoboss_pointer_lock/helgoboss_pointer_lock_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "helgoboss_pointer_lock_plugin.h"

void PointerLockPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  helgoboss_pointer_lock::PointerLockPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
