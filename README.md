# 📱 Finli App - Personal Finance Mobile Application

A modern Flutter mobile application for personal financial management, developed as part of the AMCC Mobile Development course.

## 🎯 Project Overview

Finli App is a comprehensive personal finance management application that helps users track their expenses, manage their profile, and maintain financial records. The app features a clean, intuitive interface with robust authentication and user management capabilities.

## ✨ Features

### 🔐 Authentication
- User login and registration
- Secure authentication using BLoC pattern
- Session management

### 👤 Profile Management
- View and edit user profile
- Profile picture management
- Personal information updates
- Settings and preferences

### 🎨 Modern UI/UX
- Clean and intuitive design
- Responsive layout for different screen sizes
- Custom color scheme and theming
- Smooth navigation and transitions

### 🏗️ Architecture
- **State Management**: BLoC (Business Logic Component) pattern
- **Navigation**: Custom tab-based navigation
- **Theme Management**: Centralized color and styling system
- **Widget Organization**: Modular and reusable components

## 🛠️ Tech Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: flutter_bloc
- **UI Components**: Material Design
- **Fonts**: Google Fonts (Plus Jakarta Sans)
- **Architecture Pattern**: BLoC Pattern

## 📁 Project Structure

```
lib/
├── bloc/                   # BLoC state management
│   └── auth/              # Authentication logic
├── pages/                 # Application screens
│   ├── profile/           # Profile-related pages
│   ├── login_page.dart    # Login screen
│   └── profile_page.dart  # Main profile screen
├── theme/                 # App theming
│   └── color.dart         # Color definitions
├── widgets/               # Reusable widgets
│   └── profile_button_widgets.dart
└── main.dart              # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/finli-app.git
   cd finli-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Building for Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release
```

## 🎨 Design System

### Color Palette
- **Primary**: Blue (#2196F3)
- **Secondary**: Pink (#EA1763)
- **Background**: Light gray
- **Text**: Dark blue/black

### Typography
- **Font Family**: Plus Jakarta Sans
- **Weights**: Regular (400), Medium (500), Semi-bold (600)

## 🧪 Features in Development

- [ ] Expense tracking
- [ ] Budget management
- [ ] Financial reports and analytics
- [ ] Dark mode support
- [ ] Multi-language support
- [ ] Data synchronization
- [ ] Push notifications

## 🤝 Contributing

This project is part of an educational course. If you'd like to contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 🔧 Development Notes

### Known Issues
- Bottom navigation persists in some navigation scenarios
- Profile image picker needs implementation
- Form validation needs enhancement

### Recent Updates
- ✅ Implemented BLoC pattern for authentication
- ✅ Added custom profile management
- ✅ Created reusable widget components
- ✅ Improved navigation structure

### Next Steps
- Implement expense tracking functionality
- Add data persistence
- Enhance UI animations
- Add comprehensive error handling

---

**Happy coding! 🚀**
