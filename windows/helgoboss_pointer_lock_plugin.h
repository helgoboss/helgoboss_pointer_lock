#ifndef FLUTTER_PLUGIN_HELGOBOSS_POINTER_LOCK_PLUGIN_H_
#define FLUTTER_PLUGIN_HELGOBOSS_POINTER_LOCK_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/event_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace helgoboss_pointer_lock {

class HelgobossPointerLockPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  HelgobossPointerLockPlugin(flutter::PluginRegistrarWindows* registrar);

  virtual ~HelgobossPointerLockPlugin();

  // Disallow copy and assign.
  HelgobossPointerLockPlugin(const HelgobossPointerLockPlugin&) = delete;
  HelgobossPointerLockPlugin& operator=(const HelgobossPointerLockPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

 private:
   flutter::PluginRegistrarWindows* registrar_;

   bool pointer_visible_ = true;

   // ID of the WindowProcDelegate registration in case we are subscribed to raw input data.
   // For being able to unregister it at the end.
   std::optional<int> raw_input_data_proc_id_;
   
   // Mouse deltas extracted from the last incoming raw input data.
   LONG last_x_delta_ = 0;
   LONG last_y_delta_ = 0;

   void SetPointerVisible(bool visible);
   bool SubscribeToRawInputData();
   void UnsubscribeFromRawInputData();
   bool SubscribedToRawInputData();
};

struct HelgobossPointerLockSession {
public:
  HelgobossPointerLockSession(flutter::PluginRegistrarWindows* registrar, std::unique_ptr<flutter::EventSink<flutter::EncodableValue>> sink, bool unlockOnPointerUp);
  ~HelgobossPointerLockSession();
private:
  flutter::PluginRegistrarWindows* registrar_;

  bool unlockOnPointerUp_;
  
  // Event sink. Lets us send events to Flutter. 
  std::unique_ptr<flutter::EventSink<flutter::EncodableValue>> sink_;

  // Position of the locked pointer in screen coordinates.
  POINT locked_pointer_screen_pos_;

  // ID of the WindowProcDelegate registration that receives mouse events. For being able to unregister it at the end.
  int proc_id_;
};

class HelgobossPointerLockSessionStreamHandler : public flutter::StreamHandler<flutter::EncodableValue> {
public:
  HelgobossPointerLockSessionStreamHandler(flutter::PluginRegistrarWindows* registrar);

protected:
  // Called when a pointer lock session is requested.
  std::unique_ptr<flutter::StreamHandlerError<flutter::EncodableValue>> OnListenInternal(const flutter::EncodableValue* arguments, std::unique_ptr<flutter::EventSink<flutter::EncodableValue>>&& events) override;
  
  // Called when a pointer lock session ends (either triggered from the Flutter side or by us).
  std::unique_ptr<flutter::StreamHandlerError<flutter::EncodableValue>> OnCancelInternal(const flutter::EncodableValue* arguments) override;

private:
  flutter::PluginRegistrarWindows* registrar_;
  
  // Empty in the beginning. Set as long as a pointer lock session is active.
  std::unique_ptr<HelgobossPointerLockSession> session_;
};

}  // namespace helgoboss_pointer_lock

#endif  // FLUTTER_PLUGIN_HELGOBOSS_POINTER_LOCK_PLUGIN_H_
