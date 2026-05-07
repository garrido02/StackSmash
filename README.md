```text
   _____ _______       _____ _  __ _____ __  __          _____ _    _ 
  / ____|__   __|/\   / ____| |/ // ____|  \/  |   /\   / ____| |  | |
 | (___    | |  /  \ | |    | ' /| (___ | \  / |  /  \ | (___ | |__| |
  \___ \   | | / /\ \| |    |  <  \___ \| |\/| | / /\ \ \___ \|  __  |
  ____) |  | |/ ____ \ |____| . \ ____) | |  | |/ ____ \____) | |  | |
 |_____/   |_/_/    \_\_____|_|\_\_____/|_|  |_/_/    \_\_____|_|  |_|
======================================================================
             STACKSMASH - Automated Buffer Overflow Tool
                     Developed by Sérgio Garrido
======================================================================
```
**STACKSMASH** is a specialized automation tool designed for **Linux x86 Buffer Overflow** exploitation.  

It streamlines the tedious, manual phases of exploit development by integrating Metasploit’s powerful pattern tools and `msfvenom` into a single, cohesive CLI interface.

<br>  

## ✨ Key Features

🧩 Cyclic Pattern Generation: Quickly create unique crash patterns using msf-pattern_create.  
🎯 Automatic Offset Calculation: Identify the exact EIP overwrite distance using msf-pattern_offset.  
🧪 Dummy Payload Testing: Generate "A*offset + BBBB" test strings to verify register control in GDB.  
🐚 Dynamic Shellcode: Automated msfvenom integration with pre-configured filters for common bad characters.   
🔄 Smart Formatting: Automatically handles Little Endian byte conversion for memory addresses.  

<br> 

## 🚀 Installation

Ensure you have the Metasploit Framework installed before proceeding.  

```Bash
# Clone the repository
git clone [https://github.com/garrido02/Pentesting_Tools.git](https://github.com/garrido02/Pentesting_Tools.git)
cd Pentesting_Tools

# Run the installer
sudo chmod +x install.sh
sudo ./install.sh
```

Once installed, you can trigger the tool from any directory by simply typing **stacksmash**.  

<br>  

## 🛠️ Usage Workflow. 

1. Generate a pattern to crash the binary and identify the EIP location: 

```Bash
stacksmash --cyclic 500
```

2. After the crash, copy the hexadecimal value from the EIP register and find the offset:

```Bash
stacksmash --offset <HEX_VALUE>
```

3. Ensure calculation is correct and choose return address for EIP out of NOOP zone (\x90):
```Bash
stacksmash --dummy <OFFSET_VALUE>
```

4. Construct the final Python command with your Return Address and desired command:

```Bash
stacksmash --padding <OFFSET> --ret <MEMORY_ADDRESS> --cmd "/bin/sh"
```

<br>  

## 📋 Commands & ArgumentsFlagDescription  

| Flag | Description |
| :--- | :--- |
| `--cyclic [L]` | Generates a cyclic pattern of length L. |
| `--offset [V]` | Finds the EIP offset based on hex value V. |
| `--dummy [O]` | Creates a test payload (`A*O + BBBB + NOPs`). |
| `--padding` | The number of bytes required to reach the EIP. |
| `--ret` | The return address to overwrite the EIP (Little Endian auto-converted). |
| `--cmd` | The system command for the shellcode to execute (Default: `/bin/sh`). |
| `--version` | Choose between python2 or python3 versions. | 
| `--setuid` | Bypass smart and recent shells by forcing SUID. |

<br>  

## 👤 Developed by Sérgio Garrido

Contributions, bug reports, and feature requests are welcome! 

<p align="left">
  <i><font color="gray"><b>Disclaimer:</b> This tool is intended for educational purposes and authorized penetration testing only. The author is not responsible for any misuse or damage caused by this program.</font></i>
</p>

