import paramiko

# Define server details
hostname = 'your_server_ip'
username = 'your_username'
password = 'your_password'
new_user = 'new_username'
new_password = 'new_password'

# Connect to the server
ssh_client = paramiko.SSHClient()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh_client.connect(hostname, username=username, password=password)

# Execute provisioning commands
provision_commands = [
    f'adduser {new_user}',
    f'echo -e "{new_password}\\n{new_password}" | passwd {new_user}',
    'usermod -aG sudo {new_user}',
    # Add more provisioning commands as needed
]

for command in provision_commands:
    stdin, stdout, stderr = ssh_client.exec_command(command)
    print(stdout.read().decode('utf-8'))

# Close the SSH connection
ssh_client.close()
