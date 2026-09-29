# ⚡ AetherRoute v4.0

[!\[Download Latest Release](https://img.shields.io/github/v/release/Lakshay-exec/AetherRoute?color=blue\&label=Download%20Executable)](https://github.com/Lakshay-exec/AetherRoute/releases/latest)

AetherRoute is a dual-interface split-tunneling utility designed to optimize UDP packet latency and bypass strict captive-portal firewalls (Fortinet, Sophos, Cyberoam).

By inverting Windows TCP/IP adapter metrics, AetherRoute pushes lightweight authentication and VoIP traffic over a mobile USB tether while binding heavy match-server UDP packets directly to the local Wi-Fi backbone.

⭐ **If this utility fixes your match ping or unblocks voice chat, please leave a Star on this repository!**

## 🚀 V4.0 Zero-Jitter Engine Update

Standard wireless gaming suffers from latency spikes because Windows periodically scans for new nearby Wi-Fi networks in the background. AetherRoute V4 introduces the **Zero-Jitter Engine**:

* **WLAN AutoConfig Suspension:** Automatically disables background Wi-Fi scanning (`netsh wlan set autoconfig`) the moment routing activates, completely eliminating 100ms+ roaming spikes.
* **Latched UDP Sniffer:** The background UI stops polling the network stack the exact second your match server is found, reducing CPU overhead to absolute zero during gameplay.
* **Clean UI:** Rebuilt with a lightweight, dark-mode WPF Glassmorphism interface.

## 🛡️ Anti-Cheat \& Network Safety

* **Zero Memory Hooks:** AetherRoute operates strictly via native Windows TCP/IP routing APIs (`NetTCPIP` cmdlets). It does not inject into game processes or create virtual TAP adapters.
* **Fully Compliant:** 100% safe for Riot Vanguard, Valve Anti-Cheat (VAC), BattlEye, and Easy Anti-Cheat (EAC).

## ⚙️ Usage (GUI Version)

1. Download `AetherRoute.exe` from the [**Releases**](https://github.com/Lakshay-exec/AetherRoute/releases/latest) tab.
2. Connect to your primary Wi-Fi and plug in your phone via USB Tethering.
3. Right-click the `.exe` and select **Run as Administrator**.
4. Click **Activate Routing** and launch your game.
5. When finished, click **Exit \& Restore Network** to revert all metrics to default.

*(Note: If Windows SmartScreen displays a warning, click **More Info -> Run Anyway**. The app is entirely open-source, and you can inspect the raw `.ps1` code in this repository.)*

## 💻 CLI Barebones Version

For users who prefer manual terminal execution with zero UI overhead, check the `CLI\_Barebones\_Version` folder for the raw batch scripts.

\---

**Educational Disclaimer:** *AetherRoute is an open-source networking proof-of-concept demonstrating dynamic split-tunneling. Users are solely responsible for ensuring their traffic complies with local network Acceptable Use Policies.*

