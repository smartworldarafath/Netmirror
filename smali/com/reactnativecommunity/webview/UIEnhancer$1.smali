.class Lcom/reactnativecommunity/webview/UIEnhancer$1;
.super Ljava/lang/Object;
.source "UIEnhancer.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/reactnativecommunity/webview/UIEnhancer;->setupVrr(Landroid/app/Activity;Landroid/webkit/WebView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 82
    iput-object p1, p0, Lcom/reactnativecommunity/webview/UIEnhancer$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 86
    :try_start_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_1

    .line 87
    :cond_0
    iget-object p1, p0, Lcom/reactnativecommunity/webview/UIEnhancer$1;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/reactnativecommunity/webview/UIEnhancer;->-$$Nest$smboostToMax(Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 89
    :catchall_0
    move-exception p1

    :cond_1
    :goto_0
    nop

    .line 90
    const/4 p1, 0x0

    return p1
.end method
