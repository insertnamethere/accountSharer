# Final Project - 

[appName] is an app that helps people share an account through scheduling.

Time spent: **X** hours spent in total

## User Stories

- [x] Have user accounts
- [x] log in/log out/persisted user
- [x] submit a time-slot request
- [x] show schedule for an account

The following **stretch** features are implemented:

- [ ] make it look nice with animations and transitions and themes
- [x] prevent users from overlapping their own times/other times

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Parse Model

#### User
String Username  
String Password (hashed)  

#### Schedule
\<User object id\> Schedule owner  
String type

#### TimeSlot
<User object id> TimeSlot owner  
Date TimeStart  
Date TimeEnd  
\<Schedule object id\> Schedule the TimeSlot is a part of  


## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/insertorgnamehere/accountSharer/blob/master/images/IMG_0146.JPG' title='Video Walkthrough' width='' alt='Video Walkthrough' />

<img src='https://github.com/insertorgnamehere/accountSharer/blob/master/images/gifs/done.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Pedro's assigned work
structure and create the Parse model back-end
initilize Parse for Heruko

Will's assigned work
Create main structure of app
Design the workflow of pages and what connects to which page

Kaila's assigned work
go to each page and create the necessary views
complete each page to get each page functional for the app



## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright 2018 Will Xu

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
