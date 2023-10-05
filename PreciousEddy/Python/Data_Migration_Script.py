import shutil

source_directory = '/path/to/source'
destination_directory = '/path/to/destination'

# Copy files from source to destination
shutil.copytree(source_directory, destination_directory)

# Optional: Delete source files after migration
shutil.rmtree(source_directory)
