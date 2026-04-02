# 🥂 FoodShop UI — Premium Food & Grocery Experience

[![Flutter](https://img.shields.io/badge/Flutter-v3.22+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Provider](https://img.shields.io/badge/Provider-v6.1.1-6BA539?logo=flutter&logoColor=white)](https://pub.dev/packages/provider)
[![Storage](https://img.shields.io/badge/Storage-SharedPreferences-0175C2?logo=dart&logoColor=white)](https://pub.dev/packages/shared_preferences)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A high-fidelity, premium Flutter application designed for a seamless food and grocery shopping experience. Built with a focus on modern aesthetics, fluid animations, and robust functionality — all powered by local storage for a zero-backend configuration.

---

## 📽️ App Walkthrough

Experience the fluid animations and premium UI in action:

![App Video Walkthrough](assets/shots/App%20video.mp4)

---

## ✨ Features

### 🎨 Visual Excellence
- **Deeply Immersive Dark Mode** — Full system-aware dark theme support with curated surface and background color tokens.
- **Interactive Shuffle Banner** — A custom 3D card shuffle interaction for featured promotions, replacing traditional carousels with elastic physics and parallax effects.
- **Micro-interactions** — Subtle bounce animations, hover effects, and spring-based transitions for a premium tactile feel.
- **Dynamic Greeting** — Personalized time-based greetings (Good Morning, Afternoon, Evening).

### 🍔 Advanced Ordering
- **Complex Customization** — Support for multi-select toppings (checkboxes) and exclusive choices (radio buttons) with real-time price calculation.
- **Special Instructions** — Direct-to-kitchen notes for highly personalized orders.
- **Smart Cart System** — Intelligent grouping of items based on customization; unique configurations are treated as separate line items.

### 🔐 Core Functionality
- **Local User Management** — Secure local authentication and session management using `SharedPreferences`.
- **Wishlist Management** — Personalized "Favorites" section with animated state persistence.
- **Global Tab State** — Unified navigation shell for seamless switching between Home, Cart, Favorites, and Profile.
- **Categorized Discovery** — Quick-filter items by category (Burger, Pizza, and more).

---

## 🎨 Visual Assets & Screens

### 🔐 Authentication Flow
The app features a secure, local-only authentication system. User sessions are persisted using `SharedPreferences`.

| Sign Up | Login |
| :---: | :---: |
| ![Sign up](assets/shots/Sign%20up.jpg) | ![Login](assets/shots/Login.jpg) |

### 🏠 Discovery Experience
The home screen is optimized for lightning-fast scrolling and immediate response, built on a `CustomScrollView` with Sliver architecture.

![Homescreen](assets/shots/Homescreen.jpg)

### 🍔 Marketplace & Recommendations
Explore stores and find curated food recommendations.

| Stores | Recommendations |
| :---: | :---: |
| ![Store](assets/shots/Store.jpg) | ![Recommendations](assets/shots/Recommendations%20.jpg) |

### 🛒 Shopping Experience
A seamless cart and navigation experience.

| Cart | Navigation Bar |
| :---: | :---: |
| ![Cart](assets/shots/Cart.jpg) | ![Navbar](assets/shots/Navbar.jpg) |

---

## 🛠️ Tech Stack

| Layer | Technology |
| --- | --- |
| **Framework** | [Flutter](https://flutter.dev) (v3.22+) |
| **State Management** | [Provider](https://pub.dev/packages/provider) — Cart, Theme, Tab, Favorites |
| **Local Storage** | [SharedPreferences](https://pub.dev/packages/shared_preferences) — Sessions & Auth |
| **Image Handling** | [Cached Network Image](https://pub.dev/packages/cached_network_image) |
| **Typography** | [Google Fonts — Inter](https://fonts.google.com/specimen/Inter) |

### 📈 Performance Optimizations
Specifically tuned for low-end devices and smooth interactions:
- **Lazy Loading** — Screens are instantiated only when first visited to reduce startup lag.
- **Memory Caching** — Images are automatically resized in memory based on their display dimensions.
- **Micro-Builds** — Complex widgets are isolated into separate classes to prevent full-screen rebuilds.
- **Sliver Architecture** — The home screen uses a `CustomScrollView` for efficient layout management.

---

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

---

## 📂 Project Structure

```text
lib/
├── models/         # Data structures (FoodItem, Topping, CartItem, LocalUser)
├── providers/      # Application state (Cart, Favorites, Tab, Theme)
├── screens/        # UI Layers (Home, Main Shell, Details, Profile)
├── services/       # Logic (AuthService, Persistence)
├── utils/          # Formatting, Colors, Constants, and Mock Data
└── widgets/        # Component Library (AppImage, FoodCard, ShuffleBanner)
```

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

*Handcrafted with ❤️ using Flutter.*