/**
 * NetMirror Native UI, Settings & Motion Engine v3.4.0
 * - Automated Startup Ad Handshake & Seamless Bypass
 * - Full-Screen Dedicated Settings Section
 * - 1080p Toggle with Live Cookie & API Integration
 * - App Info Section (v3.4.0, Target SDK 35, Package Info)
 * - App Updates Section with Live GitHub Releases API & Direct APK Download
 * - Advanced Section: 60Hz / 90Hz / 120Hz / VRR with Device Capability Check
 * - Comprehensive Android Native Back Gesture Handling
 * - Tablet & Large Screen Responsive Layout Optimization
 * - Seamless Video Player Viewport & Suppression of Bottom Navigation Bar
 * - 60 FPS 900ms Hardware-Accelerated Physics
 */
(function () {
  'use strict';

  if (window.__NM_ENHANCED_V340__) return;
  window.__NM_ENHANCED_V340__ = true;

  // ==========================================
  // 1. INJECT HIGH-PRIORITY STYLES
  // ==========================================
  const styleEl = document.createElement('style');
  styleEl.id = 'nm-v340-styles';
  styleEl.textContent = `
    /* 1. Suppress legacy ad elements and legacy floating setting popup */
    .info2, .adboxing, .dark-bg, #ad-banner-test, .appdownload, .app-download,
    #setting-box, div[style*="max-width:700px"][style*="position:fixed"],
    div[style*="background:rgb(255,0,0)"] {
      display: none !important;
      visibility: hidden !important;
      opacity: 0 !important;
      pointer-events: none !important;
      height: 0 !important;
      max-height: 0 !important;
      overflow: hidden !important;
    }

    /* 2. Global Smooth Scrolling & Hardware Acceleration */
    * {
      -webkit-tap-highlight-color: transparent !important;
      -webkit-font-smoothing: antialiased !important;
      box-sizing: border-box !important;
    }

    html, body {
      scroll-behavior: smooth !important;
      overscroll-behavior-y: contain !important;
      background-color: #060608 !important;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif !important;
    }

    /* 3. 60 FPS 900ms Poster Cards */
    .tray-item, .card, .poster, .video-card, .modal-img-poster, .m-c-l, .slider-item {
      will-change: transform, box-shadow !important;
      transform: translateZ(0) !important;
      transition: transform 900ms cubic-bezier(0.16, 1, 0.3, 1), box-shadow 900ms cubic-bezier(0.16, 1, 0.3, 1) !important;
      border-radius: 8px !important;
    }

    .tray-item:active, .card:active, .video-card:active, .slider-item:active {
      transform: scale(0.94) translateZ(0) !important;
      transition: transform 150ms cubic-bezier(0.2, 0.8, 0.2, 1) !important;
    }

    /* 4. Bottom Navigation Transitions */
    .bottom-navigation-container {
      background: rgba(10, 10, 14, 0.95) !important;
      backdrop-filter: blur(20px) !important;
      -webkit-backdrop-filter: blur(20px) !important;
      border-top: 1px solid rgba(255, 255, 255, 0.08) !important;
      transition: all 400ms cubic-bezier(0.16, 1, 0.3, 1), transform 300ms ease !important;
      z-index: 5 !important;
    }

    /* 4.1. Video Player Z-Index & Suppression of Bottom Navigation Bar */
    #player, .player, .player-box, #jw {
      z-index: 99999 !important;
    }

    body.overflow3 .bottom-navigation-container,
    body.nm-player-active .bottom-navigation-container,
    body:has(#player:not(.hide)) .bottom-navigation-container,
    body:has(#jw.jwplayer) .bottom-navigation-container,
    #player:not(.hide) ~ .bottom-navigation-container,
    .player:not(.hide) ~ .bottom-navigation-container {
      display: none !important;
      visibility: hidden !important;
      opacity: 0 !important;
      pointer-events: none !important;
      transform: translateY(150%) !important;
    }

    .bottom-navigation-container ul {
      display: flex !important;
      align-items: center !important;
      justify-content: space-around !important;
      padding: 6px 0 !important;
      margin: 0 !important;
      list-style: none !important;
    }

    .bottom-navigation-container .link-container {
      transition: transform 400ms cubic-bezier(0.16, 1, 0.3, 1), opacity 400ms cubic-bezier(0.16, 1, 0.3, 1) !important;
    }

    .bottom-navigation-container .link-container.active {
      transform: scale(1.1) !important;
    }

    .bottom-navigation-container .link-container.active .iconClass {
      filter: drop-shadow(0 0 8px rgba(229, 9, 20, 0.85)) !important;
    }

    /* 5. Tablet & Large Screen Optimization */
    @media (min-width: 600px) {
      .tray-container, .main-container {
        max-width: 1200px !important;
        margin: 0 auto !important;
        padding: 0 24px !important;
      }
      .tray-item, .card, .poster {
        min-width: 160px !important;
      }
      .bottom-navigation-container {
        padding-left: 20% !important;
        padding-right: 20% !important;
      }
    }

    @media (min-width: 900px) {
      .bottom-navigation-container {
        padding-left: 32% !important;
        padding-right: 32% !important;
      }
      .tray-item, .card, .poster {
        min-width: 180px !important;
      }
    }

    /* 6. Settings Screen UI Styles */
    #nm-settings-screen, .nm-subpage {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background: #08080c;
      color: #f8fafc;
      z-index: 1000000;
      display: flex;
      flex-direction: column;
      transform: translateX(100%);
      transition: transform 450ms cubic-bezier(0.16, 1, 0.3, 1);
      overflow-y: auto;
      -webkit-overflow-scrolling: touch;
    }

    #nm-settings-screen.active, .nm-subpage.active {
      transform: translateX(0);
    }

    .nm-header {
      display: flex;
      align-items: center;
      padding: 18px 20px;
      background: rgba(15, 15, 22, 0.95);
      backdrop-filter: blur(20px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.08);
      position: sticky;
      top: 0;
      z-index: 10;
    }

    .nm-back-btn {
      background: rgba(255, 255, 255, 0.08);
      border: 1px solid rgba(255, 255, 255, 0.12);
      color: #fff;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 20px;
      cursor: pointer;
      margin-right: 16px;
      transition: transform 200ms ease, background 200ms ease;
    }

    .nm-back-btn:active {
      transform: scale(0.9);
      background: rgba(255, 255, 255, 0.2);
    }

    .nm-header-title {
      font-size: 20px;
      font-weight: 700;
      letter-spacing: 0.3px;
      color: #ffffff;
    }

    .nm-content {
      padding: 20px 16px 80px 16px;
      max-width: 720px;
      margin: 0 auto;
      width: 100%;
    }

    .nm-section-title {
      font-size: 12px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1.2px;
      color: #94a3b8;
      margin: 20px 0 10px 12px;
    }

    .nm-card-group {
      background: rgba(20, 20, 30, 0.7);
      border: 1px solid rgba(255, 255, 255, 0.08);
      border-radius: 16px;
      overflow: hidden;
      backdrop-filter: blur(12px);
    }

    .nm-item {
      display: flex;
      align-items: center;
      padding: 16px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
      cursor: pointer;
      transition: background 200ms ease;
    }

    .nm-item:last-child {
      border-bottom: none;
    }

    .nm-item:active {
      background: rgba(255, 255, 255, 0.06);
    }

    .nm-item-icon {
      width: 44px;
      height: 44px;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 16px;
      font-size: 20px;
      flex-shrink: 0;
    }

    .nm-item-text {
      flex: 1;
    }

    .nm-item-title {
      font-size: 16px;
      font-weight: 600;
      color: #f1f5f9;
      margin-bottom: 3px;
    }

    .nm-item-subtitle {
      font-size: 13px;
      color: #94a3b8;
      line-height: 1.3;
    }

    .nm-chevron {
      color: #64748b;
      font-size: 18px;
      margin-left: 8px;
    }

    /* iOS/Material Switch */
    .nm-switch {
      position: relative;
      display: inline-block;
      width: 52px;
      height: 30px;
      flex-shrink: 0;
    }

    .nm-switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .nm-slider {
      position: absolute;
      cursor: pointer;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: #334155;
      transition: 350ms cubic-bezier(0.16, 1, 0.3, 1);
      border-radius: 34px;
    }

    .nm-slider:before {
      position: absolute;
      content: "";
      height: 22px;
      width: 22px;
      left: 4px;
      bottom: 4px;
      background-color: white;
      transition: 350ms cubic-bezier(0.16, 1, 0.3, 1);
      border-radius: 50%;
      box-shadow: 0 2px 6px rgba(0,0,0,0.4);
    }

    input:checked + .nm-slider {
      background-color: #e50914;
      box-shadow: 0 0 12px rgba(229, 9, 20, 0.5);
    }

    input:checked + .nm-slider:before {
      transform: translateX(22px);
    }

    /* Radio Items in Advanced */
    .nm-radio-item {
      display: flex;
      align-items: center;
      padding: 16px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
      cursor: pointer;
    }

    .nm-radio-item:last-child {
      border-bottom: none;
    }

    .nm-radio-circle {
      width: 22px;
      height: 22px;
      border-radius: 50%;
      border: 2px solid #64748b;
      margin-right: 16px;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 250ms ease;
    }

    .nm-radio-item.selected .nm-radio-circle {
      border-color: #e50914;
      background: #e50914;
      box-shadow: 0 0 8px rgba(229, 9, 20, 0.6);
    }

    .nm-radio-circle:after {
      content: '';
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: white;
      display: none;
    }

    .nm-radio-item.selected .nm-radio-circle:after {
      display: block;
    }

    /* Branded Toast */
    #nm-toast {
      position: fixed;
      bottom: 90px;
      left: 50%;
      transform: translateX(-50%) translateY(30px);
      background: rgba(20, 20, 28, 0.95);
      color: #fff;
      padding: 12px 24px;
      border-radius: 30px;
      border: 1px solid rgba(255, 255, 255, 0.15);
      font-size: 14px;
      font-weight: 600;
      box-shadow: 0 10px 25px rgba(0,0,0,0.6);
      z-index: 2000000;
      opacity: 0;
      pointer-events: none;
      transition: all 300ms cubic-bezier(0.16, 1, 0.3, 1);
    }

    #nm-toast.show {
      transform: translateX(-50%) translateY(0);
      opacity: 1;
    }

    /* Loading Overlay */
    #nm-seamless-loader {
      position: fixed;
      top: 0; left: 0; width: 100vw; height: 100vh;
      background: radial-gradient(circle at center, #14141c 0%, #060608 100%);
      display: flex; flex-direction: column; align-items: center; justify-content: center;
      z-index: 99999999;
      transition: opacity 600ms cubic-bezier(0.16, 1, 0.3, 1);
    }

    .nm-logo-glow {
      width: 72px; height: 72px; margin-bottom: 24px;
      animation: nm-breathe 2s cubic-bezier(0.4, 0, 0.2, 1) infinite;
    }

    @keyframes nm-breathe {
      0%, 100% { transform: scale(1); filter: drop-shadow(0 0 16px rgba(229, 9, 20, 0.5)); }
      50% { transform: scale(1.08); filter: drop-shadow(0 0 32px rgba(229, 9, 20, 0.9)); }
    }

    .nm-progress-bar {
      width: 180px; height: 4px; background: rgba(255, 255, 255, 0.12);
      border-radius: 999px; overflow: hidden; position: relative;
    }

    .nm-progress-fill {
      position: absolute; top: 0; left: 0; height: 100%; width: 40%;
      background: linear-gradient(90deg, #e50914, #ff5e62);
      border-radius: 999px; animation: nm-slide 1.5s cubic-bezier(0.4, 0, 0.2, 1) infinite;
    }

    @keyframes nm-slide {
      0% { left: -40%; width: 30%; }
      50% { left: 35%; width: 50%; }
      100% { left: 100%; width: 30%; }
    }

    .nm-loader-text {
      color: #e2e8f0; font-size: 14px; font-weight: 600; letter-spacing: 0.5px;
      margin-top: 18px;
    }
  `;
  document.head.appendChild(styleEl);

  // ==========================================
  // 2. TOAST NOTIFICATION HELPER
  // ==========================================
  let toastEl = document.getElementById('nm-toast');
  if (!toastEl) {
    toastEl = document.createElement('div');
    toastEl.id = 'nm-toast';
    document.body.appendChild(toastEl);
  }

  function showToast(msg) {
    if (window.NetMirrorNative && window.NetMirrorNative.showToast) {
      window.NetMirrorNative.showToast(msg);
      return;
    }
    toastEl.textContent = msg;
    toastEl.classList.add('show');
    clearTimeout(toastEl._timer);
    toastEl._timer = setTimeout(function () {
      toastEl.classList.remove('show');
    }, 2500);
  }

  // ==========================================
  // 3. STARTUP AD BYPASS & HANDSHAKE
  // ==========================================
  function checkAndBypassAd() {
    const isUnverified = document.body && (
      document.body.hasAttribute('data-addhash') ||
      document.querySelector('.open-support') ||
      document.querySelector('.info2')
    ) && !document.querySelector('.tray-container, .bottom-navigation-container');

    if (!isUnverified) return;

    if (!document.getElementById('nm-seamless-loader')) {
      const loader = document.createElement('div');
      loader.id = 'nm-seamless-loader';
      loader.innerHTML = `
        <svg class="nm-logo-glow" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M26 15V85L74 15V85" stroke="#E50914" stroke-width="14" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <div class="nm-progress-bar"><div class="nm-progress-fill"></div></div>
        <div class="nm-loader-text">Loading NetMirror v3.4.0</div>
      `;
      document.body.appendChild(loader);
    }

    const addhash = document.body.getAttribute('data-addhash');
    if (!addhash) return;

    const userverUrl = 'https://userver.net52.cc/?ffr455=' + encodeURIComponent(addhash) + '&a=y&t=' + Math.random();
    fetch(userverUrl, { mode: 'no-cors' }).catch(function () {});

    const ifr = document.createElement('iframe');
    ifr.style.cssText = 'position:fixed;width:1px;height:1px;opacity:0.01;bottom:-999px;pointer-events:none;';
    ifr.src = userverUrl;
    document.body.appendChild(ifr);

    let attempts = 0;
    const poller = setInterval(function () {
      attempts++;
      fetch('/mobile/verify2.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          'X-Requested-With': 'XMLHttpRequest'
        },
        body: 'verify=' + encodeURIComponent(addhash)
      })
      .then(function (r) { return r.json(); })
      .then(function (res) {
        if (res && res.statusup === 'All Done') {
          clearInterval(poller);
          location.reload();
        }
      })
      .catch(function () {});

      if (attempts >= 25) {
        clearInterval(poller);
        location.reload();
      }
    }, 2000);
  }

  // ==========================================
  // 4. SETTINGS SCREENS CREATION & LOGIC
  // ==========================================
  function createSettingsDOM() {
    if (document.getElementById('nm-settings-screen')) return;

    // Check current 1080p cookie state
    const isHdOn = document.cookie.indexOf('hd=on') !== -1;

    // Main Settings Screen
    const settingsDiv = document.createElement('div');
    settingsDiv.id = 'nm-settings-screen';
    settingsDiv.innerHTML = `
      <div class="nm-header">
        <div class="nm-back-btn" id="nm-settings-back">✕</div>
        <div class="nm-header-title">Settings</div>
      </div>
      <div class="nm-content">
        <div class="nm-section-title">Streaming Quality</div>
        <div class="nm-card-group">
          <div class="nm-item" id="nm-1080p-row">
            <div class="nm-item-icon" style="background: linear-gradient(135deg, #e50914, #ff4d4d); color: #fff; font-weight:800; font-size:14px;">HD</div>
            <div class="nm-item-text">
              <div class="nm-item-title">1080p Full HD Streaming</div>
              <div class="nm-item-subtitle" id="nm-hd-status">${isHdOn ? 'High-bitrate 1080p active' : 'Standard definition streaming'}</div>
            </div>
            <label class="nm-switch">
              <input type="checkbox" id="nm-hd-checkbox" ${isHdOn ? 'checked' : ''}>
              <span class="nm-slider"></span>
            </label>
          </div>
        </div>

        <div class="nm-section-title">General & Preferences</div>
        <div class="nm-card-group">
          <div class="nm-item" id="nm-btn-app-info">
            <div class="nm-item-icon" style="background: rgba(59, 130, 246, 0.15); color: #3b82f6;">ℹ️</div>
            <div class="nm-item-text">
              <div class="nm-item-title">App Info</div>
              <div class="nm-item-subtitle">Version v3.3.0, architecture & details</div>
            </div>
            <div class="nm-chevron">›</div>
          </div>

          <div class="nm-item" id="nm-btn-app-updates">
            <div class="nm-item-icon" style="background: rgba(16, 185, 129, 0.15); color: #10b981;">🚀</div>
            <div class="nm-item-text">
              <div class="nm-item-title">App Updates</div>
              <div class="nm-item-subtitle">Check for new releases & auto-update</div>
            </div>
            <div class="nm-chevron">›</div>
          </div>

          <div class="nm-item" id="nm-btn-advanced">
            <div class="nm-item-icon" style="background: rgba(245, 158, 11, 0.15); color: #f59e0b;">⚡</div>
            <div class="nm-item-text">
              <div class="nm-item-title">Advanced</div>
              <div class="nm-item-subtitle">Display refresh rate (60Hz / 90Hz / 120Hz)</div>
            </div>
            <div class="nm-chevron">›</div>
          </div>
        </div>
      </div>
    `;
    document.body.appendChild(settingsDiv);

    // Sub-Screen 1: App Info
    const infoSub = document.createElement('div');
    infoSub.id = 'nm-sub-info';
    infoSub.className = 'nm-subpage';
    infoSub.innerHTML = `
      <div class="nm-header">
        <div class="nm-back-btn" onclick="window.__NM_CLOSE_SUBPAGE__()">‹</div>
        <div class="nm-header-title">App Info</div>
      </div>
      <div class="nm-content">
        <div style="text-align:center; padding: 24px 0 16px 0;">
          <svg style="width:72px; height:72px; margin: 0 auto 12px auto; display:block;" viewBox="0 0 100 100" fill="none">
            <path d="M26 15V85L74 15V85" stroke="#E50914" stroke-width="14" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          <div style="font-size:22px; font-weight:800; color:#fff;">NetMirror</div>
          <div style="font-size:14px; color:#e50914; font-weight:600; margin-top:4px;">Version 3.4.0 (Build 340)</div>
        </div>

        <div class="nm-section-title">Application Specifications</div>
        <div class="nm-card-group">
          <div class="nm-item"><div class="nm-item-text"><div class="nm-item-title">Package Name</div><div class="nm-item-subtitle">app.netmirror.nmv2</div></div></div>
          <div class="nm-item"><div class="nm-item-text"><div class="nm-item-title">Target SDK</div><div class="nm-item-subtitle">Android 15 (API 35)</div></div></div>
          <div class="nm-item"><div class="nm-item-text"><div class="nm-item-title">Architecture</div><div class="nm-item-subtitle">Universal (arm64-v8a, armeabi-v7a, x86, x86_64)</div></div></div>
          <div class="nm-item"><div class="nm-item-text"><div class="nm-item-title">Motion Engine</div><div class="nm-item-subtitle">60 FPS / 900ms Hardware-Accelerated Physics</div></div></div>
          <div class="nm-item"><div class="nm-item-text"><div class="nm-item-title">Ad Policy</div><div class="nm-item-subtitle">Automated Background Handshake (Zero Intrusive Popups)</div></div></div>
          <div class="nm-item"><div class="nm-item-text"><div class="nm-item-title">Security & Sandbox</div><div class="nm-item-subtitle">Audited (No screen capture, no mic, zero trackers)</div></div></div>
          <div class="nm-item"><div class="nm-item-text"><div class="nm-item-title">Developer & Maintainer</div><div class="nm-item-subtitle">smartworldarafath</div></div></div>
        </div>
      </div>
    `;
    document.body.appendChild(infoSub);

    // Sub-Screen 2: App Updates
    const updatesSub = document.createElement('div');
    updatesSub.id = 'nm-sub-updates';
    updatesSub.className = 'nm-subpage';
    updatesSub.innerHTML = `
      <div class="nm-header">
        <div class="nm-back-btn" onclick="window.__NM_CLOSE_SUBPAGE__()">‹</div>
        <div class="nm-header-title">App Updates</div>
      </div>
      <div class="nm-content">
        <div class="nm-section-title">Installed Version</div>
        <div class="nm-card-group">
          <div class="nm-item">
            <div class="nm-item-icon" style="background: rgba(16, 185, 129, 0.15); color: #10b981;">✓</div>
            <div class="nm-item-text">
              <div class="nm-item-title">NetMirror v3.3.0</div>
              <div class="nm-item-subtitle">Currently active build on this device</div>
            </div>
          </div>
        </div>

        <div class="nm-section-title">Latest Release Status</div>
        <div class="nm-card-group" id="nm-update-result">
          <div class="nm-item" style="justify-content:center; padding: 24px;">
            <div style="color: #94a3b8; font-size:14px;" id="nm-update-status-text">Checking for updates from GitHub...</div>
          </div>
        </div>

        <div style="margin-top:20px;">
          <button id="nm-check-update-btn" style="width:100%; padding:14px; background:#e50914; color:#fff; border:none; border-radius:12px; font-weight:700; font-size:15px; cursor:pointer;">
            Check for Updates
          </button>
        </div>
      </div>
    `;
    document.body.appendChild(updatesSub);

    // Sub-Screen 3: Advanced (Refresh Rate)
    const advSub = document.createElement('div');
    advSub.id = 'nm-sub-advanced';
    advSub.className = 'nm-subpage';
    advSub.innerHTML = `
      <div class="nm-header">
        <div class="nm-back-btn" onclick="window.__NM_CLOSE_SUBPAGE__()">‹</div>
        <div class="nm-header-title">Advanced Settings</div>
      </div>
      <div class="nm-content">
        <div class="nm-section-title">Display Refresh Rate</div>
        <div class="nm-card-group" id="nm-refresh-options">
          <div class="nm-radio-item" data-rate="60">
            <div class="nm-radio-circle"></div>
            <div class="nm-item-text">
              <div class="nm-item-title">60Hz (Standard)</div>
              <div class="nm-item-subtitle">Standard smooth 60 FPS, maximum battery efficiency</div>
            </div>
          </div>

          <div class="nm-radio-item" data-rate="90">
            <div class="nm-radio-circle"></div>
            <div class="nm-item-text">
              <div class="nm-item-title">90Hz (Balanced)</div>
              <div class="nm-item-subtitle">Enhanced fluid scrolling with balanced battery consumption</div>
            </div>
          </div>

          <div class="nm-radio-item" data-rate="120">
            <div class="nm-radio-circle"></div>
            <div class="nm-item-text">
              <div class="nm-item-title">120Hz (Ultra Smooth 120 FPS)</div>
              <div class="nm-item-subtitle">Peak fluid animations on high refresh rate displays</div>
            </div>
          </div>

          <div class="nm-radio-item" data-rate="0">
            <div class="nm-radio-circle"></div>
            <div class="nm-item-text">
              <div class="nm-item-title">Dynamic / Variable (VRR)</div>
              <div class="nm-item-subtitle">Touch boost to maximum Hz while scrolling, drops to 60Hz when idle</div>
            </div>
          </div>
        </div>
        <div style="font-size:12px; color:#64748b; margin: 12px 16px 0 16px; line-height:1.4;">
          Note: If your device does not physically support 90Hz or 120Hz display modes, standard 60Hz mode will be enforced automatically.
        </div>
      </div>
    `;
    document.body.appendChild(advSub);

    // ==========================================
    // 5. EVENT HANDLERS & LOGIC
    // ==========================================

    // 1080p Checkbox Toggle
    const hdCheckbox = document.getElementById('nm-hd-checkbox');
    const hdStatus = document.getElementById('nm-hd-status');

    function toggleHdQuality() {
      fetch('/mobile/setting.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          'X-Requested-With': 'XMLHttpRequest'
        },
        body: 'hd=hd',
        credentials: 'include'
      })
      .then(function (r) { return r.json(); })
      .then(function (data) {
        const isHd = (data && data.hd === 'on');
        hdCheckbox.checked = isHd;
        hdStatus.textContent = isHd ? 'High-bitrate 1080p active' : 'Standard definition streaming';
        showToast(isHd ? '1080p Full HD Enabled' : '1080p Standard Quality Enabled');
      })
      .catch(function () {
        showToast('Error toggling 1080p setting');
      });
    }

    document.getElementById('nm-1080p-row').addEventListener('click', function (e) {
      if (e.target !== hdCheckbox) {
        toggleHdQuality();
      }
    });
    hdCheckbox.addEventListener('change', function (e) {
      e.stopPropagation();
      toggleHdQuality();
    });

    // Navigation into sub-pages
    function openSubpage(subId) {
      document.querySelectorAll('.nm-subpage').forEach(function (el) {
        el.classList.remove('active');
      });
      const sub = document.getElementById(subId);
      if (sub) {
        sub.classList.add('active');
        window.__NM_SETTINGS_SUBPAGE_OPEN__ = true;
      }
    }

    window.__NM_CLOSE_SUBPAGE__ = function () {
      document.querySelectorAll('.nm-subpage').forEach(function (el) {
        el.classList.remove('active');
      });
      window.__NM_SETTINGS_SUBPAGE_OPEN__ = false;
    };

    window.__NM_CLOSE_SETTINGS__ = function () {
      window.__NM_CLOSE_SUBPAGE__();
      settingsDiv.classList.remove('active');
      window.__NM_SETTINGS_OPEN__ = false;
      document.querySelectorAll('.bottom-navigation-container .link-container').forEach(function (li) {
        li.classList.remove('active');
      });
      const homeLi = document.querySelector('.bottom-navigation-container .link-container:first-child');
      if (homeLi) homeLi.classList.add('active');
    };

    document.getElementById('nm-settings-back').addEventListener('click', window.__NM_CLOSE_SETTINGS__);
    document.getElementById('nm-btn-app-info').addEventListener('click', function () { openSubpage('nm-sub-info'); });
    document.getElementById('nm-btn-app-updates').addEventListener('click', function () {
      openSubpage('nm-sub-updates');
      fetchLatestGitHubRelease();
    });
    document.getElementById('nm-btn-advanced').addEventListener('click', function () {
      openSubpage('nm-sub-advanced');
      initRefreshRateUI();
    });

    // GitHub Release Checker
    function fetchLatestGitHubRelease() {
      const statusText = document.getElementById('nm-update-status-text');
      const resultGroup = document.getElementById('nm-update-result');
      statusText.textContent = 'Checking for updates on GitHub...';

      fetch('https://api.github.com/repos/smartworldarafath/Netmirror/releases/latest')
        .then(function (r) { return r.json(); })
        .then(function (release) {
          if (!release || !release.tag_name) {
            statusText.textContent = 'Unable to check updates (Offline or rate limit).';
            return;
          }

          const latestTag = release.tag_name;
          const releaseName = release.name || latestTag;
          let apkAsset = null;
          if (release.assets && release.assets.length > 0) {
            apkAsset = release.assets.find(function (a) { return a.name.endsWith('.apk'); }) || release.assets[0];
          }
          const downloadUrl = apkAsset ? apkAsset.browser_download_url : release.html_url;

          resultGroup.innerHTML = `
            <div class="nm-item" style="flex-direction:column; align-items:flex-start;">
              <div style="display:flex; justify-content:space-between; width:100%; align-items:center;">
                <div class="nm-item-title" style="color:#e50914;">${releaseName}</div>
                <div style="background:rgba(255,255,255,0.1); padding:4px 8px; border-radius:6px; font-size:12px; font-weight:700;">${latestTag}</div>
              </div>
              <div class="nm-item-subtitle" style="margin-top:6px; max-height:120px; overflow-y:auto;">${(release.body || 'No release notes provided.').replace(/\\n/g, '<br>')}</div>
              <div style="margin-top:14px; width:100%;">
                <button id="nm-download-update-btn" style="width:100%; padding:12px; background:#10b981; color:#fff; border:none; border-radius:10px; font-weight:700; cursor:pointer;">
                  Download & Install Update
                </button>
              </div>
            </div>
          `;

          document.getElementById('nm-download-update-btn').addEventListener('click', function () {
            if (window.NetMirrorNative && window.NetMirrorNative.downloadUpdate) {
              window.NetMirrorNative.downloadUpdate(downloadUrl);
            } else {
              window.open(downloadUrl, '_blank');
            }
          });
        })
        .catch(function () {
          statusText.textContent = 'Could not connect to GitHub. Please check internet.';
        });
    }

    document.getElementById('nm-check-update-btn').addEventListener('click', fetchLatestGitHubRelease);

    // Advanced Refresh Rate UI
    function initRefreshRateUI() {
      let savedRate = localStorage.getItem('nm_pref_hz') || '120';
      highlightRefreshRate(savedRate);

      document.querySelectorAll('#nm-refresh-options .nm-radio-item').forEach(function (item) {
        item.addEventListener('click', function () {
          const target = item.getAttribute('data-rate');
          const intRate = parseInt(target, 10);

          if (window.NetMirrorNative && window.NetMirrorNative.setRefreshRate) {
            const success = window.NetMirrorNative.setRefreshRate(intRate);
            if (success) {
              localStorage.setItem('nm_pref_hz', target);
              highlightRefreshRate(target);
            } else {
              showToast("Your Device Doesn't Support " + target + "Hz");
            }
          } else {
            localStorage.setItem('nm_pref_hz', target);
            highlightRefreshRate(target);
            showToast("Refresh rate set to " + (intRate === 0 ? "VRR (Dynamic)" : target + "Hz"));
          }
        });
      });
    }

    function highlightRefreshRate(rate) {
      document.querySelectorAll('#nm-refresh-options .nm-radio-item').forEach(function (el) {
        if (el.getAttribute('data-rate') === rate.toString()) {
          el.classList.add('selected');
        } else {
          el.classList.remove('selected');
        }
      });
    }
  }

  // ==========================================
  // 6. BOTTOM NAVIGATION HOOKS
  // ==========================================
  function setupBottomNav() {
    document.addEventListener('click', function (e) {
      const link = e.target.closest('.bottom-navigation-container a.nav-link');
      if (!link) return;

      // Handle Settings Button Tap -> Open our modern Settings Screen!
      if (link.classList.contains('setting-btn') || link.textContent.trim().toLowerCase().includes('setting')) {
        e.preventDefault();
        e.stopPropagation();

        createSettingsDOM();
        const settingsScreen = document.getElementById('nm-settings-screen');
        if (settingsScreen) {
          settingsScreen.classList.add('active');
          window.__NM_SETTINGS_OPEN__ = true;
        }

        document.querySelectorAll('.bottom-navigation-container .link-container').forEach(function (li) {
          li.classList.remove('active');
        });
        const parentLi = link.closest('.link-container');
        if (parentLi) parentLi.classList.add('active');
        return;
      }

      // Handle other tabs (Home, Series, Movies) via SPA transition
      const onclickAttr = link.getAttribute('onclick') || '';
      let targetUrl = '';
      const m = onclickAttr.match(/location\.href\s*=\s*['"]([^'"]+)['"]/);
      if (m) targetUrl = m[1];

      if (!targetUrl || onclickAttr.includes('reload')) return;

      e.preventDefault();
      e.stopPropagation();

      // If settings screen is open, close it
      if (window.__NM_SETTINGS_OPEN__) {
        window.__NM_CLOSE_SETTINGS__();
      }

      document.querySelectorAll('.bottom-navigation-container .link-container').forEach(function (li) {
        li.classList.remove('active');
      });
      const parentLi = link.closest('.link-container');
      if (parentLi) parentLi.classList.add('active');

      const mainContainer = document.querySelector('.tray-container') ||
                            document.querySelector('#main') ||
                            document.querySelector('.content') ||
                            document.body;

      mainContainer.style.transition = 'opacity 350ms cubic-bezier(0.16, 1, 0.3, 1), transform 350ms cubic-bezier(0.16, 1, 0.3, 1)';
      mainContainer.style.opacity = '0';
      mainContainer.style.transform = 'translateY(10px) scale(0.99)';

      fetch(targetUrl, {
        headers: { 'X-Requested-With': 'https://net52.cc/streamtape.php' }
      })
      .then(function (r) { return r.text(); })
      .then(function (html) {
        const parser = new DOMParser();
        const doc = parser.parseFromString(html, 'text/html');
        const newTray = doc.querySelector('.tray-container') || doc.querySelector('#main') || doc.querySelector('.content');

        if (newTray && mainContainer) {
          mainContainer.innerHTML = newTray.innerHTML;
          window.history.pushState(null, '', targetUrl);
          window.scrollTo({ top: 0, behavior: 'instant' });

          requestAnimationFrame(function () {
            mainContainer.style.transition = 'opacity 900ms cubic-bezier(0.16, 1, 0.3, 1), transform 900ms cubic-bezier(0.16, 1, 0.3, 1)';
            mainContainer.style.opacity = '1';
            mainContainer.style.transform = 'translateY(0) scale(1)';
          });
        } else {
          window.location.href = targetUrl;
        }
      })
      .catch(function () {
        window.location.href = targetUrl;
      });
    }, true);
  }

  // ==========================================
  // 6.1. VIDEO PLAYER VIEWPORT & NAV SYNC
  // ==========================================
  function setupPlayerNavSync() {
    function updateNavVisibility() {
      const player = document.getElementById('player');
      const bottomNav = document.querySelector('.bottom-navigation-container');
      if (!bottomNav) return;

      const isPlaying = (player && !player.classList.contains('hide')) ||
                        document.body.classList.contains('overflow3') ||
                        document.body.classList.contains('nm-player-active') ||
                        (window.$ && $('#jw').hasClass('jwplayer'));

      if (isPlaying) {
        document.body.classList.add('nm-player-active');
        bottomNav.style.setProperty('display', 'none', 'important');
        bottomNav.style.setProperty('visibility', 'hidden', 'important');
        bottomNav.style.setProperty('opacity', '0', 'important');
        bottomNav.style.setProperty('pointer-events', 'none', 'important');
        bottomNav.style.setProperty('transform', 'translateY(150%)', 'important');
      } else {
        document.body.classList.remove('nm-player-active');
        bottomNav.style.removeProperty('display');
        bottomNav.style.removeProperty('visibility');
        bottomNav.style.removeProperty('opacity');
        bottomNav.style.removeProperty('pointer-events');
        bottomNav.style.removeProperty('transform');
      }
    }

    // 1. Observe mutations on body and player
    try {
      const observer = new MutationObserver(updateNavVisibility);
      observer.observe(document.body, {
        attributes: true,
        subtree: true,
        attributeFilter: ['class', 'style']
      });
    } catch (e) {}

    // 2. Intercept click on play buttons & player back buttons
    document.addEventListener('click', function (e) {
      if (e.target.closest('.model-btn-play2, .btn-play2, .playerstart')) {
        document.body.classList.add('nm-player-active');
        updateNavVisibility();
        setTimeout(updateNavVisibility, 50);
        setTimeout(updateNavVisibility, 200);
        setTimeout(updateNavVisibility, 500);
      }
      if (e.target.closest('.btn-payer-back')) {
        document.body.classList.remove('nm-player-active');
        setTimeout(updateNavVisibility, 50);
        setTimeout(updateNavVisibility, 200);
      }
    }, true);

    // Initial check
    updateNavVisibility();
  }

  // ==========================================
  // 7. COMPREHENSIVE ANDROID BACK GESTURE
  // ==========================================
  window.pressfromAPP = function () {
    // 1. Video player open or active?
    const playerEl = document.getElementById('player');
    const isPlayerVisible = playerEl && !playerEl.classList.contains('hide');
    const hasJw = window.$ && $("#jw").hasClass("jwplayer");
    if (isPlayerVisible || hasJw || (document.body && document.body.classList.contains('overflow3'))) {
      const backBtn = document.querySelector('.btn-payer-back');
      if (backBtn) {
        backBtn.click();
      } else if (window.$) {
        $("#player").addClass("hide");
        $(".body").removeClass("overflow3");
        if (typeof window.jwplayer === 'function') {
          try { window.jwplayer().stop().remove(); } catch (err) {}
        }
      }
      return true;
    }
    // 2. Movie details / trailer modal open?
    if (window.$ && $("#exampleModalScrollable").hasClass("show")) {
      $(".btn-close2").click();
      return true;
    }
    // 3. Search overlay open?
    if (window.$ && $(".search").is(":visible") && $(".search").css("left") === "0px") {
      $(".btn-search-close").click();
      return true;
    }
    // 4. In a Settings Sub-Screen (Info, Updates, Advanced)?
    if (window.__NM_SETTINGS_SUBPAGE_OPEN__) {
      window.__NM_CLOSE_SUBPAGE__();
      return true;
    }
    // 5. In Settings Main Screen?
    if (window.__NM_SETTINGS_OPEN__) {
      window.__NM_CLOSE_SETTINGS__();
      return true;
    }
    // 6. Normal browser history back?
    const isHome = window.location.pathname.includes('/mobile/home') || window.location.pathname === '/';
    if (window.history.length > 1 && !isHome) {
      window.history.back();
      return true;
    }
    // 7. At Root Home -> exit cleanly
    if (window.NetMirrorNative && window.NetMirrorNative.exitApp) {
      window.NetMirrorNative.exitApp();
      return true;
    }
    return false;
  };

  // ==========================================
  // 8. INITIALIZATION
  // ==========================================
  function init() {
    checkAndBypassAd();
    createSettingsDOM();
    setupBottomNav();
    setupPlayerNavSync();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  window.addEventListener('load', init);
})();
