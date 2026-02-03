# Log Archive Tool

+ This basic log archiving tool takes a log directory then archives and compresses in a new directory `archives` in the current working directory

+ Future functionality will include a more interactive cli

+ For systems with BSD-style utilities (macOS)


## Getting Started:

1. Clone the repository
    ```
    git clone https://github.com/c-oneill/devops-labs
    cd log-archive-tool
    ```

2. Make the script executable
    ```
    chmod +x log-archive.sh
    ```

3. Execute the script
    - log-archive runs from the command line, accepts the log directory as an argument, compresses the logs, and stores them in a new directory
    ```
    ./log-archive.sh <log_directory>
    ```

This project is part of [roadmap.sh](https://roadmap.sh/projects/server-stats) DevOps projects.