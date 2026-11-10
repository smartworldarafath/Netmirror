.class Lcom/reactnativecommunity/webview/NetMirrorBridge$4;
.super Ljava/lang/Object;
.source "NetMirrorBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/reactnativecommunity/webview/NetMirrorBridge;->exitApp()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;


# direct methods
.method constructor <init>(Lcom/reactnativecommunity/webview/NetMirrorBridge;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 168
    iput-object p1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$4;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 172
    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$4;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    invoke-static {v0}, Lcom/reactnativecommunity/webview/NetMirrorBridge;->-$$Nest$fgetmActivity(Lcom/reactnativecommunity/webview/NetMirrorBridge;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 173
    :catchall_0
    move-exception v0

    :goto_0
    nop

    .line 174
    return-void
.end method
