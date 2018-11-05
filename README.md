# BottomPopup

**BottomPopup provides a popup-like presentation style to any view controller**

![](https://img.shields.io/badge/version-0.4.1-blue.svg)
![](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![](https://img.shields.io/badge/Contact-ergunemr%40gmail.com-yellowgreen.svg)

## What does BottomPopup do?
It is a custom presentation style for view controllers to present any view controller with slide animation from bottom of the screen.

## What does it look like ?
Actually depends on your view controller, a real world examples can be seen below;

![](https://media.giphy.com/media/Cjtdn4GdOy4F80voe0/giphy.gif) | ![](https://media.giphy.com/media/58FNuaDbPyyc8IdRtB/giphy.gif)

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

After install, simply make your view controller subclass of **BottomPopupViewController.**  

For navigation controllers, it works exactly in same way, make your navigation controller subclass of **BottomPopupNavigationController.**

Congratulations, your view controller is ready to show 🎉

Then you can present your controller with native **presentViewController:animated:completion:** method, bottom popup controller will handle rest.

## Customization

Bottom popup comes with couple of customizable properties. Since your view controller subclass of BottomPopupViewController now, **you can override following methods in your view controller** to change behaviour;

* **_shouldPopupDismissInteractivelty() -> Bool_**
  
  Determines your popup should dismiss whether interactively or not. If it is set to yes, user can dismiss popup with pulling down it down. Default is YES
* **_getPopupHeight() -> CGFloat_**
  
  Height value. Default is 377 pt. For example you can return UIScreen.main.bounds.size.height to give it full screen height.
* **_getPopupTopCornerRadius() -> CGFloat_**
  
  Corner radius of popup. Default is 10pt
* **_getPopupPresentDuration() -> Double_**
   
   Present animation duration. Default is 0.5 sec
* **_getPopupDismissDuration() -> Double_**
   
   Dismiss animation duration. Default is 0.5 sec

* **_getDimmingViewAlpha() -> CGFloat_**
   
   Target alpha value of the black-colored dimming view after present animation. Default is 0.5
   
   You can see how changing of these properties changes popup's behaviour below.
   (Gifs are extracted from example project)
    
    UIViewController  | UINavigationController
    --- | ---
    ![](https://media.giphy.com/media/kSbDw36fJUmbDnbcoj/giphy.gif) | ![](https://media.giphy.com/media/kEEduYnDbfS9eC9pXF/giphy.gif)

## Delegate

If you want to track popup lifecycle or current dismiss interaction percent, you can set popupDelegate;

```
popupVC.popupDelegate = self
```

Methods;
```
func bottomPopupViewLoaded()
func bottomPopupWillAppear()
func bottomPopupDidAppear()
func bottomPopupWillDismiss()
func bottomPopupDidDismiss()
func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat)
```

 ## Questions or Advices
 Just send me an email (ergunemr@gmail.com)