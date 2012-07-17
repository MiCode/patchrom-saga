.class Lcom/google/android/mms/pdu/PduPersister$1;
.super Ljava/lang/Object;
.source "PduPersister.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/mms/pdu/PduPersister;->updateHeaders(Landroid/net/Uri;Lcom/google/android/mms/pdu/SendReq;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/mms/pdu/PduPersister;

.field final synthetic val$addr:Ljava/lang/String;

.field final synthetic val$sub:Ljava/lang/String;

.field final synthetic val$tid:J


# direct methods
.method constructor <init>(Lcom/google/android/mms/pdu/PduPersister;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1238
    iput-object p1, p0, Lcom/google/android/mms/pdu/PduPersister$1;->this$0:Lcom/google/android/mms/pdu/PduPersister;

    iput-object p2, p0, Lcom/google/android/mms/pdu/PduPersister$1;->val$addr:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/mms/pdu/PduPersister$1;->val$sub:Ljava/lang/String;

    iput-wide p4, p0, Lcom/google/android/mms/pdu/PduPersister$1;->val$tid:J

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 1240
    const-string v0, "content://search"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 1241
    .local v2, searchUri:Landroid/net/Uri;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 1242
    .local v3, updateValues:Landroid/content/ContentValues;
    iget-object v0, p0, Lcom/google/android/mms/pdu/PduPersister$1;->this$0:Lcom/google/android/mms/pdu/PduPersister;

    #getter for: Lcom/google/android/mms/pdu/PduPersister;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/google/android/mms/pdu/PduPersister;->access$000(Lcom/google/android/mms/pdu/PduPersister;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/mms/pdu/PduPersister$1;->val$addr:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/provider/Telephony$Mms;->getDisplayAddress(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1243
    .local v6, address:Ljava/lang/String;
    const-string/jumbo v0, "name"

    const/16 v1, 0x3b

    const/16 v4, 0x2c

    invoke-virtual {v6, v1, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1244
    iget-object v0, p0, Lcom/google/android/mms/pdu/PduPersister$1;->val$sub:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "body"

    iget-object v1, p0, Lcom/google/android/mms/pdu/PduPersister$1;->val$sub:Ljava/lang/String;

    invoke-virtual {v3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1247
    :cond_0
    iget-object v0, p0, Lcom/google/android/mms/pdu/PduPersister$1;->this$0:Lcom/google/android/mms/pdu/PduPersister;

    #getter for: Lcom/google/android/mms/pdu/PduPersister;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/google/android/mms/pdu/PduPersister;->access$000(Lcom/google/android/mms/pdu/PduPersister;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/mms/pdu/PduPersister$1;->this$0:Lcom/google/android/mms/pdu/PduPersister;

    #getter for: Lcom/google/android/mms/pdu/PduPersister;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/google/android/mms/pdu/PduPersister;->access$000(Lcom/google/android/mms/pdu/PduPersister;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id  = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v7, p0, Lcom/google/android/mms/pdu/PduPersister$1;->val$tid:J

    invoke-virtual {v4, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lcom/google/android/mms/util/SqliteWrapper;->update(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1248
    return-void
.end method
