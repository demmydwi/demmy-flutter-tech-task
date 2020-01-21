# Home Credit Task

Build a simple application that call this API, and display the data with following UI design.

## Information

- Language : Dart
- Architecture Pattern: Provider
- UI libs : shimmer, easy_dialog, flutter_svg
- Network libs : dio
- Other libs : provider, url_launcher

## Implementation Guidelines

- When application open, show progress indicator while getting the data from API. You can use progress bar, progress dialog or custom animation.
- If data is successfully retrieved, show the data based on design above. If any error occurs, show a toast or dialog indicating there is a connection error.
- When one of the Grid item or Article is clicked, open that item link (from API) on the browser.

## Acceptance Criteria

- [x] You must set minimum Android SDK to 16
- [x] Display each section (Grid, Banner) of view in vertical order, based on API result order.
- [x] Layout must be scrollable.
- [x] Make your code as clean as possible. Don’t put unnecessary variable assignment, unused import, long method, too much comment block and etc.
- [x] Covered by Unit Test & Widget Test
- [x] Using Provider State Management

## Screenshot

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/launcher.jpeg "Launcher")

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/home_loading.jpeg "Loading")

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/home_loaded.jpeg "Loaded")

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/home_url_launcher.jpeg "URL Launcher")

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/home_no_inet.jpeg "No Internet")

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/home_error.jpeg "Error")

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/min_sdk.jpeg "Min SDK")

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/widget_test.jpeg "Widget Test Result")

![alt text](https://github.com/demmydwi/demmy-flutter-tech-task/blob/master/ss/unit_test.jpeg "Unit Test Result")




