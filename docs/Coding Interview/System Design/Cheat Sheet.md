1. Requirements and Scope (3-10 minutes)
    - Functional Requirements
        - Data: CRUD + Search
        - User: Sign Up/In
        - Notification
        - Metrics/Analytics - Business value metrics
        - Localization: Language, Location, Different kind of content
        - Personalization: Usage history, Friends/Follower
    - Non-functional Requirements
        - Availability/Latency/Consistency
        - Different functions/users need differently
    - Find key requirements and draw scope line

1. Capacity Estimation (3-5 minutes)
    - TPS
        - Ask/Assume a number: active users, interaction per day, etc
        - Calculate to TPS: day / 24 / 3600 = second or / 100k round up
    - Storage
        - Assume size of the data: record breakdown
        - How long we need to keep the data?
    - Peak = Estimate x 2
    - Downtime 99.9% = 1.44 minutes/day = 8.77 hours/year
    - 1 Million = 1MB, 1 Billion = 1 GB, 1 Trillion = 1 TB, 1 Quadrillion = 1 PB

1. High Level Design (5-10 minutes)
    - Draw Components: clients, service, database, cache, CDN, message queue
    - Database Types: SQL/NoSQL/Graph/Mix
    - Offer Alternatives

1. Design Deep Dive (10-25 minutes)
    - Ask/Assume priority
    - Bottle necks and scaling
    - Algorithm/API
    - Data Flow
    - Connection

1. Wrap Up (3-5 minutes)
    - Review the key design decisions and how they address the problem
    - Components/Use cases worth exploring but didn't have time



