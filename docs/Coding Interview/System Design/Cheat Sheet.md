
## Define Requirements
- Functional Requirements
    - User: Sign Up/In
    - Data: CRUD + Search
    - Notification
    - Metrics/Analytics: Trending
    - Localization: Language, Location, Different kind of content
    
- Non-functional Requirements
    - Where is fast/slow?
    - Availability/Latency/Consistency
    - Look for CAP and pick 2 
- Different kinds of users/use case. Famous user in Twitter system


## Capacity Estimation
- Estimate daily active users
- Estimate number of user interaction per day
- Estimate attribute per user e.g. number of followers, number of accounts, etc
- Estimate size of the data
- Calculate numbers per day and divided by 100k to convert to per second
- Don't forget the peak

## Database
- Is it read heavy or write heavy?
    - Read heavy
        - Pre-compute or cache (Redis)
        - 
    - Write heavy:
- Relational data models?
- System can have both relational and NoSQL

## Connection
- Websockets for live users
- Offload blob (images, video, audio) to S3 and CDN

## High Level Design
- Service break down
- Read/Write API
- 


