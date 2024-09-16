# MovieApp

MovieApp is a Flutter application that allows users to browse a list of movies. The app fetches movie data from an API and provides detailed information about each movie, including its description, rating, and other relevant details. Users can also log in and save their favorite movies to a personal favorites list by clicking on a heart icon.

## Features

- **Movie List**: View a comprehensive list of movies fetched from an API.
- **Movie Details**: See detailed information about each movie, including its description, rating, and more.
- **User Authentication**: Log in to the app to access personalized features.
- **Favorites**: Save movies to a favorites list by clicking the heart icon.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/YourUsername/MovieApp.git
2. **Navigate to the project directory:**
   ```bash
   cd MovieApp
3. **Install dependencies:**
   ```bash
   flutter pub get
4. **Run the app:**
   ```bash
   flutter run

## Configuration

### API Configuration

Update the API endpoint in the `lib/services/api_service.dart` file with your movie data API URL.

### Authentication Setup

Configure your authentication provider if necessary. Ensure your login functionality is properly set up in `lib/services/auth_service.dart`.

### Database Setup

If you are using a local database to store favorites, ensure it is properly configured in `lib/services/database_service.dart`.



