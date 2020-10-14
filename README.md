# auto_x

This is a repo for a flutter application used for quick reference of SCCA Solo/Autocross rules and events.
It was created to gain a better understanding of Flutter and the use of BLoC pattern. Some of the ways I implemented the pattern may be considered over-abstraction and unnecessary, but was done for the sake of learning.

##Patterns and features

- BLoC pattern for navigation, user input, and loading data
- Queries external API (which I also created and deployed) only on boot
- Caches data from API to local device storage, uses cache data if there is no internet connection
- Animations
- Haptic feedback
- Audio feedback
- PDF viewing


## WIP Notes
*(10/13/2020)*
- Currently do not have access to MotorsportReg's API to lookup event data... Plays a Rick and Morty sound clip as a stand in
- Some overflow errors
- Better layout/styling