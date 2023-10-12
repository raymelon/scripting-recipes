# .github/scripts/update_readme.py

#def update_readme():
    # Your code here to:
    # - Parse README.md
    # - Extract script filenames
    # - Sort the script filenames alphabetically
    # - Rewrite the language section

    #if __name__ == '__main__':
        #update_readme()


def update_readme():
    # Parse README.md
    with open('README.md', 'r') as f:
        readme = f.read()

    # Extract script filenames
    script_filenames = []
    for line in readme.split('\n'):
        if line.startswith('`python') and line.endswith('`'):
            script_filenames.append(line[9:-4])

    # Sort the script filenames alphabetically
    script_filenames.sort()

    # Rewrite the language section
    readme = readme.replace('`python\n# List of scripts\n`',
                            '`python\n# List of scripts (alphabetical order)\n`')
    for script_filename in script_filenames:
        readme += f'`{script_filename}`\n'

    # Write the updated README.md to file
    with open('README.md', 'w') as f:
        f.write(readme)

if __name__ == '__main__':
    update_readme()
