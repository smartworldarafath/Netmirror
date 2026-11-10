.class Lcom/reactnativecommunity/webview/UIEnhancer$4;
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
.field final synthetic val$script:Ljava/lang/String;

.field final synthetic val$webView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 159
    iput-object p1, p0, Lcom/reactnativecommunity/webview/UIEnhancer$4;->val$webView:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/reactnativecommunity/webview/UIEnhancer$4;->val$script:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 163
    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/UIEnhancer$4;->val$webView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/reactnativecommunity/webview/UIEnhancer$4;->val$script:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 164
    :catchall_0
    move-exception v0

    :goto_0
    nop

    .line 165
    return-void
.end method
