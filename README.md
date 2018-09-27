# BottomPopup

**BottomPopup provides a popup-like presentation style to any view controller**

## What does BottomPopup do?
It is a custom presentation style for view controllers to present any view controller with slide animation from bottom of the screen.

## How it is look like ?
Actually depends on your view controller, a real world example can be seen below;

![](https://media.giphy.com/media/9VvrEZ4McyF9cWgCtJ/giphy.gif)

## How is it set up?

**Using CocoaPods (Recommended)**

Add below line to your Podfile;

```
pod 'BottomPopup'
```

Then you can install it with pod install command.

**Manual**

Download the project, just drag and drop classes under **BottomPopupController** file to your project.

## How is it used?

After install, simply make your view controller subclass of **BottomPopupViewController.** Congratulations, your view controller is ready to show 🎉  

Then you can present your view controller with native **presentViewController:animated:completion:** method, bottom popup controller will handle rest.

## Customization

Bottom popup comes with couple of customizable properties. Since your view controller subclass of BottomPopupViewController now, **you can override following methods in your view controller** to change behaviour;

* _shouldPopupDismissInteractivelty() -> Bool_
  Determines your popup should dismiss whether interactivelty or not. If it is set to yes, user can dismiss popup with pulling down it down. Default is YES
* _getPopupHeight() -> CGFloat_
  Height value. Default is 377 pt. For example you can return UIScreen.main.bounds.size.height to give it full screen height.
* _getPopupTopCornerRadius() -> CGFloat_
  Corner radius of popup. Default is 10pt
* _getPopupPresentDuration() -> Double_
   Present animation duration. Default is 0.5 sec
* _getPopupDismissDuration() -> Double_
   Dismiss animation duration. Default is 0.5 sec

   You can see how changing of these properties changes popup's behaviour below;
   (Gifs are extracted from example project)
    
    ![](https://media.giphy.com/media/MRWZQ2PUS0NSeCytPx/giphy.gif) | ![](https://media.giphy.com/media/3bzmRH74e9wL6XKNnG/giphy.gif)

 ## Questions or Advices
 Just send me an email (ergunemr@gmail.com)