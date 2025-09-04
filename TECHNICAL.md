# Technical Documentation

## Binary Analysis

The `dirty` executable is a 64-bit Linux ELF binary implementing the Dirty COW exploit with the following characteristics:

### Compilation Details
- **Compiler**: GCC 5.4.0 (Ubuntu 16.04)
- **Architecture**: x86-64
- **Language**: C++ with STL threading
- **Build Type**: Dynamically linked, not stripped

### Functionality
- **Primary Mode**: Modifies `/etc/passwd` to create root-equivalent user
- **Interactive Mode**: Spawns root shell upon successful exploitation  
- **Backup System**: Creates `.ssh_bak` backup of original passwd file
- **Kernel Interaction**: Manipulates `/proc/sys/vm/dirty_writeback_centisecs`

### Command Line Options
```
./dirty [-s] [-n] | [-h]

-s    Open shell directly if exploit succeeds
-n    Combined with -s, skips passwd file restoration
-h    Display help information
```

### Security Considerations
- **Root Requirement**: Designed to escalate privileges from unprivileged user
- **Kernel Target**: Exploits race condition in Copy-On-Write mechanism
- **Thread Safety**: Uses multi-threading to trigger race condition
- **File System Impact**: Temporarily modifies system authentication files

### Educational Value
This implementation demonstrates:
1. **Race Condition Exploitation**: Timing-based vulnerability exploitation
2. **Memory Management**: Understanding COW and memory mapping
3. **System Call Interaction**: Direct kernel interface manipulation
4. **Thread Synchronization**: Concurrent programming in exploit context
5. **File System Security**: Authentication mechanism bypasses

## Vulnerability Background (CVE-2016-5195)

The Dirty COW vulnerability was a privilege escalation flaw that affected Linux systems for nearly a decade. The exploit leverages a race condition in the kernel's Copy-On-Write mechanism, allowing unauthorized write access to read-only mapped memory regions.

### Technical Impact
- **Scope**: Local privilege escalation
- **Requirements**: Local user access
- **Persistence**: Can create permanent backdoors
- **Detection**: Difficult to detect during exploitation
- **Mitigation**: Kernel patching required

This implementation serves as a practical example for understanding both the vulnerability and defensive measures required to protect Linux systems.