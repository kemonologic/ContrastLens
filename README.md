# ContrastLens
Accessibility tool for display contrast adjustment

## What is this for?
Existing accessibility tools are often focused on magnifying the screen. However, this is insufficient for those with vision issues that reduce apparent contrast. Some tools such as Windows 10's magnifier include an "invert colors" mode, which is useful for e.g. navigating applications without a dark mode, but distorts the image significantly and is therefore undesirable for viewing photos, artwork, etc. ContrastLens is designed to increase the effective brightness and/or contrast of a repositionable screen area.

## Modes
### Capture mode
Capture mode allows for static contrast adjustment under the window area, updated whenever a key is pressed. This mode is intended for viewing static images in a window, but can be used in fullscreen as well.

### Live mode
Live mode allows previewing the area underneath the window live, with contrast adjustment applied. However, due to the difficulties inherent in capturing the area underneath the window while also displaying it to the user, it is relatively slow, may flash distractingly depending on settings, and probably not suitable for fast content like video. It also requires active focus, so the area under the window is potentially non-interactable.

### Mirror mode
Mirror mode allows one part of the screen to mirror the other at full speed, whether on the same display or a different display, with the contrast effect applied. Mirror mode works best with multiple displays, but is also dockable.

## Dependencies
Standalone releases are fully functional, but this project requires the following extensions to compile, which are not included in the reipository:

* https://yellowafterlife.itch.io/gamemaker-display-screenshot
* https://yellowafterlife.itch.io/gamemaker-window-commands
