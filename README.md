# ⚡ AetherRoute

> **Universal Dual-Interface Split-Tunnel Engine for Campus & Workplace Networks.**  
> Play Valorant, CS2, and competitive titles with low match ping (~30ms) and functional voice chat on restricted captive-portal Wi-Fi without VPN bans.

---

## 💡 The Problem & How AetherRoute Fixes It

Campus firewalls (such as Fortinet, Sophos, Cyberoam, and Palo Alto) block incoming and outgoing ports for:
1. **Authentication & Handshakes:** Preventing logins to Riot Client, Steam, and Epic Games.
2. **In-Game Voice Signaling (SIP/Vivox):** Cutting off team voice chat.

Standard VPNs add 80–120ms of routing latency, introduce jitter, and often trigger automatic firewall account suspensions.

### The Metric Inversion Solution
AetherRoute manages your computer's built-in Windows network metrics across two simultaneous connections:
* **Mobile Tether (USB):** Elevated to `Metric 5` (Priority Default Gateway). Voice chat, web authentication, and DNS flow over your mobile data (consuming only ~20MB/hour).
* **Hostel Wi-Fi:** Set to `Metric 50`, with match server IP blocks bound directly to the local Wi-Fi gateway at `RouteMetric 1`. High-tick live match packets go straight through the campus backbone for low ping.

---

## 🛡️ Anti-Cheat & Network Safety

* **Zero Memory Hooks:** AetherRoute does not inject into game processes, modify game files, or install third-party virtual network drivers.
* **Kernel Anti-Cheat Safe:** Fully compliant with **Riot Vanguard**, **Valve Anti-Cheat (VAC)**, and **Easy Anti-Cheat (EAC)** because it uses native Windows TCP/IP routing APIs (`NetTCPIP`).
* **Firewall Safe:** No exploit payloads or captive portal hacks. Your PC simply acts as a standard dual-homed client routing traffic across two networks you legitimately access.

---

## 🚀 Getting Started

### Prerequisites
* Windows 10 or Windows 11.
* A USB cable to tether your smartphone.

### Setup Instructions
1. Connect your PC to your campus/hostel Wi-Fi and complete the browser portal login.
2. Connect your phone to your PC via USB and enable tethering:
   * **Android:** *Settings $\rightarrow$ Network & Internet $\rightarrow$ Hotspot & Tethering $\rightarrow$ USB Tethering*.
   * **iPhone:** *Settings $\rightarrow$ Personal Hotspot $\rightarrow$ Allow Others to Join (Select "USB Only")*.
3. Download the latest release from the Releases tab.
4. Right-click **`run.bat`** and select **Run as Administrator**.
5. Once both status indicators turn green, click **ACTIVATE BYPASS**.
6. Launch your game.

---

## ⚡ Peak-Hour / Holiday Congestion Guide

When everyone in the hostel is streaming simultaneously, 2.4 GHz channels suffer from airtime collisions, spiking ping from 30ms to 70ms+. 

To mitigate this:
1. Click the **`⚡ Congestion Fix (Holiday Mode)`** button inside AetherRoute. This locks roaming aggressiveness to minimum and disables Windows network throttling.
2. In Windows **Device Manager** $\rightarrow$ **Network adapters** $\rightarrow$ right-click your Wi-Fi card $\rightarrow$ **Properties** $\rightarrow$ **Advanced** $\rightarrow$ set **Preferred Band** to **5GHz**.

---

## ☕ Support the Project

AetherRoute is open-source. If this helped you bypass network blocks and stabilize your ping:

👉 **[Support the Creator via instgram www.instagram.com/@acebymistake**

---

## 📄 License

Distributed under the **MIT License**. Created for educational research, latency optimization, and client-side traffic management.
