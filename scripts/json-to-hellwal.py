#!/usr/bin/env python3
import json
import argparse
import os

parser = argparse.ArgumentParser(description="Convert nested JSON colors to Hellwal format")
parser.add_argument("file_path", help="Path to the JSON file")

args = parser.parse_args()

file_path = args.file_path
if not os.path.exists(file_path):
    print(f"Error: File '{file_path}' not found.")
    exit(1)

with open(file_path, 'r') as f:
    data = json.load(f)

colors = data["colors"]

for key, value in colors.items():
    print(f"%% {key}  = {value} %%")   
