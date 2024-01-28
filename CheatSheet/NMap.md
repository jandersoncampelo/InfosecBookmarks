| **Comando** | **Descrição** |
| --------------|-------------------|
| `nmap -h` | Ajuda do Nmap |
| `nmap -v <target>` | Verbose scan |
| `nmap -sS <target>` | SYN scan |
| `nmap -sT <target>` | Connect scan |
| `nmap -sU <target>` | UDP scan |
| `nmap -p <port> <target>` | Scan specific port |
| `nmap -p- <target>` | Scan all 65535 ports  |
| `nmap -p 20-30 <target>` | Scan a port range |
| `nmap -F <target>` | Fast scan |
| `nmap -A <target>` | Agressive Scan  |
| `nmap -sV <target>` | service detection |
| `nmap -O <target>` | Operational System detection |
| `nmap -sC <target>` | Scan wirh default script |
| `nmap --script=<script> <target>` | Scan with specific script  |
| `nmap -iL <file>` | Scan targets from arquivo |
| `nmap -oN <outputfile> <target>` | Salvar output | em um arquivo |

