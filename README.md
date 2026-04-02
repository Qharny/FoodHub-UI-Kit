# 🥂 FoodShop UI - Premium Food & Grocery Experience

[![Flutter](https://img.shields.io/badge/Flutter-v3.22+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![State Management](https://img.shields.io/badge/Provider-v6.1.1-6BA539?logo=flutter&logoColor=white)](https://pub.dev/packages/provider)
[![Storage](https://img.shields.io/badge/Storage-SharedPreferences-0175C2?logo=dart&logoColor=white)](https://pub.dev/packages/shared_preferences)

A high-fidelity, premium Flutter application designed for a seamless food and grocery shopping experience. Built with a focus on modern aesthetics, fluid animations, and robust functionality using local storage for a zero-backend configuration.

## ✨ Features

### 🎨 Visual Excellence
- **Deeply Immersive Dark Mode**: Full system-aware dark theme support with curated surface and background tokens.
- **Interactive Shuffle Banner**: A custom 3D card shuffle interaction for featured promotions, replacing traditional carousels with elastic physics and parallax effects.
- **Micro-interactions**: Subtle bounce animations, hover effects, and spring-based transitions for a premium tactile feel.

### 🍔 Advanced Ordering
- **Complex Customization**: Support for multi-select toppings (checkboxes) and exclusive choices (radio buttons) with real-time price calculation.
- **Special Instructions**: Direct-to-kitchen notes and references for highly personalized orders.
- **Smart Cart System**: Intelligent grouping of items based on customization, ensuring unique configurations are treated as separate line items.

### 🔐 Core Functionality
- **Local User Management**: Secure local authentication and session management using `SharedPreferences`.
- **Wishlist Management**: Personalized "Favorites" section with animated state persistence.
- **Global Tab State**: Unified navigation shell for seamless switching between Home, Cart, Favorites, and Profile.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [Provider](https://pub.dev/packages/provider) (Cart, Theme, Tab, Favorites)
- **Local Storage**: [SharedPreferences](https://pub.dev/packages/shared_preferences) (User Sessions, Authentication)
- **Typography**: [Google Fonts (Inter)](https://fonts.google.com/specimen/Inter)
- **Image Handling**: [Cached Network Image](https://pub.dev/packages/cached_network_image) for optimized performance.

## 📱 Screenshots

*Coming Soon...*

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (Stable channel)
- Dart SDK

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Qharny/FoodHub-UI-Kit.git
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```text
lib/
├── models/         # Data models (FoodItem, Topping, CartItem)
├── providers/      # Global state (Cart, Favorites, Tab, Theme)
├── screens/        # UI Layers (Home, Main Shell, Details, etc.)
├── services/       # External integrations (Local AuthService)
├── utils/          # Constants, Mock Data, and Theme configs
└── widgets/        # Reusable UI components (ShuffleBanner, FoodCard)
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Handcrafted with ❤️ using Flutter.*
