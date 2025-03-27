# BashRecon
A Bash script that performs initial reconnaissance on a target,

# BashRecon

**BashRecon** is a lightweight Bash-based automated reconnaissance tool for ethical hackers and penetration testers.
It performs quick recon on a given target, including ping check, DNS lookup, port scanning, HTTP banner grabbing, and simple directory brute-forcing.

---

## 🔧 Features
- ICMP Ping check
- DNS lookup using `host`
- TCP port scan (1–1000) using `/dev/tcp`
- HTTP banner grab (port 80)
- Directory brute-force with custom wordlist
- Outputs results to timestamped report files

---

## 🚀 Usage

    chmod +x bashrecon.sh

    ./bashrecon.sh <target-ip-or-domain>


Example:
    ./bashrecon.sh 192.168.1.1


Output will be saved to `reports/recon-<target>.txt`

---

## 📁 Folder Structure

    BashRecon/
    ├── bashrecon.sh
    ├── README.md
    ├── reports/
    └── wordlists/
        └── dirs.txt
        
 

Make sure to populate wordlists/dirs.txt with common directories, or use the included script to fetch from GitHub:

    ./update-wordlist.sh

This will pull a fresh list from SecLists' common.txt and save it to wordlists/dirs.txt.



## ⚠️ Disclaimer
This tool is intended for **educational purposes** and **authorized testing** only.
Always obtain proper permission before running scans against any system.

---

## 🙌 Contributions
Feel free to fork, improve, and submit PRs. Add more checks, wordlists, or enhance with tools like `nmap`, `dig`, `whatweb`, etc.

---

## 📜 License
MIT

