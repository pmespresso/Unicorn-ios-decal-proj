# Unicorn Inc.

##Authors

  * Young-Joong Kim
  * Nerissa Lin
  * Clark Chen
  * Nicole Raquinha 
  

##Purpose
Redefining what it means to own something.

We are connecting people's needs with people who can fulfill those needs on-demand by creating a gameified platform for people to help other people. 

Platform for people to post their requests and have these fulfilled by local people. 


Intention is for communities to become tighter knit by having this platform where we can outsource needs to local strangers. 

Example- If I were to need tutoring, I could post that for the next 24 hours I'll be in Eschelman and need a tutor for CS170. If someone nearby sees this, they could come by and help, fulfilling the request. Otherwise it will time out and be deleted off the platform after 24 hrs

## Features

  1. Browse through list of tasks
  2. Post a Task
    * Distance
    * Expiration Time
    * Likes / Upvotes
  3. Complete a Task
    * rating
    * comments

## Control Flow

User Alice = new User(Alice);
User Bob = new User(Bob);

  1. Alice and Bob first open the app with a 3-4 slide tutorial on how to use the app. (Only first time)
  2. Alice and Bob's home page from now on is the feed of all requests in Alice and Bob's area.
  
  3a. Alice can create a new request for something she needs.
      * e.g. Alice is coming home from the MLK and it's pouring. She needs an umbrella ASAP. 
 
  3b. Bob can tap on a specific request in the feed to see more details
      * Name of request
      * Person who requested
      * Location of request
      * Timeframe of request (Expires in)
      * Button to claim request


### Simple Exchange Scenario

  4. Bob can "claim" the request with a tap of a button.
      * e.g. Bob is actually going to be in MLK for a while, so he could just lend her the     umbrella and get it back later.
      
  5. Alice gets a push notification that Bob is on his way with an umbrella.
  6. Bob arrives, gives Alice his umbrella, and the exchange is done. 
  7. Alice can rate Bob depending on the quality of the umbrella. Bob can rate Alice depending on if she returns the umbrella.


## Step by Step Control Flow

	1. Userprofile
	2. TaskFeed/Home
		* List View
		* Map View
	3. Task View
		* Expires in
		* location
		* Accept?
		* Mark as Complete

## Implementation
### Model
 
  * Users.swift:
	  * profile
	  * rating
	  * comments
	  * current tasks

	*Tasks.swift:
	  * user_who_posted
	  * expiration_time
	  * location
	  * status
	    * completed
	    * running (someone is currently on it)
	    * not running (this can be on the feed)
	  * descriptions
	  * comments
	  * upvotes

### View


	-----CORE-----------
	*    TaskFeedTableView    <--- Initial view controller
		** ListType
		** MapType
	*	   TaskDetailView
	*    UserProfileView
	*	   CreateTaskView

	-----ADD ONS---------
	*    RateView    

### Controller

	-----CORE-----------
	*    TaskFeedTableViewController
	*    TaskDetailViewController
	*    UserProfileViewController
	*	 CreateTaskViewController

	-----ADD ONS---------
	*    RateViewController

