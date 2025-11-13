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
- Dynamic message rendering with timestamps and avatars  
- Structured for Firebase or WebSocket real-time updates  
- Clear separation of UI, business logic, and data  
- State handled through **BLoC** for clean event–state transitions  

---

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
<img src="https://github.com/abduleneye/chit_chat/blob/master/assets/login.jpg" width="220"/>  
<img src="https://github.com/abduleneye/chit_chat/blob/master/assets/users.jpg" width="220"/>  
<img src="https://github.com/abduleneye/chit_chat/assets/chat_3.jpg" width="220"/>  

### VTU Module Screenshots
<img src="https://github.com/abduleneye/chit_chat/assets/vtu_1.jpg" width="220"/>  
<img src="https://github.com/abduleneye/chit_chat/assets/vtu_2.jpg" width="220"/>  
<img src="https://github.com/abduleneye/chit_chat/assets/vtu_3.jpg" width="220"/>  

### Additional Screenshots
<img src="https://github.com/abduleneye/chit_chat/assets/other_1.jpg" width="220"/>  
<img src="https://github.com/abduleneye/chit_chat/assets/other_2.jpg" width="220"/>  
<img src="https://github.com/abduleneye/chit_chat/assets/other_3.jpg" width="220"/>  
<img src="https://github.com/abduleneye/chit_chat/assets/other_4.jpg" width="220"/>
## ⚙️ **Installation**

git clone https://github.com/abduleneye/chit_chat.git
cd chit_chat
flutter pub get
flutter run
