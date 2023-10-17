# .github/scripts/update_readme.py

import os

#def update_readme():
    # Your code here to:
    # - Parse README.md
    # - Extract script filenames
    # - Sort the script filenames alphabetically
    # - Rewrite the language section

    #if __name__ == '__main__':
        #update_readme()


def update_readme():
    print(os.getcwd())
    # Parse README.md
    with open('README.md', 'r') as f:
        readme = f.read()

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


        # control flow empties the language sections, collects the script filenames to separate lists per language

        if line.startswith('-'):
            if section_pointer == 'Bash':
                script_filenames_bash.append(line[3:])
    
            elif section_pointer == 'Perl':
                script_filenames_perl.append(line[3:])
    
            elif section_pointer == 'Python':
                script_filenames_python.append(line[3:])
    
            elif section_pointer == 'PowerShell':
                script_filenames_powershell.append(line[3:])
    
            elif section_pointer == 'Batch':
                script_filenames_batch.append(line[3:])
    
            else:
                modified_lines.append(line)
        else:
            modified_lines.append(line)
            section_pointer = ''

    # Sort the script filenames alphabetically
    script_filenames_bash.sort()
    script_filenames_perl.sort()
    script_filenames_python.sort()
    script_filenames_powershell.sort()
    script_filenames_batch.sort()

    bash_start = 0
    perl_start = 0
    python_start = 0
    powershell_start = 0
    batch_start = 0
    
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

    print(bash_start)
    print(script_filenames_bash)
    
    readme = modified_lines[0:bash_start] + script_filenames_bash
    readme = '\n'.join(modified_lines)


    print(readme)

    # Write the updated README.md to file
    with open('README.md', 'w') as f:
        f.write(readme)

if __name__ == '__main__':
    update_readme()
