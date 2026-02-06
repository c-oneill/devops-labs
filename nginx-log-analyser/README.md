# Nginx Log Analyser

+ This basic log analyser takes the provided log file and provides:

    1. Top 5 IP addresses with the most requests

    2. Top 5 most requested paths

    3. Top 5 response status codes

    4. Top 5 user agents

+ For systems with BSD-style utilities (macOS)


## Getting Started:

1. Clone the repository
    ```
    git clone https://github.com/c-oneill/devops-labs
    cd nginx-log-analyser
    ```

2. Make the script executable
    ```
    chmod +x log-analyser.sh
    ```

3. Execute the script
    - log-archive runs from the command line, accepts the log file as an argument, prints stats
    ```
    ./log-analyser.sh <log_file>
    ```

This project is part of [roadmap.sh](https://roadmap.sh/projects/server-stats) DevOps projects.