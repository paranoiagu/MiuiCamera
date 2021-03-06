.class public Lcom/google/zxing/ResultPoint;
.super Ljava/lang/Object;
.source "ResultPoint.java"


# instance fields
.field private final x:F

.field private final y:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p1, p0, Lcom/google/zxing/ResultPoint;->x:F

    .line 34
    iput p2, p0, Lcom/google/zxing/ResultPoint;->y:F

    .line 35
    return-void
.end method

.method private static crossProductZ(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .locals 5
    .param p0, "pointA"    # Lcom/google/zxing/ResultPoint;
    .param p1, "pointB"    # Lcom/google/zxing/ResultPoint;
    .param p2, "pointC"    # Lcom/google/zxing/ResultPoint;

    .prologue
    .line 132
    iget v0, p1, Lcom/google/zxing/ResultPoint;->x:F

    .line 133
    .local v0, "bX":F
    iget v1, p1, Lcom/google/zxing/ResultPoint;->y:F

    .line 134
    .local v1, "bY":F
    iget v2, p2, Lcom/google/zxing/ResultPoint;->x:F

    sub-float/2addr v2, v0

    iget v3, p0, Lcom/google/zxing/ResultPoint;->y:F

    sub-float/2addr v3, v1

    mul-float/2addr v2, v3

    iget v3, p2, Lcom/google/zxing/ResultPoint;->y:F

    sub-float/2addr v3, v1

    iget v4, p0, Lcom/google/zxing/ResultPoint;->x:F

    sub-float/2addr v4, v0

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    return v2
.end method

.method public static distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .locals 4
    .param p0, "pattern1"    # Lcom/google/zxing/ResultPoint;
    .param p1, "pattern2"    # Lcom/google/zxing/ResultPoint;

    .prologue
    .line 123
    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    iget v1, p0, Lcom/google/zxing/ResultPoint;->y:F

    iget v2, p1, Lcom/google/zxing/ResultPoint;->x:F

    iget v3, p1, Lcom/google/zxing/ResultPoint;->y:F

    invoke-static {v0, v1, v2, v3}, Lcom/google/zxing/common/detector/MathUtils;->distance(FFFF)F

    move-result v0

    return v0
.end method

.method public static orderBestPatterns([Lcom/google/zxing/ResultPoint;)V
    .locals 12
    .param p0, "patterns"    # [Lcom/google/zxing/ResultPoint;

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 79
    aget-object v7, p0, v9

    aget-object v8, p0, v10

    invoke-static {v7, v8}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v5

    .line 80
    .local v5, "zeroOneDistance":F
    aget-object v7, p0, v10

    aget-object v8, p0, v11

    invoke-static {v7, v8}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v0

    .line 81
    .local v0, "oneTwoDistance":F
    aget-object v7, p0, v9

    aget-object v8, p0, v11

    invoke-static {v7, v8}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v6

    .line 87
    .local v6, "zeroTwoDistance":F
    cmpl-float v7, v0, v5

    if-ltz v7, :cond_1

    cmpl-float v7, v0, v6

    if-ltz v7, :cond_1

    .line 88
    aget-object v2, p0, v9

    .line 89
    .local v2, "pointB":Lcom/google/zxing/ResultPoint;
    aget-object v1, p0, v10

    .line 90
    .local v1, "pointA":Lcom/google/zxing/ResultPoint;
    aget-object v3, p0, v11

    .line 105
    .local v3, "pointC":Lcom/google/zxing/ResultPoint;
    :goto_0
    invoke-static {v1, v2, v3}, Lcom/google/zxing/ResultPoint;->crossProductZ(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v7

    const/4 v8, 0x0

    cmpg-float v7, v7, v8

    if-gez v7, :cond_0

    .line 106
    move-object v4, v1

    .line 107
    .local v4, "temp":Lcom/google/zxing/ResultPoint;
    move-object v1, v3

    .line 108
    move-object v3, v4

    .line 111
    .end local v4    # "temp":Lcom/google/zxing/ResultPoint;
    :cond_0
    aput-object v1, p0, v9

    .line 112
    aput-object v2, p0, v10

    .line 113
    aput-object v3, p0, v11

    .line 114
    return-void

    .line 91
    .end local v1    # "pointA":Lcom/google/zxing/ResultPoint;
    .end local v2    # "pointB":Lcom/google/zxing/ResultPoint;
    .end local v3    # "pointC":Lcom/google/zxing/ResultPoint;
    :cond_1
    cmpl-float v7, v6, v0

    if-ltz v7, :cond_2

    cmpl-float v7, v6, v5

    if-ltz v7, :cond_2

    .line 92
    aget-object v2, p0, v10

    .line 93
    .restart local v2    # "pointB":Lcom/google/zxing/ResultPoint;
    aget-object v1, p0, v9

    .line 94
    .restart local v1    # "pointA":Lcom/google/zxing/ResultPoint;
    aget-object v3, p0, v11

    .restart local v3    # "pointC":Lcom/google/zxing/ResultPoint;
    goto :goto_0

    .line 96
    .end local v1    # "pointA":Lcom/google/zxing/ResultPoint;
    .end local v2    # "pointB":Lcom/google/zxing/ResultPoint;
    .end local v3    # "pointC":Lcom/google/zxing/ResultPoint;
    :cond_2
    aget-object v2, p0, v11

    .line 97
    .restart local v2    # "pointB":Lcom/google/zxing/ResultPoint;
    aget-object v1, p0, v9

    .line 98
    .restart local v1    # "pointA":Lcom/google/zxing/ResultPoint;
    aget-object v3, p0, v10

    .restart local v3    # "pointC":Lcom/google/zxing/ResultPoint;
    goto :goto_0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 47
    instance-of v1, p1, Lcom/google/zxing/ResultPoint;

    if-nez v1, :cond_0

    .line 51
    return v3

    :cond_0
    move-object v0, p1

    .line 48
    check-cast v0, Lcom/google/zxing/ResultPoint;

    .line 49
    .local v0, "otherPoint":Lcom/google/zxing/ResultPoint;
    iget v1, p0, Lcom/google/zxing/ResultPoint;->x:F

    iget v2, v0, Lcom/google/zxing/ResultPoint;->x:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    iget v1, p0, Lcom/google/zxing/ResultPoint;->y:F

    iget v2, v0, Lcom/google/zxing/ResultPoint;->y:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    const/4 v1, 0x1

    return v1

    :cond_1
    return v3
.end method

.method public final getX()F
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    return v0
.end method

.method public final getY()F
    .locals 1

    .prologue
    .line 42
    iget v0, p0, Lcom/google/zxing/ResultPoint;->y:F

    return v0
.end method

.method public final hashCode()I
    .locals 2

    .prologue
    .line 56
    iget v0, p0, Lcom/google/zxing/ResultPoint;->x:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/zxing/ResultPoint;->y:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 62
    .local v0, "result":Ljava/lang/StringBuilder;
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    iget v1, p0, Lcom/google/zxing/ResultPoint;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    iget v1, p0, Lcom/google/zxing/ResultPoint;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 66
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
