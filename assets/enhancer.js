/**
 * NetMirror Native UI & Motion Engine v3.2
 * - High-speed Startup Ad Bypass & Background Handshake
 * - 60fps 900ms Physics-based Cubic-Bezier Transitions
 * - Bottom Navigation SPA Routing Engine
 * - Universal Hardware Accelerated Card Interactions
 */
(function () {
  'use strict';

  // Prevent double initialization
  if (window.__NM_ENHANCED__) return;
  window.__NM_ENHANCED__ = true;

  // 1. INJECT HIGH-PRIORITY CSS
  const styleEl = document.createElement('style');
  styleEl.id = 'nm-motion-styles';
  styleEl.textContent = `
    /* 1. Complete suppression of ad box and legacy error dialogs */
    .info2, .adboxing, .dark-bg, #ad-banner-test, .appdownload, .app-download,
    div[style*="max-width:700px"][style*="position:fixed"],
    div[style*="background:rgb(255,0,0)"] {
      display: none !important;
      visibility: hidden !important;
      opacity: 0 !important;
      pointer-events: none !important;
      height: 0 !important;
      max-height: 0 !important;
      overflow: hidden !important;
    }

    /* 2. Global Smooth Scrolling & Momentum */
    * {
      -webkit-tap-highlight-color: transparent !important;
      -webkit-font-smoothing: antialiased !important;
    }

    html, body {
      scroll-behavior: smooth !important;
      overscroll-behavior-y: contain !important;
      background-color: #07070a !important;
    }

    /* 3. Universal 60fps 900ms Hardware-Accelerated Poster Cards */
    .tray-item, .card, .poster, .video-card, .modal-img-poster, .m-c-l, .slider-item {
      will-change: transform, box-shadow !important;
      transform: translateZ(0) !important;
      transition: transform 900ms cubic-bezier(0.16, 1, 0.3, 1), box-shadow 900ms cubic-bezier(0.16, 1, 0.3, 1), filter 900ms cubic-bezier(0.16, 1, 0.3, 1) !important;
      border-radius: 8px !important;
    }

    .tray-item:active, .card:active, .video-card:active, .slider-item:active {
      transform: scale(0.94) translateZ(0) !important;
      transition: transform 180ms cubic-bezier(0.2, 0.8, 0.2, 1) !important;
    }

    /* 4. Bottom Navigation Transitions & Indicator Pill */
    .bottom-navigation-container {
      background: rgba(12, 12, 16, 0.94) !important;
      backdrop-filter: blur(20px) !important;
      -webkit-backdrop-filter: blur(20px) !important;
      border-top: 1px solid rgba(255, 255, 255, 0.08) !important;
      transition: all 400ms cubic-bezier(0.16, 1, 0.3, 1) !important;
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
      position: relative !important;
    }

    .bottom-navigation-container .link-container.active {
      transform: scale(1.1) !important;
    }

    .bottom-navigation-container .link-container.active .iconClass {
      filter: drop-shadow(0 0 8px rgba(229, 9, 20, 0.8)) !important;
    }

    .bottom-navigation-container .link-container:active {
      transform: scale(0.92) !important;
      transition: transform 120ms ease-out !important;
    }

    /* 5. OTT Platform Filter Pills (Netflix, Prime, Disney+) */
    .header-pills a, .top-slider a, .ott-pill {
      will-change: transform, background-color !important;
      transition: all 400ms cubic-bezier(0.16, 1, 0.3, 1) !important;
      border-radius: 20px !important;
    }

    .header-pills a:active, .top-slider a:active, .ott-pill:active {
      transform: scale(0.92) !important;
      transition: transform 150ms ease-out !important;
    }

    /* 6. Modal / Sheet 900ms Smooth Slide-Up Physics */
    .modal.fade .modal-dialog {
      will-change: transform, opacity !important;
      transform: translate3d(0, 100%, 0) !important;
      transition: transform 900ms cubic-bezier(0.16, 1, 0.3, 1), opacity 900ms cubic-bezier(0.16, 1, 0.3, 1) !important;
    }

    .modal.show .modal-dialog {
      transform: translate3d(0, 0, 0) !important;
    }

    .modal-backdrop.fade {
      transition: opacity 900ms cubic-bezier(0.16, 1, 0.3, 1) !important;
      background: rgba(0, 0, 0, 0.75) !important;
      backdrop-filter: blur(16px) !important;
      -webkit-backdrop-filter: blur(16px) !important;
    }

    /* 7. Sleek NetMirror Cinema Loading Overlay */
    #nm-seamless-loader {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background: radial-gradient(circle at center, #14141c 0%, #060608 100%);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      z-index: 99999999;
      transition: opacity 600ms cubic-bezier(0.16, 1, 0.3, 1);
    }

    .nm-logo-glow {
      width: 72px;
      height: 72px;
      margin-bottom: 24px;
      animation: nm-breathe 2s cubic-bezier(0.4, 0, 0.2, 1) infinite;
    }

    @keyframes nm-breathe {
      0%, 100% {
        transform: scale(1);
        filter: drop-shadow(0 0 16px rgba(229, 9, 20, 0.5));
      }
      50% {
        transform: scale(1.08);
        filter: drop-shadow(0 0 32px rgba(229, 9, 20, 0.9));
      }
    }

    .nm-progress-bar {
      width: 180px;
      height: 4px;
      background: rgba(255, 255, 255, 0.12);
      border-radius: 999px;
      overflow: hidden;
      position: relative;
    }

    .nm-progress-fill {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      width: 40%;
      background: linear-gradient(90deg, #e50914, #ff5e62);
      border-radius: 999px;
      animation: nm-slide 1.5s cubic-bezier(0.4, 0, 0.2, 1) infinite;
    }

    @keyframes nm-slide {
      0% { left: -40%; width: 30%; }
      50% { left: 35%; width: 50%; }
      100% { left: 100%; width: 30%; }
    }

    .nm-loader-text {
      color: #e2e8f0;
      font-size: 14px;
      font-weight: 600;
      letter-spacing: 0.5px;
      margin-top: 18px;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
    }

    .nm-loader-subtext {
      color: #94a3b8;
      font-size: 12px;
      margin-top: 6px;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
    }
  `;
  document.head.appendChild(styleEl);

  // 2. CHECK & AUTOMATE AD BYPASS HANDSHAKE
  function checkAndBypassAd() {
    const isUnverified = document.body && (
      document.body.hasAttribute('data-addhash') ||
      document.querySelector('.open-support') ||
      document.querySelector('.info2')
    ) && !document.querySelector('.tray-container, .bottom-navigation-container');

    if (!isUnverified) return;

    // Show sleek branded loader
    if (!document.getElementById('nm-seamless-loader')) {
      const loader = document.createElement('div');
      loader.id = 'nm-seamless-loader';
      loader.innerHTML = `
        <svg class="nm-logo-glow" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M26 15V85L74 15V85" stroke="#E50914" stroke-width="14" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <div class="nm-progress-bar">
          <div class="nm-progress-fill"></div>
        </div>
        <div class="nm-loader-text">Loading NetMirror</div>
        <div class="nm-loader-subtext">Optimizing movies & series...</div>
      `;
      document.body.appendChild(loader);
    }

    const addhash = document.body.getAttribute('data-addhash');
    if (!addhash) return;

    // A. Silent background request to userver
    const userverUrl = 'https://userver.net52.cc/?ffr455=' + encodeURIComponent(addhash) + '&a=y&t=' + Math.random();
    fetch(userverUrl, { mode: 'no-cors' }).catch(function () {});

    // B. Hidden iframe to cleanly execute downstream redirect/partner logic
    const hiddenIframe = document.createElement('iframe');
    hiddenIframe.style.cssText = 'position:fixed;width:1px;height:1px;opacity:0.01;bottom:-999px;pointer-events:none;';
    hiddenIframe.src = userverUrl;
    document.body.appendChild(hiddenIframe);

    // C. Poll verify2.php until "All Done"
    let attempts = 0;
    const maxAttempts = 25;
    const pollInterval = setInterval(function () {
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
          clearInterval(pollInterval);
          location.reload();
        }
      })
      .catch(function () {});

      if (attempts >= maxAttempts) {
        clearInterval(pollInterval);
        location.reload();
      }
    }, 2000);
  }

  // 3. ULTRA-SMOOTH 60FPS 900MS BOTTOM TAB SPA ROUTING
  function setupBottomNavTransitions() {
    document.addEventListener('click', function (e) {
      const link = e.target.closest('.bottom-navigation-container a.nav-link');
      if (!link) return;

      const onclickAttr = link.getAttribute('onclick') || '';
      let targetUrl = '';
      const m = onclickAttr.match(/location\.href\s*=\s*['"]([^'"]+)['"]/);
      if (m) targetUrl = m[1];

      // If it's a setting modal button or reload button, let it behave normally
      if (!targetUrl || link.classList.contains('setting-btn') || onclickAttr.includes('reload')) {
        return;
      }

      e.preventDefault();
      e.stopPropagation();

      // Update active tab state smoothly
      document.querySelectorAll('.bottom-navigation-container .link-container').forEach(function (li) {
        li.classList.remove('active');
      });
      const parentLi = link.closest('.link-container');
      if (parentLi) parentLi.classList.add('active');

      // Play 60fps 400ms exit transition on page content
      const mainContainer = document.querySelector('.tray-container') ||
                            document.querySelector('#main') ||
                            document.querySelector('.content') ||
                            document.body;

      mainContainer.style.transition = 'opacity 350ms cubic-bezier(0.16, 1, 0.3, 1), transform 350ms cubic-bezier(0.16, 1, 0.3, 1)';
      mainContainer.style.opacity = '0';
      mainContainer.style.transform = 'translateY(10px) scale(0.99)';

      // Fetch target page
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

          // Play 60fps 900ms enter animation!
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

  // Run on DOM ready and window load
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function () {
      checkAndBypassAd();
      setupBottomNavTransitions();
    });
  } else {
    checkAndBypassAd();
    setupBottomNavTransitions();
  }

  window.addEventListener('load', function () {
    checkAndBypassAd();
  });
})();
