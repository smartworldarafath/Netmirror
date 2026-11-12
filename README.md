# NetMirror (Ad-Free, Redesigned & Secure)

<p align="center">
  <img src="art/icon.png" width="128" height="128" alt="NetMirror Logo" />
</p>

<p align="center">
  <b>A modernized, privacy-hardened, and performance-tuned build of NetMirror.</b><br />
  Automated startup verification bypass, dedicated native Settings UI, 120Hz VRR refresh rate engine, in-app updates, and hardware-accelerated 60 FPS / 900ms motion physics.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Android-3DDC84?style=flat-square&logo=android&logoColor=white" alt="Platform Android" />
  <img src="https://img.shields.io/badge/Version-v3.4.0-blue?style=flat-square" alt="Version v3.4.0" />
  <img src="https://img.shields.io/badge/Target_SDK-35-blue?style=flat-square" alt="Target SDK 35" />
  <img src="https://img.shields.io/badge/Ad--Free-Automated-success?style=flat-square" alt="Ad-Free" />
  <img src="https://img.shields.io/badge/Display-120Hz_%2F_VRR-purple?style=flat-square" alt="120Hz VRR" />
  <img src="https://img.shields.io/badge/Tablet-Optimized-indigo?style=flat-square" alt="Tablet Optimized" />
</p>

---

## 🚀 What's New in v3.4.0

### 1. 🎬 Fixed Video Player Overlap Bug
* **Clean Playback Viewport:** Fixed critical layout regression where the bottom navigation bar (`Home`, `Series`, `Movie`, `Setting`, `N`) overlapped on top of video playback controls and pre-roll content.
* **Intelligent Nav Synchronization:** Re-architected z-index hierarchy (`#player` elevated to `99999`, bottom bar lowered to `5`). Added active DOM MutationObservers and click interceptors that smoothly suppress and hide the bottom bar whenever any movie/series is playing, restoring it cleanly when returning to Home.
* **Enhanced Pre-Roll Gesture:** Android back gesture now dismisses video playback even during initial pre-roll sponsor/disclaimer display.

### 2. 🎨 Brand-New Edge-to-Edge Glowing Glass App Icon
* Replaced legacy launcher and package icons with the new vibrant, premium glowing glass "N" design.
* Generated edge-to-edge assets across all Android mipmap densities (`mdpi`, `hdpi`, `xhdpi`, `xxhdpi`, `xxxhdpi`):
  * **Adaptive Icons:** Pixel-perfect safe-zone scaling fitting circular, squircle, and round-rect system masks edge-to-edge.
  * **Legacy Launchers:** Anti-aliased rounded square (`ic_launcher.png`) and circular (`ic_launcher_round.png`) icons.
  * **Dark Charcoal Palette:** Synchronized adaptive icon background color (`#ff1c2023`) to match the new artwork.

---

## 🌟 Previous Features in v3.3.0

### 1. ⚙️ Dedicated Full-Screen Settings Suite
* **Modernized 1080p Control:** Removed the intrusive legacy floating dialog; integrated a sleek, smooth animated switch toggle with live backend cookie synchronization (`/mobile/setting.php`).
* **App Info Sub-Screen:** Detailed system and mod specifications (Version 3.3.0, Target SDK 35, Universal ABIs, sandbox audits).
* **Live In-App Updates:** Integrated directly with the [GitHub Releases API](https://api.github.com/repos/smartworldarafath/Netmirror/releases/latest) to fetch changelogs and download new APK updates from within the application.
* **Advanced Refresh Rate Engine:** User-selectable display modes:
  * **60Hz (Standard - Battery Saver)**
  * **90Hz (Balanced)**
  * **120Hz (Ultra Smooth 120 FPS)**
  * **Dynamic / Variable (VRR):** Touch boost to maximum refresh rate while scrolling, dropping to 60Hz when idle.
  * *Capability Check:* Displays friendly notification if the device's hardware does not physically support 120Hz.

### 2. 📱 Android Native Back Gesture Handling
* Seamless routing across all views:
  * Closes video player if playing (`.btn-payer-back`).
  * Dismisses details/trailer modals (`.btn-close2`).
  * Collapses search overlay if active.
  * Navigates back from Settings sub-pages to Settings main, and from Settings main to Home.
  * Handles standard web view history before prompting application exit.

### 3. 🖥️ Tablet & Large Screen Optimization
* Full support for Android tablets, foldables, and multi-window environments via `<supports-screens>` manifest declarations and adaptive CSS breakpoints (`min-width: 600px` / `min-width: 900px`).

### 4. 🛡️ Startup Ad Bypass & Zero Tracker Policy
* Automated invisible handshake with CDN gateway; zero forced browser redirections.
* 100% clean security audit: 0 media projection, 0 background audio recording, 0 location tracking.

---

## 📂 Repository Structure

```
NetMirror/
├── AndroidManifest.xml          # Cleaned manifest (SDK 35, tablet support, minimum permissions)
├── apktool.yml                  # Apktool v3.4.0 build configuration (versionCode: 340)
├── art/
│   └── icon.png                 # High-resolution application launcher logo
├── assets/
│   ├── enhancer.js              # Native JavaScript UI, Settings, 120Hz & SPA routing engine
│   └── index.android.bundle     # React Native runtime bundle
├── res/
│   ├── anim/                    # 900ms smooth cubic-bezier window animations
│   └── values/styles.xml        # Theme definitions linked to NetMirrorWindowAnimation
└── smali/
    ├── app/netmirror/nmv2/MainActivity.smali           # Pre-seeds CookieManager & applies display Hz
    └── com/reactnativecommunity/webview/
        ├── NetMirrorBridge.smali                       # Native JavaScriptInterface for 120Hz & updates
        ├── UIEnhancer.smali                            # Asset loader & VRR touch-boost engine
        └── i.smali                                     # WebViewClient lifecycle integration
```

---

## 🛠️ How to Build from Source

```bash
# 1. Build APK
apktool b . -o NetMirror_unaligned.apk

# 2. Zipalign (4-byte alignment)
zipalign -v -p 4 NetMirror_unaligned.apk NetMirror_aligned.apk

# 3. Sign with Android debug keystore
apksigner sign --ks ~/.android/debug.keystore --ks-pass pass:android --key-pass pass:android --out NetMirror_signed.apk NetMirror_aligned.apk

# 4. Install via ADB
adb install -r NetMirror_signed.apk
```

---

## ⚖️ Disclaimer

This project is intended strictly for educational, performance analysis, and accessibility enhancement purposes. All trademarks, logos, and media streaming endpoints belong to their respective owners.
