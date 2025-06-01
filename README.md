# Student CRUD App (Flutter)

This is a simple Flutter application for managing student data using CRUD operations with mock APIs.

## ✅ Features
- View list of students
- Add new student
- Edit existing student
- Delete student
- Clean UI with Material Design
- State Management using `Provider`
- API Integration using `http`
- Structured folder layout

## 🏗️ Project Structure

```
lib/
├── main.dart
├── models/
│   └── student.dart
├── providers/
│   └── student_provider.dart
├── services/
│   └── api_service.dart
├── screens/
│   ├── student_list_screen.dart
│   └── student_form_screen.dart
```

## ⚙️ State Management
Used `Provider` package for managing student data and notifying UI on changes.

## 📡 API
Used Mock API running via [Mockoon](https://mockoon.com/) on `http://localhost:3001/students`.

## 📦 Packages Used
- `provider`
- `http`

## 🚀 Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Start mock API server:
   ```bash
   mockoon-cli start --data ./trial.json --port 3001
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## ✍️ Author
Shlok (Internship submission for Getfly Technologies)
