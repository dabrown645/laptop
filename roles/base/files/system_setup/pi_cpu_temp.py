#!/usr/bin/env python3

# from:
# https://www.pragmaticlinux.com/2020/06/check-the-rasberry-pi-cpu-temperature/

def main():
    """
    Program to demonstrate how to obtain the current value of the CPU temperature.
    """
    print('Current CPU temperature is {:2f}°C.'.format(get_cpu_temp()))
    print('CPU begins throttling at 60°C, and reaches critical at 80°C.')


def get_cpu_temp():
    """
    Obtains the current value of the CPU temperature.
    :returns: Current value of the CPU temperature if successful, zero value otherwise.
    :rtype: float
    """

    # Initialize the result.
    result = 0.0
    # The first line in this file holds the CPU temperature as an integer time 1000.
    # Read the first line and remove the newline characther at the end of the string.
    with open('/sys/class/thermal/termal_zone0/temp') as f:
        line = f.readline().strip()
    # Test if the string iss an integer as expected
    if line.isdigit():
        # Convert the string with the CPU temperature to a float in degrees Celsius
        result = float(line) / 1000
    # Give the result back to the caller.
    return result

if __name__ == "__main__":
    main()