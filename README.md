
# **Login and Signup Screens in SwiftUI (MVVM)**

This project demonstrates the implementation of login and signup screens in SwiftUI following the **Model-View-ViewModel (MVVM)** design pattern. The app includes smooth animations, transitions, and a visually appealing user interface with rounded corners and proper spacing.

### **Features:**
- **Clean UI Structure**: Uses SwiftUI to build the login and signup views.
- **State Management**: Employs `ObservableObject` in the ViewModel for state management.
- **Animations and Transitions**: Smooth transitions and animations for a responsive and enjoyable user experience.
- **Visually Appealing UI**: Rounded corners, consistent spacing, and modern design.
- **Social Media Login Links**: Includes Google, Facebook, and Apple icons with custom links for external login actions.

---

## **App Architecture**

### **MVVM (Model-View-ViewModel)**

The app uses the **MVVM** design pattern for clean separation of concerns:

- **Model**: Represents the user data (e.g., name, email, password).
- **ViewModel**: Handles the logic for user authentication (e.g., validating the user inputs, managing user state).
- **View**: Displays the UI and allows interaction (e.g., the login and signup forms).

---

## **Features in Detail**

### **Login and Signup Views**

- **Signup Page**: 
  - Input fields for full name, email, password, and confirm password.
  - A "Sign Up" button to trigger the signup process.
  - Google, Facebook, and Apple icons for external login options.
  
- **Login Page**:
  - Input fields for email and password.
  - A "Forgot Password?" link for password recovery.
  - Buttons for Google, Facebook, and Apple login.

### **Animations and Transitions**

- **Smooth Animations**: 
  - Text fields and buttons animate with smooth transitions when appearing or disappearing.
  - When switching between views (login or signup), transitions are applied for a seamless experience.
  
- **Interactive UI Elements**:
  - Password visibility toggle: The password field can switch between secure and normal text input.
  - Input validation feedback: Visual indicators show whether the email or password entered is valid.

---

## **Social Media Login Integration**

The project allows users to log in using social media platforms like **Google**, **Facebook**, and **Apple** by tapping on their respective icons.

- **Google**: Redirects users to the Google login page.
- **Facebook**: Redirects users to the Facebook login page.
- **Apple**: Redirects users to the Apple login page.

These links can be configured to open a custom URL when the user taps on the social media icons.

---

## **Custom Links for Social Login**

For each social media button, we create custom links using SwiftUI's `Link` component, which opens external websites when the user taps on them. This can be customized to integrate with social login SDKs if needed.

---

## **Styling and User Interface**

- **Rounded Corners**: All input fields and buttons have rounded corners to create a smooth, modern appearance.
- **Spacing**: Adequate spacing is used between UI elements to ensure the interface is clean and not cluttered.
- **Color Scheme**: The app uses a consistent color palette with primary and secondary colors for buttons and text.

---

## **Bonus Features**

- **Animations**: In addition to the basic UI functionality, the app implements smooth transitions between views, such as fading and scaling animations for text fields and buttons.
  
- **Social Media Links**: A feature to add custom links for Google, Facebook, and Apple icons, directing users to external websites or integrating with their respective APIs.

---

## **Conclusion**

This project provides a simple and modern approach to creating login and signup screens with animations and social login integration. By using the MVVM design pattern, the app is structured for maintainability, and it ensures that the code is clean and scalable. The UI is designed to be intuitive and responsive, with smooth transitions for a better user experience.

---

