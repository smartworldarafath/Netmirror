.class Lcom/reactnativecommunity/webview/UIEnhancer$3;
.super Ljava/lang/Object;
.source "UIEnhancer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/reactnativecommunity/webview/UIEnhancer;->inject(Landroid/webkit/WebView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Landroid/app/Activity;

.field final synthetic val$webView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/webkit/WebView;Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 133
    iput-object p1, p0, Lcom/reactnativecommunity/webview/UIEnhancer$3;->val$webView:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/reactnativecommunity/webview/UIEnhancer$3;->val$act:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 137
    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/UIEnhancer$3;->val$webView:Landroid/webkit/WebView;

    new-instance v1, Lcom/reactnativecommunity/webview/NetMirrorBridge;

    iget-object v2, p0, Lcom/reactnativecommunity/webview/UIEnhancer$3;->val$act:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lcom/reactnativecommunity/webview/NetMirrorBridge;-><init>(Landroid/app/Activity;)V

    const-string v2, "NetMirrorNative"

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 138
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/reactnativecommunity/webview/UIEnhancer;->-$$Nest$sfputsBridgeAttached(Z)V

    .line 139
    iget-object v0, p0, Lcom/reactnativecommunity/webview/UIEnhancer$3;->val$act:Landroid/app/Activity;

    iget-object v1, p0, Lcom/reactnativecommunity/webview/UIEnhancer$3;->val$webView:Landroid/webkit/WebView;

    invoke-static {v0, v1}, Lcom/reactnativecommunity/webview/UIEnhancer;->-$$Nest$smsetupVrr(Landroid/app/Activity;Landroid/webkit/WebView;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 140
    :catchall_0
    move-exception v0

    :goto_0
    nop

    .line 141
    return-void
.end method
