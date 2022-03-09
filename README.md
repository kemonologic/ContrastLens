# ContrastLens
Accessibility tool for display contrast adjustment

## What is this for?
Existing accessibility tools are often focused on magnifying the screen. However, this is insufficient for those with vision issues such as cataracts that reduce apparent contrast. Some tools include an "invert colors" mode, which is useful for e.g. dialog prompts for applications without dark mode, but distorts the image significantly and is therefore undesirable for viewing photos, artwork, etc. ContrastLens is designed to increase the effective brightness and/or contrast of a repositionable screen area.

## Modes
### Capture mode
Capture mode allows for static contrast adjustment on a keypress. This mode can be used in a window or fullscreen.

### Live mode
Live mode allows previewing the area underneath the window live. However, due to the difficulties inherent in capturing the area underneath the window while also displaying it to the user, it is relatively slow and probably not suitable for fast content like video, and requires active focus (so the area under the window is potentially non-interactable).

### Mirror mode
Mirror mode allows one part of the screen to mirror the other, whether on the same display or a different display, with the contrast effect applied. Mirror mode works best with multiple displays, but is also dockable.

## Dependencies
This project requires the following extensions to be included to compile, which are not included:
https://yellowafterlife.itch.io/gamemaker-display-screenshot
https://yellowafterlife.itch.io/window-freeze-fix
