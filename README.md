# Bullseye Application
## Overview
This is an example application to demonstrate creation of a simple game written completely in Swift using SwiftUI. Slide the slider along its track to approximate the random target value. Get bonus points for being on target or within 2 points of the target value. The game keeps track of the current score and the number of rounds played.  There’s  also a simplified leaderboard feature.

## Interesting Tidbit
SwiftUI 2.0 does not allow the styling of the thumb image of the Slider. This app demonstrates how to call into UIKit to use a UISlider to customize the control.

## Good Engineering
The source code contains XCTests to test the game engine behavior.

## Works on
Works on iPhone, iPad touch, and iPad running iOS/iPadOS 14 or higher. Supports portrait or landscape orientation.

## Screenshots
### Main app screen
![](README/Simulator%20Screen%20Shot%20-%20iPod%20touch%20(7th%20generation)%20-%202021-01-31%20at%2014.12.06.png)

### Score dialog with normal points
![](README/Simulator%20Screen%20Shot%20-%20iPod%20touch%20(7th%20generation)%20-%202021-01-31%20at%2014.12.17.png)

### Score dialog with bonus points
![](README/Simulator%20Screen%20Shot%20-%20iPod%20touch%20(7th%20generation)%20-%202021-01-31%20at%2014.12.36.png)

### Leaderboard Screen
![](README/Simulator%20Screen%20Shot%20-%20iPod%20touch%20(7th%20generation)%20-%202021-01-31%20at%2014.12.46.png)