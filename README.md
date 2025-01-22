# 🌟 News Reader App - Swift

Welcome to the **News Reader App**, a sleek and stylish SwiftUI application that brings the latest news articles right to your fingertips. Crafted with the elegance of **CLEAN Architecture**, this app promises a modular, scalable, and maintainable experience. Leveraging the power of **NewsAPI**, it delivers the freshest articles in a visually appealing and user-friendly interface.

---

## 🚀 Features

- **📰 Top Headlines**: Stay updated with the latest articles across categories like business, entertainment, and technology.
- **⚠️ Error Handling**: Smoothly manages network errors, providing intuitive and friendly error messages.
- **🎨 Clean Design**: Built with SwiftUI for a modern, responsive, and visually stunning user interface.
- **🔀 Multiple Tabs**: Seamlessly navigate through articles and other sections like Settings with intuitive tabs.
- **⏳ Loading Indicators**: Enjoy a smooth experience with loading spinners while data is being fetched.
- **🛠️ CLEAN Architecture**: Organizes the app into **Data**, **Domain**, and **Presentation** layers for optimal structure and maintainability.

---

## 🏗️ Architecture Overview

This app embraces the **CLEAN Architecture** principles, elegantly structured into three main folders:

### 1. **Data Layer**
The **Data** layer is the powerhouse for data fetching and processing. It communicates with external APIs and delivers data to the domain layer.

- **ArticleRepository**: Orchestrates the interaction with NewsAPI to fetch articles, handling network requests and data parsing with finesse.

### 2. **Domain Layer**
The **Domain** layer is the brain of the application, housing the core business logic. It defines use cases and collaborates with the data layer to fetch and manipulate data.

- **FetchArticlesUseCase**: Masterfully handles the logic for fetching articles from the repository and performing necessary data transformations.

### 3. **Presentation Layer**
The **Presentation** layer is the face of the app, where UI components shine. It displays data to the user and responds to interactions with grace.

- **ContentView**: The heart of the app, showcasing a list of articles or displaying loading indicators and error messages.
- **ContentViewModel**: Bridges the View and Use Case, managing the app’s state, executing actions like fetching articles, and updating the view seamlessly.

---

## 🔍 How It Works

1. **Fetching Articles**:
    - The app communicates with **NewsAPI** through the `ArticleRepository` to fetch the latest articles.
    - The `FetchArticlesUseCase` processes the data, delivering the final output to the `ContentViewModel`.
    - The `ContentViewModel` updates the view with the fetched articles or gracefully handles any errors.

2. **Error Handling**:
    - In the event of network or data-related errors, the app displays a friendly error message, ensuring a smooth user experience.

3. **User Interface**:
    - The **ContentView** presents articles in a sleek **List**, detailing information like title, author, description, and publication date.
    - The app employs a **TabView** for effortless navigation between sections like articles and settings.

---

## 🌐 API Used

The app utilizes the **NewsAPI** to fetch articles. Discover more about the API [here](https://newsapi.org/).

**API URL:**

```
https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=YOUR_API_KEY
```

Be sure to replace `YOUR_API_KEY` with your own API key from NewsAPI.

---

## Code Structure

### **Data Layer**
- **ArticleRepository.swift**: Handles data fetching from NewsAPI and decoding JSON responses.
- **Models.swift**: Contains the `NewsAPIResponse`, `Article`, and `Source` models used to parse the 
response data.

### **Domain Layer**
- **FetchArticlesUseCase.swift**: Defines the core business logic for fetching articles from the 
repository.

### **Presentation Layer**
- **ContentView.swift**: The main view that displays the list of articles.
- **ContentViewModel.swift**: Handles the app’s state and interacts with the use case to fetch data.
- **TabView**: Used to switch between the articles tab and other sections like settings.

---

## How to Clone and Run the Project

### Prerequisites

Before running the app, make sure you have the following installed:

- **Xcode** (latest version)
- **Git** (for cloning the repository)

### Steps to Clone and Run the App

1. **Clone the Repository**:
   Open your terminal and run the following command to clone the repository:
   
   ```bash
   git clone https://github.com/pseudononameous/news-reader-app.git
   ```

2. **Open the Project**:
   Navigate into the project folder:
   
   ```bash
   cd news-reader-app
   ```
   
   Open the project in Xcode by running:
   
   ```bash
   open NewsReaderApp.xcodeproj
   ```
   
3. **Replace the API Key**:
   Open the `FetchArticlesUseCase.swift` file and replace the placeholder `YOUR_API_KEY` with your 
   own **NewsAPI** key.

4. **Build and Run**:
   Select a simulator or connect your device, then click the **Run** button in Xcode to build and 
   run the app.

---

## Benefits of Using CLEAN Architecture

By organizing the app into **Data**, **Domain**, and **Presentation** layers, we gain several 
advantages:

- **Separation of Concerns**: Each layer has its own responsibility, making the app easier to 
understand and maintain.
- **Testability**: Each layer can be tested independently, ensuring that all parts of the app are 
covered by tests.
- **Scalability**: Adding new features is easier since we can extend each layer without affecting 
the others.
- **Maintainability**: The modular structure makes it easier to fix bugs, make improvements, and 
handle new requirements.

---

## Future Enhancements

- **Search Functionality**: Allow users to search for specific articles.
- **Category Filter**: Filter articles based on categories like Technology, Sports, etc.
- **User Authentication**: Implement login functionality and personalized news feeds.
- **Bookmark Articles**: Let users save their favorite articles for later.
