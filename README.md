# FifthWeekSwift

> **Week 5: UIKit Integration, Advanced Navigation, Core Data Optimizations, Custom Components, Validations, Gestures**

[![Swift](https://img.shields.io/badge/Swift-5.10-orange)]() [![Xcode](https://img.shields.io/badge/Xcode-16%2B-blue)]() [![iOS](https://img.shields.io/badge/iOS-17%2B-black)]() [![Architecture](https://img.shields.io/badge/Architecture-MVVM-green)]()

This repo contains a **multi‑feature SwiftUI app** where the home screen shows a **Feature List**. Tapping a row navigates to the corresponding demo implementation. It’s designed to learn by doing, with small, focused examples you can reuse in real projects.

---

## 📦 Features (Week 5)

* **UIKit Integration — `UIViewRepresentable`**: Wraps `UITextView` for rich text editing in SwiftUI.
* **Advanced Navigation — Deep Link Simulation**: Programmatic navigation using `NavigationStack` + URL parsing.
* **CoreData Optimization — Batch Updates**: Programmatic Core Data model + `NSBatchUpdateRequest` demo.
* **Custom Components — Button & Toast**: Reusable `FancyButton` + `toast` view modifier.
* **Form Validations — Regex & Logic Checks**: Live validation for email & password rules.
* **SwiftUI Gestures — Drag & Drop**: Drag strings into a drop zone and display results.

---

## 🗂 Project Structure

```
FifthWeekSwift/
 ├── FifthWeekSwiftApp.swift           // App entry — shows FeatureListView on launch
 ├── Feature.swift                     // Enum of features (title + destination views)
 ├── FeatureListView.swift             // Home screen list + navigation
 ├── UIKitTextViewRepresentable.swift  // UIViewRepresentable wrapper + UIKitTextViewDemo
 ├── DeepLinkNavigationDemo.swift      // URL → NavigationPath demo
 ├── CoreDataManager.swift             // Programmatic Core Data stack (TaskItem)
 ├── CoreDataBatchUpdateDemo.swift     // Seed/clear/batch‑update tasks
 ├── Toast.swift                       // toast view modifier
 ├── FancyButton.swift                 // reusable gradient button
 ├── CustomComponentsDemo.swift        // demo screen for custom UI
 ├── FormValidationDemo.swift          // email/password validation with regex
 └── GesturesDemo.swift                // drag & drop demo
```

> All modules are **standalone**. You can pick and use any in another project.

---

## 🚀 Getting Started

1. **Requirements**: Xcode 16+, iOS 17+ (simulator or device), Swift 5.10+
2. **Clone**:

   ```bash
   git clone https://github.com/garry007/FifthWeekSwift.git
   cd FifthWeekSwift
   ```
3. **Open & Run**: Open `FifthWeekSwift.xcodeproj` (or `.xcworkspace` if you use packages) and run ▶️
4. **Home Screen**: You’ll see **Week 5 Demos** list. Tap a row to open that feature.

---

## 🧭 How It Works

* **Home (Feature List)**: `FeatureListView` pulls from `Feature.allCases` and builds `NavigationLink`s.
* **Routing**: Each case in `Feature` provides a `title` and a `destination` view.
* **Core Data**: A programmatic model (`TaskItem`) is registered in `CoreDataManager` to avoid `.xcdatamodeld`.
* **Batch Updates**: `NSBatchUpdateRequest` toggles `isDone` in bulk for performance.
* **UIKit in SwiftUI**: `UITextViewWrapper` uses `UIViewRepresentable` + Coordinator for delegate callbacks.

---

## 🧪 Quick Manual Tests

* **UIKit**: Type in the wrapped `UITextView`, verify character count updates.
* **Navigation**: In Deep Link demo, try: `myapp://feature/formValidation?prefill=email`.
* **Core Data**: Seed 1,000 tasks → Batch mark as done → Clear all.
* **Custom Components**: Press **Show Toast** and see it auto‑dismiss.
* **Validations**: Email + strong password (≥8, 1 upper, 1 lower, 1 digit) enables **Submit**.
* **Gestures**: Drag items from the list into the dashed **Drop Here** zone.

---

## 🧱 Code Snippets

### App Entry

```swift
@main
struct FifthWeekSwiftApp: App {
    var body: some Scene {
        WindowGroup { FeatureListView() }
    }
}
```

### Feature List

```swift
struct FeatureListView: View {
    var body: some View {
        NavigationStack {
            List(Feature.allCases) { feature in
                NavigationLink(feature.title) { feature.destination }
            }
            .navigationTitle("Week 5 Demos")
        }
    }
}
```

---

## 🧰 Troubleshooting

* **Empty list on launch**: Ensure `Feature` conforms to `CaseIterable` & `Identifiable`, and `FeatureListView` uses `Feature.allCases`.
* **Navigation not pushing**: Confirm you’re inside a `NavigationStack` (not just `NavigationView` on iOS 17+).
* **Batch updates not reflected**: Call `context.refreshAllObjects()` after `NSBatchUpdateRequest`.
* **Regex not matching**: Patterns are case‑insensitive for email; password requires at least one upper, one lower, one digit.

---

## 🗓 Roadmap (What to Try Next)

* Add **unit tests** for validators and batch update helpers
* Expand Deep Link demo to open specific rows or tab routes
* Add **accessibility** labels and VoiceOver testing hints
* Persist **drag‑drop results** with Core Data / AppStorage

---

## 📣 Share Your Win

Post a short LinkedIn update:

> Week 5 in my Swift learning roadmap: embedded UIKit in SwiftUI, simulated deep links with NavigationStack, optimized Core Data with NSBatchUpdateRequest, and built reusable components + gestures. Small steps, consistent progress. #SwiftUI #iOSDev #Combine #CoreData

---

## 📄 License

MIT — feel free to use the code in your projects.
