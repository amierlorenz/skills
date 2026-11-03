# Platforms

Read only the section for the learner's platform. Help them choose in the first session:

- **On their phone, and they have a Mac:** iOS.
- **Something to share with a link, or no Mac:** Web.
- **A game on their computer:** Python game.

## iOS (SwiftUI)

**Setup** (they click through it themselves, one step at a time; it's their first win):
1. Install Xcode from the Mac App Store. It's large, so start the download before anything else.
2. In Xcode: File > New > Project > iOS > App. Interface **SwiftUI**. A name they choose, saved somewhere they'll find again.
3. Open Claude Code in the folder Xcode created (the one with the `.xcodeproj`).

**Seeing it:** the preview canvas next to the code, and ▶ (Cmd+R) for the Simulator. You edit the Swift files; they watch Xcode. New files in the project folder normally appear on their own; if one doesn't, ask them to check Xcode's file list on the left.

**On their own iPhone:** possible with a free Apple ID (Xcode > Settings > Accounts, then pick the phone as the run destination). Offer it once the app has its first real screen; it's a big motivator.

**Screenshot for trophies:** `xcrun simctl io booted screenshot <file>.png` while the Simulator runs.

**Names by level:** 2: `Text`, `Button`, `Image`, `VStack`/`HStack`, modifiers. 3: `let`/`var`, `@State`, `if`/`else`, arrays. 4: `func`, `struct`, `ForEach`, passing data between views. 5: `@Observable` models, unit tests in Xcode.

**Limits:** WeatherKit needs a paid Apple Developer account; for live weather use a free weather API at Level 3+. App Store release needs the paid account too: out of scope.

## Web (HTML, CSS, JavaScript)

**Setup:**
1. A project folder with `index.html`, `style.css` and `script.js`. You create them.
2. Open Claude Code in that folder.
3. Open `index.html` in their browser. They refresh after each change.

**Seeing it:** the browser. Show them how to view it at phone size in the browser's developer tools once the page has its first real screen.

**Sharing with a link:** GitHub Pages, free, once they have save points (Level 2+). Sharing a link with friends is a big motivator.

**Screenshot for trophies:** ask them to take one (Cmd+Shift+4 on Mac, Win+Shift+S on Windows) and tell you where it saved.

**Names by level:** 2: tags, `class`, CSS properties (`color`, `font-size`, `padding`). 3: `let`/`const`, `if`/`else`, arrays, event listeners. 4: functions, objects, loops, `fetch` for internet data. 5: modules, browser storage, simple tests.

## Python game (pygame)

**Setup:**
1. Check Python with `python3 --version`; install from python.org if missing.
2. A project folder with a virtual environment and `pip install pygame`. You run these.
3. Open Claude Code in that folder. They run the game with `python3 main.py`.

**Seeing it:** the game window. They close and rerun it after each change.

**Screenshot for trophies:** add a key (for example `S`) that calls `pygame.image.save(screen, "trophy.png")`.

**Names by level:** 2: colors as `(r, g, b)`, positions as `(x, y)`, sizes, `draw` calls. 3: variables, `if`/`else`, lists, the game loop. 4: functions, classes for things in the game, `for` loops. 5: modules, simple tests.

**Limits:** sharing the game with friends who don't have Python is hard: out of scope for a first app.
