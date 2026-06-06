#!/usr/bin/env python3
import argparse
import os
import re

def main():
    parser = argparse.ArgumentParser(description="Extract palette colors 0-15 from a config file")
    parser.add_argument("file_path", help="Path to the color config file")
    args = parser.parse_args()

    file_path = args.file_path

    if not os.path.exists(file_path):
        print(f"Error: File '{file_path}' not found.")
        exit(1)

    palette_colors = {}
    # Regex to match: palette = 5=#f5c2e7
    pattern = re.compile(r'^palette\s*=\s*(\d+)=([#a-fA-F0-9]+)')

    try:
        with open(file_path, 'r') as f:
            for line in f:
                line = line.strip()
                match = pattern.match(line)
                
                if match:
                    index = int(match.group(1))
                    color_code = match.group(2)
                    
                    if 0 <= index <= 15:
                        palette_colors[index] = color_code

        # Output formatted as: %% color0  = #hex %%
        for i in range(16):
            if i in palette_colors:
                print(f"%% color{i}  = {palette_colors[i]} %%")
            else:
                print(f"%% color{i}  = (not found) %%")

    except Exception as e:
        print(f"Error reading file: {e}")
        exit(1)

if __name__ == "__main__":
    main()   
