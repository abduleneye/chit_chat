# 💬 **ChitChat**

**ChitChat** is a modern multi-module Flutter application that integrates a full-featured **chat system** with an **API-ready VTU (Virtual Top-Up)** module.  
It’s built with a **scalable modular architecture** and **BLoC state management**, ensuring predictable state flow, maintainability, and production-level stability.

---

## 🚀 **Overview**

ChitChat brings together seamless messaging and digital utility services under one unified app.  
It provides a **real-time communication experience** and an **extendable VTU system** structured for quick backend integration.

Each module operates independently within the same Flutter project, allowing for feature isolation, modular updates, and scalable development.

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
- Airtime and data purchase flow  
- Validation and transaction status management  
- API-ready repository structure  
- Uses **BLoC** for handling loading, success, and error states  

---

## 🧱 **Architecture**

- **Framework:** Flutter  
- **Language:** Dart  
- **State Management:** **BLoC (Business Logic Component)**  
- **Architecture Pattern:** Feature-based Modular Architecture  
- **Dependency Management:** Flutter Pub  
- **Version Control:** Git & GitHub  

---

## 🔁 **Why BLoC**

ChitChat adopts **BLoC** as its central state management solution for:
- **Predictable behavior** — each action leads to a defined state  
- **Scalability** — easy to extend or maintain multiple modules  
- **Separation of concerns** — UI and business logic are fully decoupled  
- **Reusability** — same logic can serve different UI components  
- **Testability** — simplifies unit and widget testing  

---
## 🎨 **Design**

### Chat Module Screenshots
<img src="https://github.com/abduleneye/chit_chat/blob/master/assets/signup.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/login.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/users.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/Screenshot_2025-11-13-03-28-27-61_dcc0cdc607e3a1f4a8680cd89ec50966.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/mod.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/security.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/drawer.jpg" width="150"/>

<br>

### VTU Module Screenshots
<img src="https://github.com/abduleneye/chit_chat/blob/master/assets/db.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/airtime.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/data.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/bet.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/util.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/ref.jpg" width="150"/> <img src="https://github.com/abduleneye/chit_chat/blob/master/assets/profile.jpg" width="150"/>


## ⚙️ **Installation**

git clone https://github.com/abduleneye/chit_chat.git
cd chit_chat
flutter pub get
flutter run
