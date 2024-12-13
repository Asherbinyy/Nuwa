# NUWA System Design Documentation

## Overview
NUWA is a Flutter-based application designed for stylus-enabled data collection, offering features like sketching, exporting sketches to PDF, and dynamic text-based experiments. The app is responsive, supports multiple platforms, and is built with a modular architecture, leveraging state management and modern Flutter development practices.

---

## Project Details
- **Name**: NUWA
- **Flutter SDK**: `>=3.24.7`
- **Environment**:
    - Dart SDK: `^3.6.0`
    - Platforms: Android, iOS, Web, Linux, macOS
---

## Visuals
- **Video or GIF**: *[Placeholder for video showcasing app functionality]*

---
## Features
1. **Stylus Integration**:
    - Manage stylus connection states: Connected, Connecting, Disconnected.
    - Handle reconnections and stylus-based interactions.

2. **Sketch Drawing**:
    - Interactive sketch area for freehand drawing.
    - Record coordinates for every stroke.

3. **PDF Export**:
    - Export drawn sketches to a PDF format compatible with all platforms.

4. **Dynamic Text Experiments**:
    - Auto-generate and refresh random text for experimentation.

5. **Responsive UI**:
    - Mobile-optimized and tablet-optimized layouts using `ResponsiveBuilder`.

6. **Lightweight Navigation**:
    - Uses a custom package `easy_go` for managing simple navigations with transitions.

7. **Custom Font Integration**:
    - The app uses the **Inter** font family for typography. It provides a clean and modern design, with multiple font weights defined in the assets and applied globally.

---
## Services
1. **StylusConnectionService**:
    - Manages stylus state (`connected`, `connecting`, `notConnected`).
    - Mocked during development to simulate connection scenarios.

2. **SketchExporterService**:
    - Converts sketches into PDF format.
    - Platform-aware (uses `printing` for web and desktop).

3. **PermissionsHandlerService**:
    - Requests and validates permissions for storage and PDF export.

4. **WordGenerator**:
    - Provides random text for text experiments.

---

## Architecture
The app follows a **feature-driven architecture** with the following structure:

```
lib/
├── core/
│   ├── app/                 # Application lifecycle initialization
│   ├── di/                  # Dependency Injection (injectable)
│   ├── logger/              # Logging setup
│   ├── navigator/           # Custom navigator (easy_go)
│   ├── resources/           # Assets, styles, constants
│   ├── services/            # Feature-agnostic services
│   └── utils/               # Extensions and helper methods
├── features/
│   ├── dashboard/           # Dashboard module
│   ├── date_collection/     # Data Collection module
│   └── splash/              # Splash screen module
└── shared/
    ├── generics/            # Generic Bloc, UI, and utilities
    └── ui_kit/              # Reusable UI components
```

### 1. Core Modules
- **`easy_go` Navigator**:
    - Lightweight navigation package created to simplify Flutter routing with custom transitions.
    - [Package link](https://pub.dev/packages/easy_go).
    - Differentiates from `go_router` by being minimal and tailored to specific use cases.

- **Dependency Injection**:
    - Uses `injectable` and `get_it` to handle service dependencies.
    - Ensures a clean, testable codebase with modular components.

- **Logging**:
    - Custom logger (`app_logger`) for structured debugging and error tracking.

### 2. Features
- **Dashboard Module**:
    - Displays stylus status and manages navigation to the data collection page.
    - Uses `DashboardController` to handle stylus state and dialog interactions.

- **Data Collection Module**:
    - Implements the core sketch and text experiment features.
    - Exports sketches as PDF files and dynamically updates text content.
    - Manages state with a dedicated `DataCollectionController`.

- **Splash Module**:
    - Introductory splash screen to initialize app dependencies.

### 3. Shared Components
- **UI Kit**:
    - Includes reusable widgets like buttons (`ButtonPrimary`), cards, and dialogs.
    - Modular design for consistency across features.

- **Generics**:
    - `GenericBloc`: Lightweight state management for scalable and reusable components.

---

## Packages Used
1. **flutter_bloc**:
    - For state management.

2. **get_it & injectable**:
    - **get_it**: Service locator for dependency injection.
    - **injectable**: Code generation for DI setup, reducing boilerplate.

3. **pdf & printing**:
    - **pdf**: Create and manipulate PDF documents programmatically.
    - **printing**: Adds printing and sharing functionality for PDFs across platforms.

4. **path_provider**:
    - Access device directories to store PDFs on mobile platforms.

5. **permission_handler**:
    - Manages permissions for platform-specific operations (e.g., storage access on mobile).

6. **flutter_screenutil**:
    - Enables responsive layouts with pixel-perfect scaling.

7. **mocktail**:
    - Mocking library for writing unit tests with clean syntax.

8. **easy_go**:
    - Custom lightweight navigator for managing app transitions.

## Testing Strategy
### Unit Tests
- **Controllers**:
    - `DashboardController`: Test stylus state transitions and dialog logic.
    - `DataCollectionController`: Verify sketch recording, text refreshing, and export functionality.

- **Services**:
    - `sketch_service`: Ensured points are recorded correctly during sketching and cleared when required.
    - `WordGenerator`: Ensure random text generation logic is working as expected.
    - `SketchExporterService`: Validated PDF export logic for different platforms, including handling of sketch points and permission checks.
    - `StylusConnectionService`: Simulate state changes and validate connection lifecycle.

--- 