<div align="center">

# Coursify

### A Flutter application built with Clean Architecture & MVVM

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)

![Status](https://img.shields.io/badge/Status-In%20Progress-1F5070?style=for-the-badge)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-3B7597?style=for-the-badge)
![Pattern](https://img.shields.io/badge/Pattern-MVVM-1F5070?style=for-the-badge)

</div>

---

## Project Structure

```
coursify/
├── lib/
│   ├── app/                    → singleton instance, routing
│   ├── presentation/           → UI layer
│   │   ├── color_manager.dart  → all colors
│   │   ├── font_manager.dart   → typography
│   │   ├── values_manager.dart → margins, padding, sizes
│   │   ├── styles_manager.dart → text styles
│   │   ├── theme_manager.dart  → app theme
│   │   └── views/              → screens
│   ├── domain/                 → business logic, models
│   └── data/                   → repositories, API
├── assets/
│   └── images/                 → SVG assets
└── pubspec.yaml
```

---

## Architecture

```
┌─────────────────────────────────────┐
│           Presentation              │
│   screens · themes · managers       │
├─────────────────────────────────────┤
│              Domain                 │
│      models · business logic        │
├─────────────────────────────────────┤
│               Data                  │
│      repositories · API calls       │
└─────────────────────────────────────┘
```

---

## Core Principles

- Zero hardcoded values — everything lives in a manager
- Single responsibility per class
- Full separation of concerns across layers
- Singleton pattern for app instance management

---

## Design System

| Token | Value |
|---|---|
| Primary | `#3B7597` Steel Blue |
| Dark Primary | `#1F5070` |
| Primary 70% | `#7AADC5` |
| Font | Lato via Google Fonts |

---

## Getting Started

```bash
# clone
git clone https://github.com/Talhaarif326/coursify-flutter.git

# install dependencies
cd coursify-flutter && flutter pub get

# run
flutter run
```

---

<div align="center">
<sub>Built with Flutter · Clean Architecture · MVVM</sub>
</div>

## Connect With Me

<div align="center">

[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/TalhaArif794)
&nbsp;
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/talha-arif-247b67291)
&nbsp;
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Talhaarif326)

<br/>

📫 Reach me on X/Twitter **[@TalhaArif794](https://x.com/TalhaArif794)**
&nbsp;·&nbsp;
💼 Open to Flutter opportunities
&nbsp;·&nbsp;
🔗 [github.com/Talhaarif326](https://github.com/Talhaarif326)

</div>