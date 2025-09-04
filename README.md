# Dirty COW Exploit Implementation (CVE-2016-5195)

## 🔬 Educational Security Research Project

This repository contains a C++ implementation of the famous **Dirty COW** privilege escalation exploit, targeting the Linux kernel vulnerability CVE-2016-5195. This project is designed for educational purposes, security research, and penetration testing in controlled environments.

## 📖 About the Vulnerability

**Dirty COW** (Copy-On-Write) was a critical race condition vulnerability in the Linux kernel's memory subsystem that existed for approximately 9 years (2007-2016). The vulnerability allowed local users to gain write access to read-only memory mappings, enabling privilege escalation to root.

### Key Technical Details:
- **CVE**: CVE-2016-5195
- **CVSS Score**: 7.8 (High)
- **Affected Systems**: Linux kernel versions 2.6.22 through 4.8.3
- **Attack Vector**: Local privilege escalation
- **Impact**: Complete system compromise

## 🛠️ Implementation Features

- **Multi-threaded C++ implementation** using modern threading libraries
- **Passwd file modification** for privilege escalation
- **Interactive shell spawning** upon successful exploitation
- **Automatic file backup** and restoration capabilities
- **Configurable execution modes** (modify-only vs. interactive shell)

## 🎯 Usage Scenarios

- **Security Education**: Understanding memory management vulnerabilities
- **Penetration Testing**: Authorized security assessments
- **Vulnerability Research**: Studying race condition exploits
- **Red Team Exercises**: Simulated attack scenarios

## ⚠️ Legal and Ethical Notice

**FOR EDUCATIONAL AND AUTHORIZED TESTING ONLY**

This tool is provided for educational purposes and authorized security testing. Users are responsible for complying with all applicable laws and regulations. Unauthorized use of this software is prohibited and may result in criminal charges.

## 💼 Professional Context

This implementation demonstrates:
- Advanced C++ programming with threading
- Linux kernel interaction and memory management
- Security vulnerability research methodologies
- Exploit development techniques
- Responsible disclosure practices

---

**Technologies**: C++, Linux Kernel, Multi-threading, Memory Management, Security Research

El contenido del flag.txt es: 4GEEKS{Y0u_G0t_R00t}
