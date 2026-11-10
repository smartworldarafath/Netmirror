.class Lcom/reactnativecommunity/webview/NetMirrorBridge$2;
.super Ljava/lang/Object;
.source "NetMirrorBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/reactnativecommunity/webview/NetMirrorBridge;->setRefreshRate(I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

.field final synthetic val$modeId:I

.field final synthetic val$targetRate:I


# direct methods
.method constructor <init>(Lcom/reactnativecommunity/webview/NetMirrorBridge;II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    iput p2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->val$modeId:I

    iput p3, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->val$targetRate:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 126
    :try_start_0
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    invoke-static {v0}, Lcom/reactnativecommunity/webview/NetMirrorBridge;->-$$Nest$fgetmActivity(Lcom/reactnativecommunity/webview/NetMirrorBridge;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 127
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 128
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_0

    iget v2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->val$modeId:I

    if-eqz v2, :cond_0

    .line 129
    iget v2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->val$modeId:I

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->preferredDisplayModeId:I

    .line 131
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_1

    .line 132
    iget v2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->val$targetRate:I

    int-to-float v2, v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->preferredRefreshRate:F

    .line 134
    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 135
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    invoke-static {v0}, Lcom/reactnativecommunity/webview/NetMirrorBridge;->-$$Nest$fgetmPrefs(Lcom/reactnativecommunity/webview/NetMirrorBridge;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "display_refresh_rate"

    iget v2, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->val$targetRate:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 136
    iget-object v0, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->this$0:Lcom/reactnativecommunity/webview/NetMirrorBridge;

    iget v1, p0, Lcom/reactnativecommunity/webview/NetMirrorBridge$2;->val$targetRate:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Display Refresh Rate Set to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Hz"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/reactnativecommunity/webview/NetMirrorBridge;->showToast(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    goto :goto_0

    .line 137
    :catchall_0
    move-exception v0

    .line 140
    :goto_0
    return-void
.end method
