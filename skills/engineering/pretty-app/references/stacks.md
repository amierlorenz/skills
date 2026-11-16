# Stack mappings

Examples of how the rules map onto common stacks. They are starting points, not requirements: follow the project's existing conventions first, and for a stack not listed, map the same rules the same way. Each skill ships its own copy of this file; keep the two identical.

## Ugly screen

The whole screen is a title, the raw data and default buttons.

| Stack | Raw data | Actions | Logic lives in |
|---|---|---|---|
| Web (React) | `<pre>{JSON.stringify(data, null, 2)}</pre>` | plain `<button>` | hooks or services |
| SwiftUI | `Text(String(describing: data))`, or pretty-printed `JSONEncoder` output for `Encodable` types | `Button`, no modifiers | an `@Observable` model or view model |
| Jetpack Compose | `Text(data.toString())` | `Button` | `ViewModel` |
| Flutter | `Text(const JsonEncoder.withIndent('  ').convert(data.toJson()))` | `ElevatedButton` | a controller, notifier or provider |
| React Native | `<Text>{JSON.stringify(data, null, 2)}</Text>` | `<Button>` | hooks or services |

Lists of records can be a plain list with one raw row per item when one big dump is unreadable. Navigation uses the stack's default (router, `NavigationStack`, `NavHost`, `Navigator`), with no custom transitions.

## Debug-only code

Seed data, the reset action, the screen-jump menu and variant switchers must never reach a release build.

| Stack | Gate |
|---|---|
| Web | `import.meta.env.DEV` (Vite) or `process.env.NODE_ENV !== 'production'` |
| SwiftUI | `#if DEBUG` |
| Jetpack Compose | `BuildConfig.DEBUG` |
| Flutter | `kDebugMode` |
| React Native | `__DEV__` |

## Remembering a debug choice

How a chosen variant or jump target survives a reload or relaunch.

| Stack | Store |
|---|---|
| Web | URL search param (`?variant=B`), so it's shareable |
| SwiftUI | `@AppStorage`, or a launch argument |
| Jetpack Compose | `SharedPreferences` or DataStore |
| Flutter | `shared_preferences` |
| React Native | AsyncStorage |

## Screenshots

| Target | Command |
|---|---|
| iOS Simulator | `xcrun simctl io booted screenshot <file>.png` |
| Android emulator | `adb exec-out screencap -p > <file>.png` |
| Web | a browser tool if one is available, otherwise ask the user for screenshots |

Read every screenshot after taking it; a capture nobody looks at checks nothing.
