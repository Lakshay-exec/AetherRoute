# ⚡ AetherRoute v4.0

[![Download Latest Release](https://img.shields.io/github/v/release/Lakshay-exec/AetherRoute?color=blue&label=Download%20Executable&style=for-the-badge)](https://github.com/Lakshay-exec/AetherRoute/releases/latest)

AetherRoute is a dual-interface split-tunneling utility designed to optimize UDP packet latency and bypass strict captive-portal firewalls (Fortinet, Sophos, Cyberoam). 

By inverting Windows TCP/IP adapter metrics, AetherRoute pushes lightweight authentication and VoIP traffic over a mobile USB tether while binding heavy match-server UDP packets directly to the local Wi-Fi backbone.

⭐ **If this utility fixes your match ping or unblocks voice chat, please leave a Star on this repository!**

## 🚀 V4.0 Zero-Jitter Engine Update
* **Zero-Jitter Engine:** Automatically suspends background Wi-Fi scanning (`WLAN AutoConfig`) during matches to completely eliminate 100ms+ roaming ping spikes.
* **Hardware-Accelerated UI:** New Glassmorphism interface featuring an animated 8-bit mascot and an `[FX: ON/OFF]` toggle to save CPU frames on lower-end hardware.
* **System Tray Integration:** Minimizes seamlessly into the Windows taskbar tray for zero desktop clutter.
* **Universal Adapter Detection:** Automatically maps to any Android or iOS USB tether dynamically.

## 🛡️ Anti-Cheat & Network Safety
* **Zero Memory Hooks:** Operates strictly via native Windows TCP/IP routing APIs (`NetTCPIP` cmdlets). It does not inject into game processes or create virtual TAP adapters.
* **Fully Compliant:** 100% safe for Riot Vanguard, Valve Anti-Cheat (VAC), BattlEye, and Easy Anti-Cheat (EAC). 

## ⚙️ Usage
1. Click the **Download Executable** button above to get `AetherRoute.exe`.
2. Connect to your primary Wi-Fi and plug in your phone via USB Tethering.
3. Right-click the `.exe` and select **Run as Administrator**.
4. Click **Activate Routing** and launch your game. 
5. When finished, right-click the AetherRoute Shield icon in your system tray and select **Exit Completely** to restore your normal network metrics.

*(Note: If Windows SmartScreen displays a warning, click **More Info -> Run Anyway**. The application is entirely open-source, and you can inspect the raw `.ps1` code in this repository.)*

---
**Educational Disclaimer:** *AetherRoute is an open-source networking proof-of-concept demonstrating dynamic split-tunneling. Users are solely responsible for ensuring their traffic complies with local network Acceptable Use Policies.*
