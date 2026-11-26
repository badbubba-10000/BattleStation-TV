// Modified for BattleStation TV, 2026-11-22. See BSTV-NOTICE.md.
#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>

#include "flutter_window.h"
#include "utils.h"


// Launch window settings are per-user and per-edition (Settings > Display & Window).
namespace {
constexpr wchar_t kWindowSettings[] = L"Software\\BattleStationTV\\Window";
DWORD WindowSetting(const wchar_t* name, DWORD fallback) {
  DWORD result = fallback;
  DWORD cb = sizeof(result);
  if (RegGetValueW(HKEY_CURRENT_USER, kWindowSettings, name,
      RRF_RT_REG_DWORD, nullptr, &result, &cb) != ERROR_SUCCESS) return fallback;
  return result;
}
}

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  // Attach to console when present (e.g., 'flutter run') or create a
  // new console when running with a debugger.
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  // Initialize COM, so that it is available for use in the library and/or
  // plugins.
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  // Flutter Win32Window::Create scales logical window dimensions for DPI.
  // Restrict to the current primary monitor's available work area.
  RECT work{};
  SystemParametersInfoW(SPI_GETWORKAREA, 0, &work, 0);
  const double dpiScale = static_cast<double>(GetDpiForSystem()) / 96.0;
  const int workWidth = static_cast<int>((work.right-work.left) / dpiScale);
  const int workHeight = static_cast<int>((work.bottom-work.top) / dpiScale);
  const bool remember = WindowSetting(L"Remember", 0) != 0;
  const bool maximized = WindowSetting(L"Maximized", 0) != 0;
  const bool center = WindowSetting(L"Center", 1) != 0;
  DWORD requestedWidth = WindowSetting(remember ? L"LastWidth" : L"Width", 1920);
  DWORD requestedHeight = WindowSetting(remember ? L"LastHeight" : L"Height", 1080);
  if (requestedWidth < 640 || requestedWidth > 8192) requestedWidth = 1920;
  if (requestedHeight < 480 || requestedHeight > 4320) requestedHeight = 1080;
  const unsigned int width = static_cast<unsigned int>((requestedWidth < static_cast<DWORD>(workWidth) ? requestedWidth : static_cast<DWORD>(workWidth)));
  const unsigned int height = static_cast<unsigned int>((requestedHeight < static_cast<DWORD>(workHeight) ? requestedHeight : static_cast<DWORD>(workHeight)));
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(width, height);
  if (!window.Create(L"BattleStation TV", origin, size)) {
    return EXIT_FAILURE;
  }
  window.SetQuitOnClose(true);
  if (maximized) {
    ShowWindow(window.GetHandle(), SW_MAXIMIZE);
  } else if (center) {
    RECT rect{};
    GetWindowRect(window.GetHandle(), &rect);
    const int physicalWidth = rect.right - rect.left;
    const int physicalHeight = rect.bottom - rect.top;
    const int x = work.left + ((work.right-work.left)-physicalWidth)/2;
    const int y = work.top + ((work.bottom-work.top)-physicalHeight)/2;
    SetWindowPos(window.GetHandle(), nullptr, x, y, 0, 0, SWP_NOSIZE|SWP_NOZORDER|SWP_NOACTIVATE);
  }


  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
