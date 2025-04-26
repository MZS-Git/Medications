# 📱 iOS Take Home Project

## 📋 Project Overview
This project demonstrates an iOS application that performs data fetching, displaying, and basic CRUD operations using the Realm database. It focuses on:
- MVVM architecture with Dependency Injection
- Repositories

https://github.com/user-attachments/assets/36b27d89-e2e6-4369-a1c2-0e5eca5fdeef


- Responsiveness with Combine
- Realm local storage
- Firebase Authentication

## ✅ Requirements Covered
- **Fetch** medications from a local Realm database by implementing the Repository Pattern
- **Display** medication data in a list (`UITableView`)
- **CRUD operations**:
  - **Create**: Add new medication
  - **Read**: Fetch and display all medications
  - **Delete**: Remove a medication
- **Error handling** during database operations
- **Real-time UI updates** using `@Published` properties and Combine framework
- **Unit Testing** for Repo and View Model
- **Navigation** using Coordinater
- **MVVM Artitechure** with Dependency Injection


## 🎯 Bonuses Covered
### Loader Animation
- Show animated loader on API call for a smooth user experience
### Warning Toast
- Design `Warning Toast` to notify a user about the error during authentication

## 🛠 Technical Specifications
| Specification          | Details               |
|------------------------|-----------------------|
| Swift Version          | 5.0                   |
| iOS Deployment Target  | 16.0+                 |
| Database               | Realm                 |
| Reactive Framework     | Combine               |

## 🚀 Possible Improvements
_(If given more time)_

### Functional
- Implement custom error types for detailed error handling
- Add search functionality and pagination
- Include edit/update functionality

### UI/UX
- Animations for smoother transitions
- Custom UI

### Testing
- Improved test coverage
- XCTest/UI Testing framework integration

### Architecture
- Protocol-oriented DI for better testability
