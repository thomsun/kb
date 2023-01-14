## Why message queue?
- Synchronous communication has issues
    - Slow consumers slow down producers; tightly couple
    - Hard to retry failures
    - Hard to limit number of requests
- Asynchronous helps
    - Producers don't need to wait for the response
    - Easy to scale; scaling queues and scaling consumers

## Properties/Requirements of message queue
- Send/Receive message
- Scalability - handle load increases
- Availability - Survive hardware/network failure
- Performance
- Reliability/Durability - No message lost

## Component?
```
   Producer
      |
      +--------------- Frontend  ----------------- Backend (a lot of hosts)
      |                    | 
   Consumer         Metadata Service
                           |
                      Metadata DB
```


## Component Details
- Frontend
    - Serving API for both producers and consumers
    - Sit behind VIP/Load Balancer
    - TLS termination
    - Caching
    - Authentication/Authorization
    - Request handling - Rate limit, Dedup, Encryption, Circuit breaker
    - Data collection
- Metadata DB and Metadate service
    - DB keeps tracking queue information
    - Read > Write - Read when message arrive to get queue information from queue ID, Write only when the new queue is created
    - The service serves as cache
    - RelationalDB is fine
    - Options to scale metadata service
        - Replicate servers with loadbalancer - All servers are same
        - Simple hash - Frontend knows what Metadata server to talkt to for queue ID X
        - Metadata service knows themselves - Frontend calls any metadata server; the server will automatically reroute the request
- Message storage
    - Memory and disk on the backend hosts! - This will make it fast
    - Replicate data among backend hosts
    - Metadata service will determine which host has message for the queue ID
- Backend
    - Hosts can be grouped as clusters
    - Metadata knows what cluster handle what queue
    - There will be 2 'cluster managers' that handles
        - In-cluster i.e. hosts inside the cluster
            - Host assignment
            - List of hosts in a cluster
            - Host heartbeat
        - Out-cluster i.e. clusters management
            - Cluster assignment for a queue id
            - List of clusters
            - Cluster heartbeats

## What else?
- 