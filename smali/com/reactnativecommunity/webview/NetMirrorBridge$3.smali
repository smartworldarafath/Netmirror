.class Lcom/reactnativecommunity/webview/NetMirrorBridge$3;
.super Ljava/lang/Object;
.source "NetMirrorBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/reactnativecommunity/webview/NetMirrorBridge;->downloadUpdate(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

.field final synthetic val$downloadUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/reactnativecommunity/webview/NetMirrorBridge;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 151
    iput-object p1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$3;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    iput-object p2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$3;->val$downloadUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 155
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    iget-object v2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$3;->val$downloadUrl:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 156
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 157
    iget-object v1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$3;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    invoke-static {v1}, Lcom/reactnativecommunity/webview/NetMirrorBridge;->-$$Nest$fgetmActivity(Lcom/reactnativecommunity/webview/NetMirrorBridge;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    goto :goto_0

    .line 158
    :catchall_0
    move-exception v0

    .line 159
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$3;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    const-string v1, "Failed to open download link"

    invoke-virtual {v0, v1}, Lcom/reactnativecommunity/webview/NetMirrorBridge;->showToast(Ljava/lang/String;)V

    .line 161
    :goto_0
    return-void
.end method
