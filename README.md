# Final Project - 

[appName] is an app that helps people share an account through scheduling.

Time spent: **X** hours spent in total

## User Stories

- [ ] Have user accounts
- [ ] log in/log out/persisted user
- [ ] submit a time-slot request
- [ ] show schedule for an account

The following **stretch** features are implemented:

- [ ] make it look nice with animations and transitions and themes
- [ ] prevent users from overlapping their own times/other times

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Parse Model

#### User
String Username  
String Password (hashed)  
[\<Schedule object id\>] Array of schedules the user owns  
[\<TimeSlot object id\>] Array of TimeSlots the user has made  

#### Schedule
\<User object id\> Schedule owner  
[\<TimeSlot\>] User created request time windows  

#### TimeSlot
<User object id> TimeSlot owner  
Date TimeStart  
Date TimeEnd  
\<Schedule object id\> Schedule the TimeSlot is a part of  


## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes



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
