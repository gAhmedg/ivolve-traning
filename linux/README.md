# Lab3 Ping Script

This is a simple Bash script named `lab3-ping.sh` to ping all devices in a given subnet (`192.168.1.0/24`). 
The script pings each IP address in the subnet and reports whether the host is up or down.

### Usage

1. Clone the repository or download the `lab3-ping.sh` script to your local machine.
2. Make the script executable:
   ```sh
   chmod +x lab3-ping.sh
   ```

3. Run the script 
    ```sh
   ./lab3-ping.sh
   ```

### Example Output

 ```sh
    Host 192.168.1.1 is up
    Host 192.168.1.2 is up
    Host 192.168.1.3 is up
    Host 192.168.1.4 is down
  ```

