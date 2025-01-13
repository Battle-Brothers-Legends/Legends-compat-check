import zipfile
import os
import sys

if len(sys.argv) != 2:
    print("Usage: Drag and drop a ZIP file onto this script.")
    sys.exit(1)

zip_file_path = sys.argv[1]
output_file = os.path.splitext(zip_file_path)[0] + '.txt'

def read_source_file():
    with open('source.txt', 'r') as file:
        return set(line.strip() for line in file)

def list_nut_files_in_zip(zip_file_path, output_file):
    source_files = read_source_file()
    with open(output_file, 'w') as file_list:
        with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
            # Iterate over the files in the zip archive
            for file_name in zip_ref.namelist():
                # Check if the file ends with .nut
                if file_name.endswith('.nut') or file_name.endswith('.cnut'):
                    normalized_file_name = file_name.replace('.cnut', '.nut')
                    # If the file path is not in source.txt, write it to the output
                    if normalized_file_name not in source_files:
                        file_list.write(normalized_file_name + '\n')

if __name__ == "__main__":
    list_nut_files_in_zip(zip_file_path, output_file)
    print(f"File list written to {output_file}")
