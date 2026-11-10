.class public Lcom/reactnativecommunity/webview/UIEnhancer;
.super Ljava/lang/Object;
.source "UIEnhancer.java"


# static fields
.field private static sBridgeAttached:Z

.field private static sCachedJs:Ljava/lang/String;

.field private static sCookieInitialized:Z

.field private static sHandler:Landroid/os/Handler;

.field private static sIdleRunnable:Ljava/lang/Runnable;

.field private static sMaxRate:I

.field private static sUserPreferredRate:I


# direct methods
.method static bridge synthetic -$$Nest$sfgetsUserPreferredRate()I
    .locals 1

    sget v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sUserPreferredRate:I

    return v0
.end method

.method static bridge synthetic -$$Nest$sfputsBridgeAttached(Z)V
    .locals 0

    sput-boolean p0, Lcom/reactnativecommunity/webview/UIEnhancer;->sBridgeAttached:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$smboostToMax(Landroid/app/Activity;)V
    .locals 0

    invoke-static {p0}, Lcom/reactnativecommunity/webview/UIEnhancer;->boostToMax(Landroid/app/Activity;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smsetupVrr(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/reactnativecommunity/webview/UIEnhancer;->setupVrr(Landroid/app/Activity;Landroid/webkit/WebView;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 20
    const/4 v0, 0x0

    sput-object v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    .line 21
    const/4 v1, 0x0

    sput-boolean v1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCookieInitialized:Z

    .line 22
    sput-boolean v1, Lcom/reactnativecommunity/webview/UIEnhancer;->sBridgeAttached:Z

    .line 23
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/reactnativecommunity/webview/UIEnhancer;->sHandler:Landroid/os/Handler;

    .line 24
    sput-object v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sIdleRunnable:Ljava/lang/Runnable;

    .line 25
    const/16 v0, 0x3c

    sput v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sMaxRate:I

    .line 26
    sput v1, Lcom/reactnativecommunity/webview/UIEnhancer;->sUserPreferredRate:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyInitialRefreshRate(Landroid/app/Activity;)V
    .locals 10

    .line 45
    if-nez p0, :cond_0

    return-void

    .line 47
    :cond_0
    :try_start_0
    const-string v0, "NetMirrorSettings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 48
    const-string v2, "display_refresh_rate"

    const/16 v3, 0x78

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 49
    sput v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sUserPreferredRate:I

    .line 51
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 52
    nop

    .line 53
    nop

    .line 54
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    const/16 v5, 0x3c

    if-lt v3, v4, :cond_4

    .line 55
    invoke-virtual {v2}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v2

    .line 56
    if-eqz v2, :cond_4

    .line 57
    array-length v3, v2

    const/4 v5, 0x0

    const/16 v6, 0x3c

    :goto_0
    if-ge v1, v3, :cond_3

    aget-object v7, v2, v1

    .line 58
    invoke-virtual {v7}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 59
    if-le v8, v6, :cond_1

    move v6, v8

    .line 60
    :cond_1
    sub-int/2addr v8, v0

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    const/4 v9, 0x2

    if-gt v8, v9, :cond_2

    .line 61
    invoke-virtual {v7}, Landroid/view/Display$Mode;->getModeId()I

    move-result v5

    .line 57
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    move v1, v5

    move v5, v6

    .line 66
    :cond_4
    sput v5, Lcom/reactnativecommunity/webview/UIEnhancer;->sMaxRate:I

    .line 68
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 69
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 70
    if-eqz v1, :cond_5

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v4, :cond_5

    .line 71
    iput v1, v2, Landroid/view/WindowManager$LayoutParams;->preferredDisplayModeId:I

    .line 73
    :cond_5
    if-lez v0, :cond_6

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v1, v3, :cond_6

    .line 74
    int-to-float v0, v0

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->preferredRefreshRate:F

    .line 76
    :cond_6
    invoke-virtual {p0, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 77
    :catchall_0
    move-exception p0

    :goto_1
    nop

    .line 78
    return-void
.end method

.method private static boostToMax(Landroid/app/Activity;)V
    .locals 3

    .line 97
    if-eqz p0, :cond_3

    sget v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sMaxRate:I

    const/16 v1, 0x3c

    if-gt v0, v1, :cond_0

    goto :goto_1

    .line 99
    :cond_0
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    .line 100
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    sget v1, Lcom/reactnativecommunity/webview/UIEnhancer;->sMaxRate:I

    int-to-float v1, v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->preferredRefreshRate:F

    .line 102
    :cond_1
    sget-object v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sIdleRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_2

    .line 103
    sget-object v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/reactnativecommunity/webview/UIEnhancer;->sIdleRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 105
    :cond_2
    new-instance v0, Lcom/reactnativecommunity/webview/UIEnhancer$2;

    invoke-direct {v0, p0}, Lcom/reactnativecommunity/webview/UIEnhancer$2;-><init>(Landroid/app/Activity;)V

    sput-object v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sIdleRunnable:Ljava/lang/Runnable;

    .line 116
    sget-object p0, Lcom/reactnativecommunity/webview/UIEnhancer;->sHandler:Landroid/os/Handler;

    sget-object v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sIdleRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0x5dc

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 117
    :catchall_0
    move-exception p0

    :goto_0
    nop

    .line 118
    return-void

    .line 97
    :cond_3
    :goto_1
    return-void
.end method

.method public static initCookies()V
    .locals 5

    .line 29
    const-string v0, "https://net52.cc"

    sget-boolean v1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCookieInitialized:Z

    if-eqz v1, :cond_0

    return-void

    .line 31
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    .line 32
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 33
    invoke-virtual {v1, v0}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 34
    if-eqz v3, :cond_1

    const-string v4, "t_hash_t="

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 35
    :cond_1
    const-string v3, "t_hash_t=1e004325b9ede3cb0e3a563eff057331%3A%3A49b6d7f28fcaf9aaf18ec550a3f8a4bd%3A%3A1794336163%3A%3Adb%3A%3Am; path=/; domain=net52.cc; expires=Wed, 11-Nov-2026 06:42:43 GMT"

    invoke-virtual {v1, v0, v3}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    invoke-virtual {v1}, Landroid/webkit/CookieManager;->flush()V

    .line 38
    :cond_2
    sput-boolean v2, Lcom/reactnativecommunity/webview/UIEnhancer;->sCookieInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    .line 42
    :goto_0
    return-void
.end method

.method public static inject(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 4

    .line 121
    if-nez p0, :cond_0

    return-void

    .line 123
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/reactnativecommunity/webview/UIEnhancer;->initCookies()V

    .line 125
    invoke-virtual {p0}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 126
    nop

    .line 127
    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_1

    .line 128
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    goto :goto_0

    .line 127
    :cond_1
    const/4 v0, 0x0

    .line 131
    :goto_0
    sget-boolean v1, Lcom/reactnativecommunity/webview/UIEnhancer;->sBridgeAttached:Z

    if-nez v1, :cond_2

    if-eqz v0, :cond_2

    .line 132
    nop

    .line 133
    new-instance v1, Lcom/reactnativecommunity/webview/UIEnhancer$3;

    invoke-direct {v1, p0, v0}, Lcom/reactnativecommunity/webview/UIEnhancer$3;-><init>(Landroid/webkit/WebView;Landroid/app/Activity;)V

    invoke-virtual {p0, v1}, Landroid/webkit/WebView;->post(Ljava/lang/Runnable;)Z

    .line 145
    :cond_2
    sget-object v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 146
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    const-string v0, "enhancer.js"

    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 147
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 148
    const/16 v1, 0x1000

    new-array v1, v1, [B

    .line 150
    :goto_1
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 151
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 153
    :cond_3
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 154
    const-string p1, "UTF-8"

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    .line 157
    :cond_4
    sget-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    if-eqz p1, :cond_5

    sget-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_5

    .line 158
    sget-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    .line 159
    new-instance v0, Lcom/reactnativecommunity/webview/UIEnhancer$4;

    invoke-direct {v0, p0, p1}, Lcom/reactnativecommunity/webview/UIEnhancer$4;-><init>(Landroid/webkit/WebView;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    :cond_5
    goto :goto_2

    .line 168
    :catchall_0
    move-exception p0

    .line 171
    :goto_2
    return-void
.end method

.method private static setupVrr(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .locals 1

    .line 82
    :try_start_0
    new-instance v0, Lcom/reactnativecommunity/webview/UIEnhancer$1;

    invoke-direct {v0, p0}, Lcom/reactnativecommunity/webview/UIEnhancer$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 93
    :catchall_0
    move-exception p0

    :goto_0
    nop

    .line 94
    return-void
.end method
