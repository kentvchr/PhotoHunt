![PhotoHuntHeader](https://github.com/user-attachments/assets/aee3aa62-89fd-4cfd-96f4-9eac2ee00779)


# # PhotoHunt App

**PhotoHunt** is an iOS application that allows users to explore and search for high-quality photos using the Unsplash API. 

> **Note**: iOS 18 is required to run this application.

---

## Features

### Browse Latest Unsplash Photos
- The home screen displays the latest photos from Unsplash.
- Each photo thumbnail is optimized to load quickly, providing a smooth and responsive browsing experience.

### Search Photos
- The app features a search bar allowing users to look up photos based on keywords.
  
### View Photo Details
- Tapping on a photo thumbnail opens the photo’s detailed view.
- The detailed view displays information about the photo, such as the photographer's name and camera details (e.g., aperture, focal length, and ISO).

### View High-Resolution Photos
- Users can expand photos to view them in high resolution.
- In this mode, the photo occupies the entire screen, hiding additional information to allow a distraction-free viewing experience.
- Users can easily exit high-resolution mode with a swipe-down gesture.

---

## Project Management

To facilitate efficient development, the project was divided into distinct tasks, each assigned a time estimate and responsible party. Here’s an overview of the main project tasks:

| Id    | **Task**                                    | **Time** | **Responsible** |
| ----- | ------------------------------------------- | -------- | --------------- |
| HUN_1 | Set up Unsplash API and test data fetch     | 2 hours  | Me              |
| HUN_2 | Set up repository / interactor architecture | 2 hours  | Me              |
| HUN_3 | Create ImageThumbnail view                  | 1 hour   | Me              |
| HUN_4 | Create PhotosScrollView                     | 2 hours  | Me              |
| HUN_5 | Implement SearchBar                         | 2 hours  | Me              |
| HUN_6 | Create PhotoDetailsScreen                   | 4 hours  | Me              |
| HUN_7 | Error handling                              | TO DO    |                 |
| HUN_8 | Localization support                        | TO DO    |                 |
| HUN_9 | Test ViewModels                             | TO DO    |                 |

---

### Future Improvements

- **Error Handling**: Implement comprehensive error handling for smoother user experience in case of network or API errors.
- **Localization**: Add support for multiple languages to enhance accessibility for international users.
- **ViewModel Testing**: Complete testing of the app’s ViewModel to ensure reliability and robustness.

---

## Requirements

- **iOS**: 18.0 or later
- **API Access**: Unsplash API Access Key (set up in project configuration)

---

## Setup

1. **Clone the repository** and open it in Xcode.
3. **Run the app**: Build and run the app on an iOS 18 simulator or compatible device.

---

**PhotoHunt** provides a clean, minimalistic user interface and a seamless user experience for exploring Unsplash photos. Enjoy the ease of browsing beautiful photography at your fingertips!
