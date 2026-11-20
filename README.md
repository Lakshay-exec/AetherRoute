# ⚡ AetherRoute v6.1 (Active Watchdog Edition)

[![Download Latest Release](https://img.shields.io/github/v/release/Lakshay-exec/AetherRoute?style=for-the-badge&logo=github)](https://github.com/Lakshay-exec/AetherRoute/releases/latest)

AetherRoute is a dual-interface split-tunneling utility designed to optimize UDP packet latency, eliminate Wi-Fi packet loss spikes, and bypass strict captive-portal firewalls (Fortinet, Sophos, Cyberoam). 

By inverting Windows TCP/IP adapter metrics, AetherRoute pushes lightweight authentication and VoIP traffic over a secondary mobile USB tether while binding heavy match-server UDP packets directly to the local Wi-Fi backbone.

⭐ **If this utility fixes your match ping or unblocks voice chat, please leave a Star on this repository!**

## 🚀 V6.1 Active Watchdog Edition Updates
- **Active Background Watchdog:** Deploys an independent failsafe watchdog process that monitors the parent application process. If the application is ever force-closed, crashes, or exits unexpectedly, the watchdog immediately restores original network state (re-enabling WLAN AutoConfig, re-enabling hardware offloads, and purging QoS rules).
- **VIP DSCP 46 Packet Prioritization:** Injects DSCP 46 (Expedited Forwarding) QoS policies for game UDP traffic to bypass restrictive router/firewall UDP bandwidth throttling.
- **WLAN AutoConfig Roaming Suspension:** Temporarily suspends background Wi-Fi roaming scans while inside active matches, eliminating periodic 15% packet loss spikes.
- **Bufferbloat Prevention:** Disables UDP and LSO hardware offloading on network adapters during active routing to avoid bufferbloat and driver-level packet queuing.
- **Dynamic Match Sniffer:** Automatically sniffs and latches directly onto real-time game UDP endpoints for supported games (Valorant, CS2, eFootball).
- **Glassmorphic UI & System Tray:** Sleek glass UI featuring an animated 8-bit mascot, live adapter status monitoring, `[FX: ON/OFF]` performance toggle, and taskbar tray integration.

## 🛡️ Anti-Cheat & Network Safety
- **Zero Memory Hooks:** Operates strictly via native Windows TCP/IP routing APIs (`NetTCPIP` cmdlets and `netsh`). It does not inject into game processes, modify game binaries, or install intrusive virtual TAP/TUN drivers.
- **Fully Compliant:** Safe for Riot Vanguard, Valve Anti-Cheat (VAC), BattlEye, and Easy Anti-Cheat (EAC). 

## ⚙️ Usage
1. Download the latest `AetherRoute_V6.1.exe` from the [Releases page](https://github.com/Lakshay-exec/AetherRoute/releases/latest).
2. Connect to your primary Wi-Fi and plug in your phone via USB Tethering.
3. Right-click `AetherRoute_V6.1.exe` and select **Run as Administrator**.
4. Click **ACTIVATE ROUTING** and launch your game.
5. When finished, right-click the AetherRoute Shield icon in your system tray and select **Exit Completely** (or click **Exit & Restore Network**) to restore your normal network metrics.

*(Note: If Windows SmartScreen displays a warning, click **More Info -> Run Anyway**. The application is entirely open-source, and you can inspect the raw `.ps1` code in this repository.)*

---
**Educational Disclaimer:** *AetherRoute is an open-source networking proof-of-concept demonstrating dynamic split-tunneling. Users are solely responsible for ensuring their traffic complies with local network Acceptable Use Policies.*
