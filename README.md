# 💬 ChitChat – Flutter Multi-Module App

[📥 Download APK](https://github.com/abduleneye/chit_chat/releases/download/v1.0/app-release.apk)  

**ChitChat** is a multi-module **Flutter application** featuring a **real-time chat system** and an **API-ready VTU (Virtual Top-Up) module**.  
Built with **BLoC state management** and a **modular architecture** for scalable, maintainable mobile development.

---

## 🚀 **Overview**

ChitChat brings together seamless messaging and digital utility services under one unified app.  
It provides a **real-time communication experience** and an **extendable VTU system** structured for quick backend integration.

---

## 🧩 **Modules**

### 💬 **Chat Module**
- Real-time messaging with dynamic message rendering, timestamps, and avatars  
- Fully integrated with **Firebase** for authentication, messaging, and data storage  
- **Supabase** used for storing and serving profile pictures  
- Clear separation of UI, business logic, and data layers  
- State managed with **BLoC** for predictable and testable event–state transitions  
- Modular and scalable architecture suitable for production deployment

### ⚡ **VTU Module**
- Airtime and data purchase flows  
- Validation and transaction status management  
- API-ready repository structure for backend integration  
- State handled via **BLoC** for clean loading, success, and error handling  
- Designed for scalability and easy extension

---

## 🎨 **Design**

### Chat Module Screenshots
<img src="https://github.com/abduleneye/chit_chat/blob/master/assets/signup.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/login.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/users.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/Screenshot_2025-11-13-03-28-27-61_dcc0cdc607e3a1f4a8680cd89ec50966.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/mod.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/security.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/drawer.jpg" width="150"/>

<br>

### VTU Module Screenshots
<img src="https://github.com/abduleneye/chit_chat/blob/master/assets/db.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/airtime.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/data.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/bet.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/util.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/ref.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/profile.jpg" width="150"/>

---

## ⚙️ **Installation / Download**

You can either **run the app from source** or **download the APK** directly.

### 1️⃣ Run from Source
```bash
# Clone the repository
git clone https://github.com/abduleneye/chit_chat.git

# Navigate into the project folder
cd chit_chat

# Install dependencies
flutter pub get

# Run the app on an emulator or physical device
flutter run
