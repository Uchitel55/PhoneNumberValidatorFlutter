# Flutter: Phone Number Validator 
#### Video Demo: https://www.youtube.com/watch?v=NswQUyLI994
#### Description:
Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Andrioid, iOS, Linux, Mac, Windows, Web platform.
Flutter was released in May 2017.
Flutter uses a variety of widgets to deliver a fully functioning application. These widgets are Flutter's framework architecture.

This project is basic mobile application used for validating phone number.

**Short summary of implemented things:**
* Text field with 2 hints: phone number and helper text
* Phone number keyboard
* If length of input is greater than 0, show cancel icon and clear everything on pressed
* Pattern with parentheses, whitespace and dash using mask_text_input_formatter package
* Widgets are adapted dynamically for different screen sizes
* Logic FBA: If number entered correctly button becomes active, otherwise button is inactive
* Dynamically scaling font size (If users changed their mobile phone / device settings)
* Hide keyboard by tapping somewhere on the screen
* Onpressed button shows dialogue with value added