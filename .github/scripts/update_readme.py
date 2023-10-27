# .github/scripts/update_readme.py

<<<<<<< HEAD
=======
import os

>>>>>>> refs/remotes/origin/main
#def update_readme():
    # Your code here to:
    # - Parse README.md
    # - Extract script filenames
    # - Sort the script filenames alphabetically
    # - Rewrite the language section

    #if __name__ == '__main__':
        #update_readme()


def update_readme():
<<<<<<< HEAD
=======
    print(os.getcwd())
>>>>>>> refs/remotes/origin/main
    # Parse README.md
    with open('README.md', 'r') as f:
        readme = f.read()

<<<<<<< HEAD
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
=======
    # output list
    modified_lines = []

    # Extract script filenames
    script_filenames_bash = []
    script_filenames_perl = []
    script_filenames_python = []
    script_filenames_powershell = []
    script_filenames_batch = []

    section_pointer = ''
    
    for i, line in enumerate(readme.split('\n')):
        print(line)

        # control flow marks which language section the loop is

        if line.startswith('### Bash'):
            section_pointer = 'Bash'

        elif line.startswith('### Perl'):
            section_pointer = 'Perl'
        
        elif line.startswith('### Python'):
            section_pointer = 'Python'

        elif line.startswith('### PowerShell'):
            section_pointer = 'PowerShell'

        elif line.startswith('### Batch'):
            section_pointer = 'Batch'

        elif line.startswith('Make sure to read'):
            section_pointer = ''


        # control flow empties the language sections, collects the script filenames to separate lists per language

        if line.startswith('-'):
            if section_pointer == 'Bash':
                script_filenames_bash.append(line)
    
            elif section_pointer == 'Perl':
                script_filenames_perl.append(line)
    
            elif section_pointer == 'Python':
                script_filenames_python.append(line)
    
            elif section_pointer == 'PowerShell':
                script_filenames_powershell.append(line)
    
            elif section_pointer == 'Batch':
                script_filenames_batch.append(line)
    
            else:
                modified_lines.append(line)
        else:
            modified_lines.append(line)

    # Sort the script filenames alphabetically
    script_filenames_bash.sort(key=str.lower)
    script_filenames_perl.sort(key=str.lower)
    script_filenames_python.sort(key=str.lower)
    script_filenames_powershell.sort(key=str.lower)
    script_filenames_batch.sort(key=str.lower)

    bash_start = 0
    perl_start = 0
    python_start = 0
    powershell_start = 0
    batch_start = 0
    batch_end = 0
    
    for i, line in enumerate(modified_lines):
        # print(line)

        # control flow empties the language sections, collects the script filenames to separate lists per language

        if line.startswith('### Bash'):
            bash_start = i

        elif line.startswith('### Perl'):
            perl_start = i
        
        elif line.startswith('### Python'):
            python_start = i

        elif line.startswith('### PowerShell'):
            powershell_start = i

        elif line.startswith('### Batch'):
            batch_start = i

        elif line.startswith('Make sure to read'):
            batch_end = i

    print(bash_start)
    print(script_filenames_bash)
    
    modified_lines = modified_lines[0:bash_start + 2] + script_filenames_bash + modified_lines[perl_start - 1:perl_start + 2] + script_filenames_perl + modified_lines[python_start - 1:python_start + 2] + script_filenames_python + modified_lines[powershell_start - 1:powershell_start + 2] + script_filenames_powershell + modified_lines[batch_start - 1:batch_start + 2] + script_filenames_batch + modified_lines[batch_end - 1:]
    readme = '\n'.join(modified_lines)

    print(readme)
>>>>>>> refs/remotes/origin/main

    # Write the updated README.md to file
    with open('README.md', 'w') as f:
        f.write(readme)

if __name__ == '__main__':
    update_readme()
