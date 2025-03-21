#!/usr/bin/env python3

import os
import sys
import csv
import json

# Open CSV file
def from_csv(csv_filename):
    """
    Opens a CSV file, reads it as dictionary, converts it to list of dictionaries and return the list.

    :param csv_filename: Name of the input CSV file, must be in the current directory
    """
    csv_filename = str(os.getcwd()) + "/" + csv_filename
    try:
        with open(csv_filename, "r", encoding="utf-8") as csv_file:
            csv_reader = csv.DictReader(csv_file) # Read as dictionary
            return list(csv_reader)               # Convert to list of dictionaries and return
    except FileNotFoundError:
        print("Can't find the specified file.")
        sys.exit(1)
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        sys.exit(1)

# Write JSON file
def to_json(json_filename, data):
    """
    Writes a JSON file. Overwrites a file with the same name.

    :param json_filename: Name of the output JSON file
    :param data: A Python list of dictionaries
    """
    try:
        with open(json_filename, "w", encoding="utf-8") as json_file:
            json.dump(data, json_file, indent=4)
            print("File has been written.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        sys.exit(1)

if __name__=="__main__":
    if len(sys.argv)!=3:
        print("Accepts two arguments: <csv_filename> <json_filename>")
        sys.exit(1)

    csv_filename  = sys.argv[1]
    json_filename = sys.argv[2]

    data = from_csv(csv_filename)
    to_json(json_filename, data)
    
