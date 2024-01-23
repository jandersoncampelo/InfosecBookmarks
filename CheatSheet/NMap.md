| **Comando** | **Descrição** |
| --------------|-------------------|
| `nmap -h` | Ajuda do Nmap |
| `nmap -v <target>` | Verbose scan |
| `nmap -sS <target>` | SYN scan |
| `nmap -sT <target>` | Connect scan |
| `nmap -sU <target>` | UDP scan |
| `nmap -p <port> <target>` | Scan de porta específica |
| `nmap -p- <target>` | Scan de todas as 65535 portas |
| `nmap -p 20-30 <target>` | Scan de um range de portas |
| `nmap -F <target>` | Fast scan |
| `nmap -A <target>` | Scan agressivo |
| `nmap -sV <target>` | Detecção de versão de serviço |
| `nmap -O <target>` | Detecção de sistema operacional |
| `nmap -sC <target>` | Scan com scripts padrão |
| `nmap --script=<script> <target>` | Scan com script específico |
| `nmap -iL <file>` | Scan de alvos a partir de um arquivo |
| `nmap -oN <outputfile> <target>` | Salvar resultados em um arquivo |

