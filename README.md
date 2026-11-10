# NetMirror (Ad-Free & Secure)

<p align="center">
  <img src="art/icon.png" width="128" height="128" alt="NetMirror Logo" />
</p>

<p align="center">
  <b>A modernized, privacy-hardened, and performance-tuned build of NetMirror.</b><br />
  Automated startup verification bypass, client-side SPA bottom tab routing, and hardware-accelerated 60 FPS / 900ms motion physics.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Android-3DDC84?style=flat-square&logo=android&logoColor=white" alt="Platform Android" />
  <img src="https://img.shields.io/badge/Target_SDK-35-blue?style=flat-square" alt="Target SDK 35" />
  <img src="https://img.shields.io/badge/Ad--Free-Automated-success?style=flat-square" alt="Ad-Free" />
  <img src="https://img.shields.io/badge/Motion-60FPS_%2F_900ms-red?style=flat-square" alt="60FPS 900ms" />
  <img src="https://img.shields.io/badge/Build_System-Apktool-orange?style=flat-square" alt="Apktool" />
</p>

---

## 🚀 Key Improvements & Features

### 1. 🛡️ Seamless Startup Ad Bypass
* **Background Handshake Engine:** Eliminates the forced "We Need Support" and ad click dialogues without breaking backend catalog retrieval.
* **Cookie Pre-Seeding:** Injects the active session token (`t_hash_t`) natively into Android's `CookieManager` upon cold start.
* **Auto-Healing Poller:** In the event of session expiry, a background worker silently verifies the downstream session and reloads automatically behind a branded cinematic loader.

### 2. ⚡ 60 FPS 900ms Physics-Based Motion Engine
* **SPA Bottom Navigation:** Intercepts bottom navigation tabs (`Home`, `Series`, `Movies`, `Settings`) to prevent jarring browser unloads, transitioning views with a `cubic-bezier(0.16, 1, 0.3, 1)` easing curve.
* **Poster Card Elevation:** GPU-accelerated scaling (`translateZ(0)`) and spring touch feedback (`scale(0.94)`) across all carousel posters and movie cards.
* **Modal Bottom Sheets:** Trailer and metadata dialogs now slide up using smooth 900ms deceleration curves with high-fidelity backdrop blurs.
* **Native Window Transitions:** Custom transition resources (`nm_slide_in_right_900`, `nm_fade_in_900`, etc.) applied directly to activity lifecycle themes.

### 3. 🔒 Complete Privacy & Security Hardening
* **Zero Screen Recording / Media Projection:** Confirmed 0 references to `MediaProjection`, remote display sharing, or screen capture APIs.
* **No Unnecessary Permissions:** Stripped of intrusive tracking mechanisms; no microphone (`RECORD_AUDIO`), camera, contacts, SMS, or coarse/fine location requests.
* **Clean Network Boundary:** Strictly communicates with the media CDN and portal endpoints with intact integrity headers (`X-Requested-With` and custom user agent strings).

---

## 📂 Repository Structure

```
NetMirror/
├── AndroidManifest.xml          # Cleaned manifest (SDK 35, minimum necessary permissions)
├── apktool.yml                  # Apktool build configuration and compression specs
├── art/
│   └── icon.png                 # High-resolution application launcher logo
├── assets/
│   ├── enhancer.js              # Native JavaScript UI & 60fps motion injection engine
│   └── index.android.bundle     # React Native runtime bundle
├── res/
│   ├── anim/
│   │   ├── nm_fade_in_900.xml   # 900ms smooth fade enter animation
│   │   ├── nm_fade_out_900.xml  # 900ms smooth fade exit animation
│   │   ├── nm_slide_in_right_900.xml
│   │   └── nm_slide_out_left_900.xml
│   └── values/styles.xml        # Theme definitions linked to NetMirrorWindowAnimation
└── smali/
    ├── app/netmirror/nmv2/MainActivity.smali           # Pre-seeds CookieManager on cold start
    └── com/reactnativecommunity/webview/
        ├── UIEnhancer.smali                            # Safe asset loader & JS injection bridge
        └── i.smali                                     # WebViewClient lifecycle integration
```

---

## 🛠️ How to Build from Source

This repository contains the complete, buildable decompiled source. You can compile, sign, and install it with standard Android tools.

### Prerequisites
* **Java Development Kit (JDK 17+)**
* **Apktool (v2.9.0+)**
* **Android SDK Build-Tools (for `zipalign` and `apksigner`)**

### 1. Build the APK
```bash
apktool b . -o NetMirror_unaligned.apk
```

### 2. Align the APK (4-byte boundary)
```bash
zipalign -v -p 4 NetMirror_unaligned.apk NetMirror_aligned.apk
```

### 3. Sign the APK
```bash
apksigner sign --ks ~/.android/debug.keystore --ks-pass pass:android --key-pass pass:android --out NetMirror_signed.apk NetMirror_aligned.apk
```

### 4. Install via ADB
```bash
adb install -r NetMirror_signed.apk
```

---

## ⚖️ Disclaimer

This project is intended strictly for educational, performance analysis, and accessibility enhancement purposes. All trademarks, logos, and media streaming endpoints belong to their respective owners.
