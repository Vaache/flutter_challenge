# Flutter Challange

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to use

- To perform Login or Register, press and hold the button (long-press) instead of a simple tap.
- Recommended hold duration: about 1–2 seconds. Keep holding until a visual feedback appears (for example, a progress indicator or color change).
- Visual feedback: when the long-press is recognized, the button should show progress or an animation. If nothing happens, try holding slightly longer.
- Notes for developers:
  - Implement long-press handling on the relevant buttons (for example, GestureDetector.onLongPress or InkWell.onLongPress in Flutter).
  - Provide clear user feedback (spinner, color change, text "Hold" -> "Processing").
  - Handle short taps separately — they should not trigger login/registration.

## Build & Run

- Install dependencies:
  - flutter pub get
- Run on connected device or emulator:
  - flutter run
- Build release APK:
  - flutter build apk --release
- Build iOS (macOS required):
  - flutter build ios --release

## Code generation (build_runner)

If your project uses code generation (json_serializable, freezed, moor, etc.):

- Fetch packages:
  - flutter pub get
- Run code generation once:
  - flutter pub run build_runner build --delete-conflicting-outputs
- Or run in watch mode during development:
  - flutter pub run build_runner watch --delete-conflicting-outputs

Tips:
- Use --delete-conflicting-outputs when switching branches or after large refactors to avoid conflicts.
- If you see "Generated file changed" errors, try stopping build_runner and running the build command again with --delete-conflicting-outputs.
