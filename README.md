# Project 4 - *iOS Twitter Client*

Time spent: **9** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] Hamburger menu
   - [x] Dragging anywhere in the view should reveal the menu.
   - [x] The menu should include links to your profile, the home timeline, and the mentions view.
   - [x] The menu can look similar to the example or feel free to take liberty with the UI.
- [x] Profile page
   - [x] Contains the user header view
   - [x] Contains a section with the users basic stats: # tweets, # following, # followers
- [x] Home Timeline
   - [x] Tapping on a user image should bring up that user's profile page

The following **optional** features are implemented:

- [ ] Profile Page
   - [ ] Implement the paging view for the user description.
   - [ ] As the paging view moves, increase the opacity of the background screen. See the actual Twitter app for this effect
   - [ ] Pulling down the profile page should blur and resize the header image.
- [ ] Account switching
   - [ ] Long press on tab bar to bring up Account view with animation
   - [ ] Tap account to switch to
   - [ ] Include a plus button to Add an Account
   - [ ] Swipe to delete an account


The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

  1. How did you implement the profile display on tapping a user's profile image
  2. How did you integrate the hamburger menu, such that it still shows after a user logs out and back in


## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='/twitter-hamburger-menu.gif?raw=true' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
It was slightly tricky to figure out how to get the hamburger view controller to still show up after logging out. I decided to send an NSNotification when logging out so that the app delegate could handle showing the hamburger view controller after logging in. 

I also had trouble with showing the user's profile on tapping their image. I did a segue to my profile view controller, but that view controller has a navigation controller that shows "logout" or "compose". However, I'd want to show a "back" button if the user entered the profile view from the home timeline. I also wasn't sure how to show the home timeline of anyone but the logged in user on the profile page; it seems like the twitter API only returns results for the logged in user. 

## License

    Copyright [2017] [Kimberly Toy]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
