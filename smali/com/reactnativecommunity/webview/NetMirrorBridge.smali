.class public Lcom/reactnativecommunity/webview/NetMirrorBridge;
.super Ljava/lang/Object;
.source "NetMirrorBridge.java"


# static fields
.field private static final KEY_REFRESH_RATE:Ljava/lang/String; = "display_refresh_rate"

.field private static final PREFS_NAME:Ljava/lang/String; = "NetMirrorSettings"


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field private final mPrefs:Landroid/content/SharedPreferences;


# direct methods
.method static bridge synthetic -$$Nest$fgetmActivity(Lcom/reactnativecommunity/webview/NetMirrorBridge;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPrefs(Lcom/reactnativecommunity/webview/NetMirrorBridge;)Landroid/content/SharedPreferences;
    .locals 0

    iget-object p0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mPrefs:Landroid/content/SharedPreferences;

    return-object p0
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    .line 28
    const-string v0, "NetMirrorSettings"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mPrefs:Landroid/content/SharedPreferences;

    .line 29
    return-void
.end method


# virtual methods
.method public downloadUpdate(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 150
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    new-instance v1, Lcom/reactnativecommunity/webview/NetMirrorBridge$3;

    invoke-direct {v1, p0, p1}, Lcom/reactnativecommunity/webview/NetMirrorBridge$3;-><init>(Lcom/reactnativecommunity/webview/NetMirrorBridge;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 163
    return-void

    .line 150
    :cond_1
    :goto_0
    return-void
.end method

.method public exitApp()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 167
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    new-instance v1, Lcom/reactnativecommunity/webview/NetMirrorBridge$4;

    invoke-direct {v1, p0}, Lcom/reactnativecommunity/webview/NetMirrorBridge$4;-><init>(Lcom/reactnativecommunity/webview/NetMirrorBridge;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 176
    return-void
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 33
    const-string v0, "3.4.0"

    return-object v0
.end method

.method public getCurrentRefreshRate()I
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    const/16 v1, 0x3c

    if-nez v0, :cond_0

    return v1

    .line 85
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 86
    invoke-virtual {v0}, Landroid/view/Display;->getRefreshRate()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    .line 87
    :catchall_0
    move-exception v0

    .line 88
    return v1
.end method

.method public getSupportedRefreshRates()Ljava/lang/String;
    .locals 8
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    const-string v1, "[60]"

    if-nez v0, :cond_0

    return-object v1

    .line 53
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 54
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 55
    const/16 v3, 0x3c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 56
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    const/4 v5, 0x0

    if-lt v3, v4, :cond_2

    .line 57
    invoke-virtual {v0}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    array-length v3, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v6, v0, v4

    .line 60
    invoke-virtual {v6}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 61
    const/16 v7, 0x37

    if-lt v6, v7, :cond_1

    .line 62
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 59
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 67
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 68
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    nop

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v5, v3, :cond_4

    .line 71
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v5, v3, :cond_3

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 74
    :cond_4
    const-string v0, "]"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 76
    :catchall_0
    move-exception v0

    .line 77
    return-object v1
.end method

.method public setRefreshRate(I)Z
    .locals 9
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 96
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 97
    nop

    .line 98
    nop

    .line 100
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    const/16 v4, 0x3c

    const/4 v5, 0x1

    if-lt v2, v3, :cond_3

    .line 101
    invoke-virtual {v0}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v0

    .line 102
    if-eqz v0, :cond_2

    .line 103
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v6, v0, v3

    .line 104
    invoke-virtual {v6}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 105
    sub-int/2addr v7, p1

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    const/4 v8, 0x2

    if-gt v7, v8, :cond_1

    .line 106
    nop

    .line 107
    invoke-virtual {v6}, Landroid/view/Display$Mode;->getModeId()I

    move-result v0

    .line 108
    const/4 v2, 0x1

    goto :goto_1

    .line 103
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 112
    :cond_2
    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_1
    goto :goto_3

    .line 113
    :cond_3
    if-ne p1, v4, :cond_4

    const/4 v2, 0x1

    goto :goto_2

    :cond_4
    const/4 v2, 0x0

    :goto_2
    const/4 v0, 0x0

    .line 116
    :goto_3
    if-nez v2, :cond_5

    if-le p1, v4, :cond_5

    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Your Device Doesn\'t Support "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "Hz"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/reactnativecommunity/webview/NetMirrorBridge;->showToast(Ljava/lang/String;)V

    .line 118
    return v1

    .line 121
    :cond_5
    nop

    .line 122
    iget-object v2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    new-instance v3, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;

    invoke-direct {v3, p0, v0, p1}, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;-><init>(Lcom/reactnativecommunity/webview/NetMirrorBridge;II)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    return v5

    .line 143
    :catchall_0
    move-exception p1

    .line 144
    return v1
.end method

.method public showToast(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge;->mActivity:Landroid/app/Activity;

    new-instance v1, Lcom/reactnativecommunity/webview/NetMirrorBridge$1;

    invoke-direct {v1, p0, p1}, Lcom/reactnativecommunity/webview/NetMirrorBridge$1;-><init>(Lcom/reactnativecommunity/webview/NetMirrorBridge;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 47
    return-void
.end method
