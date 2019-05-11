# BadiTechTest

Challenge sent by Badi and coded by Sebastián Miguel Gelabert Mas.

## Make it work

In order to run this project just clone it and hit the run button in Xcode. It is  made for all those 'hangry' people. Come on, what are you waiting for!

## Architecture

For the development of this project I have used the patter MVVM. I consider myself a beginner with this pattern but it is what I use for the daily basis at work, so let's embrace the continuous improvement and growth.

## Libraries used

Only one library have been used for the development of the challenge. The library is called **Kingfisher** and it is used to cache images and prevent blocking or create lag in UI while they are still loading.

## Current state and improvements

**Current state**

To develop this project there was certain things to think before typing:
- How to parse the data response from the server.
- How many entities will be necessary to create our models.
- The images will have to be cached so they don't create lag while loading in the UI.
- There can't be any fixed sizes in the cells. That's why we will modify the FlowLayout and make the width of the cell an 80% of the total width available in screen. Thus, there's margin in the trailing and leading of the cell.
- For this version, multiple ingredients will be separated by commas.

**Improvements**

Due to time restrictions, the pagination is not developed in this version.
In order to make it, I think the best approach would be to detect when the user has arrived at the end of the list of the collectionView (in this case), star a loading indicator, make a request to the API and reload the cells woth the new data recevied from the response.

With a little bit more time, I'd like to improve the UI of the app. My ideas are:
- Fully customize the searchBar.
- Redesign the cells where the images are loaded.
- Customize the alert messages.

## To Sum Up

I learned Swift less than a year ago.
I decided to create an app for the iPhone and an app for the Apple Watch for my thesis and it was a success, I graduated with Honors in my thesis!
This led me to look for a job as an iOS developer and ended up working where I am currently. I know I have a lot to learn yet and I think Badi is a match to start learning from the best.

I hope you like this coding challenge!
