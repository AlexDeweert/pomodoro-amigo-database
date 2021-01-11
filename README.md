# PomodoroAmigo Database
This repo will contain VM configuration files, schema dumps, and UML diagrams for the PomodoroAmigo focus timer database project

## Schema
![UML](Pomodoro Amigo DatabaseUML.png)

## Design Decisions

### Purpose of Database
This database is meant to support multiple client implementations of a very simple focus timer application. A user will be required to login with an email and password (with later support for Facebook, Google, Apple sign in) and they will be issued an API token.

### Users and Authentication
The token will be autogenerated on the API backend when the user does an initial sign in from their client. That token will be stored by the API, associated with a user_id. In addition, the token and passwords will be salted and encrypted for extra security.

### Timers
One timer can have many intervals. For example, I might have a focus timer with intervals "Work", "Rest", and "Review". A timer can be identified uniquely with a timer_id, and will have a descriptive title such as "Study ReactJS Timer".

### Intervals
One interval is a single duration of time, uniquely identified by an interval_id, with a descriptive title such as "Work". The interval will have a duration specified in seconds. A timer is made up of at least one interval, but it can have many more.
