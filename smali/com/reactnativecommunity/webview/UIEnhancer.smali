.class public Lcom/reactnativecommunity/webview/UIEnhancer;
.super Ljava/lang/Object;
.source "UIEnhancer.java"


# static fields
.field private static sCachedJs:Ljava/lang/String;

.field private static sCookieInitialized:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 10
    const/4 v0, 0x0

    sput-object v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    .line 11
    const/4 v0, 0x0

    sput-boolean v0, Lcom/reactnativecommunity/webview/UIEnhancer;->sCookieInitialized:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static initCookies()V
    .locals 5

    .line 14
    const-string v0, "https://net52.cc"

    sget-boolean v1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCookieInitialized:Z

    if-eqz v1, :cond_0

    return-void

    .line 16
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    .line 17
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 18
    invoke-virtual {v1, v0}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 19
    if-eqz v3, :cond_1

    const-string v4, "t_hash_t="

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 20
    :cond_1
    const-string v3, "t_hash_t=1e004325b9ede3cb0e3a563eff057331%3A%3A49b6d7f28fcaf9aaf18ec550a3f8a4bd%3A%3A1794336163%3A%3Adb%3A%3Am; path=/; domain=net52.cc; expires=Wed, 11-Nov-2026 06:42:43 GMT"

    invoke-virtual {v1, v0, v3}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    invoke-virtual {v1}, Landroid/webkit/CookieManager;->flush()V

    .line 23
    :cond_2
    sput-boolean v2, Lcom/reactnativecommunity/webview/UIEnhancer;->sCookieInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 27
    :goto_0
    return-void
.end method

.method public static inject(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 4

    .line 30
    if-nez p0, :cond_0

    return-void

    .line 32
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/reactnativecommunity/webview/UIEnhancer;->initCookies()V

    .line 33
    sget-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    if-nez p1, :cond_2

    .line 34
    invoke-virtual {p0}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    const-string v0, "enhancer.js"

    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 36
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 37
    const/16 v1, 0x1000

    new-array v1, v1, [B

    .line 39
    :goto_0
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 40
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 43
    const-string p1, "UTF-8"

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    .line 45
    :cond_2
    sget-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    if-eqz p1, :cond_3

    sget-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_3

    .line 46
    sget-object p1, Lcom/reactnativecommunity/webview/UIEnhancer;->sCachedJs:Ljava/lang/String;

    .line 47
    new-instance v0, Lcom/reactnativecommunity/webview/UIEnhancer$1;

    invoke-direct {v0, p0, p1}, Lcom/reactnativecommunity/webview/UIEnhancer$1;-><init>(Landroid/webkit/WebView;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    :cond_3
    goto :goto_1

    .line 57
    :catchall_0
    move-exception p0

    .line 60
    :goto_1
    return-void
.end method
