# ContrastLens
Accessibility tool for display contrast adjustment

ContrastLens is designed to control the effective brightness and/or contrast of a movable, resizable screen area, and can be refreshed with a keypress or at an automatic interval.

## Who might need this?
Magnifiers are fairly common visual accessibility tools. However, they do not address reduction in contrast sensitivity or increased light sensitivity that can accompany cataracts or retinal diseases like macular degeneration, retinitis pigmentosa, or diabetic retinopathy.

Some magnification tools, such as Windows 10's, do include an "invert colors" mode, which is useful for tasks like navigating applications without a dark mode (PSA to developers: lacking or paywalling a dark mode is an accessibility issue), but inverting all colors distorts the image significantly and is undesirable for viewing photos, artwork, etc where often only a small boost in contrast is necessary.

## Usage
ContrastLens currently has two modes. You may switch between them by pressing the mode switch hotkey. In any mode, you can resize and move the window, change the brightness and contrast amounts, and switch between the contrast-adjustment and color-inversion filter.

###Capture mode
Captures an area of the screen and applies adjustment. The image will not be refreshed until you press the refresh hotkey again to recapture the area under the window.

###Live mode
Automatically captures the area under the window. To do this, ContrastLens must periodically sample beneath the window, causing a slight flicker. You can control this with the decrease/increase interval hotkeys. Lower intervals will refresh more quickly, but higher intervals will flicker less.

### Mirror mode (planned)
Mirror mode allows one part of the screen to mirror the other at full speed, whether on the same display or a different display, with the contrast effect applied. Mirror mode works best with multiple displays, but is also dockable.

##Hotkeys
These only work with ContrastLens focused.

###General

* ESCAPE: Exit ContrastLens
* ARROW KEYS:  Move the window
* SHIFT AND ARROW KEYS: Resize the window
* M: Change between "capture" and "live" mode
* F: Toggle Finder (draws an X pattern in case you lose the window)
* I: Toggles the color-inversion filter

###Adjustment

* SHIFT AND MINUS/PLUS KEYS: Decrease/increase brightness
* SHIFT AND BACKSPACE: Reset brightness
* CTRL AND MINUS/PLUS KEYS: Decrease/increase contrast
* CTRL AND BACKSPACE: Reset contrast

###Mode-specific behaviors

 * ENTER: Refresh (in capture mode)
 * Q: Decrease refresh interval (in live mode)
 * E: Increase refresh interval (in live mode)
    
## Dependencies
Standalone releases are fully functional, but this project requires the following extensions to compile, which are not included in the reipository:

* https://yellowafterlife.itch.io/gamemaker-display-screenshot
* https://yellowafterlife.itch.io/gamemaker-window-commands
