# Resume Generator

A Flutter-based **Customizable Text Resume Generator** built as part of an interview assignment.

## 📌 Objective

The app allows users to view and customize a text-based resume fetched from an API. It supports dynamic customization options such as font size, font color, and background color, with configurations stored locally using **Hive**. State management is handled via **Riverpod**.

## 🚀 Features

### 🔹 Home Screen

* Fetches resume data (Name, Skills, Projects) from API:

  ```
  https://expressjs-api-resume-random.onrender.com/resume?name=insert-your-name-here
  ```
* Pre-generated text-based resume (No form, no PDF).
* Displays **current GPS latitude & longitude** on the top-right corner of the home screen.

### 🔹 Resume Customization

* **Font Size** → Adjustable using a slider.
* **Font Color** → Selectable using a color picker.
* **Background Color** → Selectable using a color picker.
* Changes reflect dynamically on the resume preview.

### 🔹 Data Persistence

* User preferences (font size, font color, background color) are stored locally using **Hive** so that customization is retained across sessions.

### 🔹 State Management

* Entire state is managed using **Riverpod** for scalability and cleaner architecture.

## 🛠️ Tech Stack

* **Flutter** – UI Framework
* **Riverpod** – State Management
* **Hive** – Local Database
* **HTTP** – API Integration
* **Geolocator** – Fetching GPS coordinates

## ⚡ Installation

```bash
# Clone the repo
git clone https://github.com/your-username/resume_generator.git

# Navigate to project
cd resume_generator

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 👨‍💻 About Me

* My name is **Harsh**, a passionate **Flutter & Full-Stack Developer**.
* Skilled in **Flutter, Dart, Firebase, and modern web technologies**.
* Currently pursuing **B.E. in Information Technology (7th Semester)** at *Shree Swaminarayan Institute of Technology*.
* Strong interest in **building scalable apps and real-world problem-solving**.
* Always eager to **learn, innovate, and create solutions** that don’t yet exist in the world.
* Aspiring **entrepreneur**, aiming to build impactful products for society.
* 📧 Email: **[patel.harsh.pankajkumar@gmail.com](mailto:patel.harsh.pankajkumar@gmail.com)**

---
