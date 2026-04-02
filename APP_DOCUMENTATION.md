# 🥂 FoodShop UI - Technical Documentation

A high-performance, premium Flutter application designed for a modern food and grocery shopping experience. This document provides an overview of the application's architecture, key features, and visual assets.

---

## 📽️ App Walkthrough

Experience the fluid animations and premium UI in action:

![App Video Walkthrough](assets/shots/App%20video.mp4)

---

## 🎨 Visual Assets & Screens

### 🔐 Authentication Flow
The app features a secure, local-only authentication system. User sessions are persisted using `SharedPreferences`.

| Sign Up | Login |
| :---: | :---: |
| ![Sign up](assets/shots/Sign%20up.jpg) | ![Login](assets/shots/Login.jpg) |

### 🏠 Discovery Experience
The home screen is optimized for lightning-fast scrolling and immediate response.

![Homescreen](assets/shots/Homescreen.jpg)

**Key Features:**
- **Dynamic Greeting**: Personalized time-based greetings (Good Morning, Afternoon, Evening).
- **Shuffle Banner**: An interactive 3D-tilt promotion carousel.
- **Categorized Discovery**: Quick-filter items by Burger, Pizza, etc.

### 🍔 Marketplace & Recommendation
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

## 🛠️ Technical Architecture

### 🚀 Core Technologies
- **Framework**: [Flutter](https://flutter.dev) (v3.22+)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Local Storage**: [SharedPreferences](https://pub.dev/packages/shared_preferences)
- **Image Handling**: [Cached Network Image](https://pub.dev/packages/cached_network_image)
- **Typography**: [Google Fonts (Inter)](https://fonts.google.com/specimen/Inter)

### 📈 Performance Optimizations
The app has been specifically tuned for low-end devices and smooth interactions:
- **Lazy Loading**: Screens are instantiated only when first visited to reduce startup lag.
- **Memory Caching**: Images are automatically resized in memory based on their display dimensions.
- **Micro-Builds**: Complex widgets are isolated into separate classes to prevent full-screen rebuilds.
- **Sliver Architecture**: The home screen uses a `CustomScrollView` for efficient layout management.

---

## 📂 Project Structure

```text
lib/
├── models/         # Data structures (FoodItem, Topping, LocalUser)
├── providers/      # Application state (Cart, Favorites, Tab, Theme)
├── screens/        # UI Layers (Home, Main Shell, Details, Profile)
├── services/       # Logic (AuthService, Persistence)
├── utils/          # Formatting, Colors, and Mock Data
└── widgets/        # Component Library (AppImage, FoodCard, Banner)
```

---

*Handcrafted with ❤️ using Flutter.*
