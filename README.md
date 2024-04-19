# Enable-RDPSavedCredentials

This PowerShell script enables the saving of passwords in Remote Desktop Connection on Windows 11 by adjusting registry settings. It sets up the necessary permissions in the Windows registry to allow for credential delegation, facilitating easier and quicker connections to your remote desktops.

## Getting Started

### Prerequisites

To run this script, you must have:
- Administrative privileges on your Windows 11 machine.

### Installation

No installation is needed. Simply download the `Enable-RDPSavedCredentials.ps1` script to your local machine.

### Usage

To use the script, follow these steps:

1. **Open PowerShell as Administrator**: Right-click on the PowerShell icon and select 'Run as administrator'.
2. **Execute the Script**: Navigate to the directory containing the script and run it by typing `./Enable-RDPSavedCredentials.ps1` and then press Enter.

Please note that changes will take effect after restarting your computer.

## Script Details

This script modifies the following registry path:

- `HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation`

It sets the `AllowDelegatingSavedCredentials` to enable the delegation of saved credentials with NTLM-only server authentication.

## Author

This script was authored by [aviado1](https://github.com/aviado1).

## Contributing

Contributions to this script are welcome. To contribute:

1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## Acknowledgements

- Thanks to all who have contributed to refining this script.
- Community feedback and contributions make this project thrive.

