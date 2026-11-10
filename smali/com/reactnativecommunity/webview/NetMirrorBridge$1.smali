.class Lcom/reactnativecommunity/webview/NetMirrorBridge$1;
.super Ljava/lang/Object;
.source "NetMirrorBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/reactnativecommunity/webview/NetMirrorBridge;->showToast(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

.field final synthetic val$message:Ljava/lang/String;


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

    .line 39
    iput-object p1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$1;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    iput-object p2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$1;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 43
    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$1;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    invoke-static {v0}, Lcom/reactnativecommunity/webview/NetMirrorBridge;->-$$Nest$fgetmActivity(Lcom/reactnativecommunity/webview/NetMirrorBridge;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$1;->val$message:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 44
    :catchall_0
    move-exception v0

    :goto_0
    nop

    .line 45
    return-void
.end method
