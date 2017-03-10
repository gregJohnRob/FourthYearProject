; ModuleID = 'host-sw2d.bc'
source_filename = "host-sw2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"15 0 6\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [12 x i8] c"host-sw2d.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [6 x i8] c"1 0 0\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [9 x i8] c"10 -10 6\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [7 x i8] c"10 0 0\00", section "llvm.metadata"
@.str.7 = private unnamed_addr constant [8 x i8] c"100 0 2\00", section "llvm.metadata"
@.str.8 = private unnamed_addr constant [7 x i8] c"10 9 2\00", section "llvm.metadata"
@.str.9 = private unnamed_addr constant [6 x i8] c"0 0 2\00", section "llvm.metadata"
@str = private unnamed_addr constant [25 x i8] c"Host arrays initialized.\00"
@str.10 = private unnamed_addr constant [62 x i8] c"-------------------------------------------------------------\00"

; Function Attrs: norecurse nounwind uwtable
define void @initHzero(i32* nocapture %hzero) local_unnamed_addr #0 {
entry:
  store i32 10, i32* %hzero, align 4, !tbaa !1
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_init_data_host_loop2And3(i32* nocapture %hzero_row0_k, i32* nocapture %hzero_lastRow_k) local_unnamed_addr #0 {
entry:
  store i32 -10, i32* %hzero_lastRow_k, align 4, !tbaa !1
  store i32 -10, i32* %hzero_row0_k, align 4, !tbaa !1
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_init_data_host_eta_etan(i32* nocapture %eta, i32 %hzero, i32* nocapture %etan) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %hzero, 0
  %cond = select i1 %cmp, i32 0, i32 %hzero
  %sub = sub nsw i32 0, %cond
  store i32 %sub, i32* %eta, align 4, !tbaa !1
  store i32 %sub, i32* %etan, align 4, !tbaa !1
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_init_data_host_finalLoop(i32* nocapture %h_j_COLS_k, i32 %hzero_j_COLS_k, i32 %eta_j_COLS_k, i32* nocapture %wet_j_COLS_k, i32 %hmin, i32* nocapture %u, i32* nocapture %un, i32* nocapture %v, i32* nocapture %vn) local_unnamed_addr #0 {
entry:
  %add = add nsw i32 %eta_j_COLS_k, %hzero_j_COLS_k
  store i32 %add, i32* %h_j_COLS_k, align 4, !tbaa !1
  store i32 1, i32* %wet_j_COLS_k, align 4, !tbaa !1
  %0 = load i32, i32* %h_j_COLS_k, align 4, !tbaa !1
  %not.cmp = icmp sge i32 %0, %hmin
  %. = zext i1 %not.cmp to i32
  store i32 %., i32* %wet_j_COLS_k, align 4
  store i32 0, i32* %vn, align 4, !tbaa !1
  store i32 0, i32* %v, align 4, !tbaa !1
  store i32 0, i32* %un, align 4, !tbaa !1
  store i32 0, i32* %u, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host(i32* %hzero, i32* %eta, i32* %etan, i32* %h, i32* %wet, i32* %u, i32* %un, i32* %v, i32* %vn, i32 %hmin, i32 %BytesPerWord) local_unnamed_addr #1 {
entry:
  %hzero.addr = alloca i32*, align 8
  %eta.addr = alloca i32*, align 8
  %etan.addr = alloca i32*, align 8
  %h.addr = alloca i32*, align 8
  %wet.addr = alloca i32*, align 8
  %u.addr = alloca i32*, align 8
  %un.addr = alloca i32*, align 8
  %v.addr = alloca i32*, align 8
  %vn.addr = alloca i32*, align 8
  %hmin.addr = alloca i32, align 4
  %BytesPerWord.addr = alloca i32, align 4
  store i32* %hzero, i32** %hzero.addr, align 8, !tbaa !5
  %hzero.addr1 = bitcast i32** %hzero.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %hzero.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 86)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !5
  %eta.addr2 = bitcast i32** %eta.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eta.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 87)
  store i32* %etan, i32** %etan.addr, align 8, !tbaa !5
  %etan.addr3 = bitcast i32** %etan.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %etan.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 88)
  store i32* %h, i32** %h.addr, align 8, !tbaa !5
  %h.addr4 = bitcast i32** %h.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %h.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 89)
  store i32* %wet, i32** %wet.addr, align 8, !tbaa !5
  %wet.addr5 = bitcast i32** %wet.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %wet.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 90)
  store i32* %u, i32** %u.addr, align 8, !tbaa !5
  %u.addr6 = bitcast i32** %u.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 91)
  store i32* %un, i32** %un.addr, align 8, !tbaa !5
  %un.addr7 = bitcast i32** %un.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %un.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 92)
  store i32* %v, i32** %v.addr, align 8, !tbaa !5
  %v.addr8 = bitcast i32** %v.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %v.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 93)
  store i32* %vn, i32** %vn.addr, align 8, !tbaa !5
  %vn.addr9 = bitcast i32** %vn.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 94)
  store i32 %hmin, i32* %hmin.addr, align 4, !tbaa !1
  %hmin.addr10 = bitcast i32* %hmin.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %hmin.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 95)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !1
  %BytesPerWord.addr11 = bitcast i32* %BytesPerWord.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 96)
  %0 = load i32*, i32** %hzero.addr, align 8, !tbaa !5
  br label %for.cond12.preheader

for.cond12.preheader:                             ; preds = %for.inc15, %entry
  %indvars.iv196 = phi i64 [ 0, %entry ], [ %indvars.iv.next197, %for.inc15 ]
  %1 = shl i64 %indvars.iv196, 9
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond12.preheader
  %index = phi i64 [ 0, %for.cond12.preheader ], [ %index.next.3, %vector.body ]
  %2 = add nuw nsw i64 %index, %1
  %3 = getelementptr inbounds i32, i32* %0, i64 %2
  %4 = bitcast i32* %3 to <4 x i32>*
  store <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32>* %4, align 4, !tbaa !1
  %5 = getelementptr i32, i32* %3, i64 4
  %6 = bitcast i32* %5 to <4 x i32>*
  store <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32>* %6, align 4, !tbaa !1
  %index.next = or i64 %index, 8
  %7 = add nuw nsw i64 %index.next, %1
  %8 = getelementptr inbounds i32, i32* %0, i64 %7
  %9 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32>* %9, align 4, !tbaa !1
  %10 = getelementptr i32, i32* %8, i64 4
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32>* %11, align 4, !tbaa !1
  %index.next.1 = or i64 %index, 16
  %12 = add nuw nsw i64 %index.next.1, %1
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  %14 = bitcast i32* %13 to <4 x i32>*
  store <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32>* %14, align 4, !tbaa !1
  %15 = getelementptr i32, i32* %13, i64 4
  %16 = bitcast i32* %15 to <4 x i32>*
  store <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32>* %16, align 4, !tbaa !1
  %index.next.2 = or i64 %index, 24
  %17 = add nuw nsw i64 %index.next.2, %1
  %18 = getelementptr inbounds i32, i32* %0, i64 %17
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32>* %19, align 4, !tbaa !1
  %20 = getelementptr i32, i32* %18, i64 4
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32>* %21, align 4, !tbaa !1
  %index.next.3 = add nsw i64 %index, 32
  %22 = icmp eq i64 %index.next.3, 512
  br i1 %22, label %for.inc15, label %vector.body, !llvm.loop !7

for.inc15:                                        ; preds = %vector.body
  %indvars.iv.next197 = add nuw nsw i64 %indvars.iv196, 1
  %exitcond199 = icmp eq i64 %indvars.iv.next197, 512
  br i1 %exitcond199, label %vector.body201.preheader, label %for.cond12.preheader

vector.body201.preheader:                         ; preds = %for.inc15
  br label %vector.body201

vector.body201:                                   ; preds = %vector.body201, %vector.body201.preheader
  %index206 = phi i64 [ 0, %vector.body201.preheader ], [ %index.next207.3, %vector.body201 ]
  %23 = getelementptr inbounds i32, i32* %0, i64 %index206
  %24 = add nuw nsw i64 %index206, 261632
  %25 = getelementptr inbounds i32, i32* %0, i64 %24
  %26 = bitcast i32* %25 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %26, align 4, !tbaa !1
  %27 = getelementptr i32, i32* %25, i64 4
  %28 = bitcast i32* %27 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %28, align 4, !tbaa !1
  %29 = bitcast i32* %23 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %29, align 4, !tbaa !1
  %30 = getelementptr i32, i32* %23, i64 4
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %31, align 4, !tbaa !1
  %index.next207 = or i64 %index206, 8
  %32 = getelementptr inbounds i32, i32* %0, i64 %index.next207
  %33 = add nsw i64 %index206, 261640
  %34 = getelementptr inbounds i32, i32* %0, i64 %33
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %35, align 4, !tbaa !1
  %36 = getelementptr i32, i32* %34, i64 4
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %37, align 4, !tbaa !1
  %38 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %38, align 4, !tbaa !1
  %39 = getelementptr i32, i32* %32, i64 4
  %40 = bitcast i32* %39 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %40, align 4, !tbaa !1
  %index.next207.1 = or i64 %index206, 16
  %41 = getelementptr inbounds i32, i32* %0, i64 %index.next207.1
  %42 = add nsw i64 %index206, 261648
  %43 = getelementptr inbounds i32, i32* %0, i64 %42
  %44 = bitcast i32* %43 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %44, align 4, !tbaa !1
  %45 = getelementptr i32, i32* %43, i64 4
  %46 = bitcast i32* %45 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %46, align 4, !tbaa !1
  %47 = bitcast i32* %41 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %47, align 4, !tbaa !1
  %48 = getelementptr i32, i32* %41, i64 4
  %49 = bitcast i32* %48 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %49, align 4, !tbaa !1
  %index.next207.2 = or i64 %index206, 24
  %50 = getelementptr inbounds i32, i32* %0, i64 %index.next207.2
  %51 = add nsw i64 %index206, 261656
  %52 = getelementptr inbounds i32, i32* %0, i64 %51
  %53 = bitcast i32* %52 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %53, align 4, !tbaa !1
  %54 = getelementptr i32, i32* %52, i64 4
  %55 = bitcast i32* %54 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %55, align 4, !tbaa !1
  %56 = bitcast i32* %50 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %56, align 4, !tbaa !1
  %57 = getelementptr i32, i32* %50, i64 4
  %58 = bitcast i32* %57 to <4 x i32>*
  store <4 x i32> <i32 -10, i32 -10, i32 -10, i32 -10>, <4 x i32>* %58, align 4, !tbaa !1
  %index.next207.3 = add nsw i64 %index206, 32
  %59 = icmp eq i64 %index.next207.3, 512
  br i1 %59, label %for.body32.preheader, label %vector.body201, !llvm.loop !10

for.body32.preheader:                             ; preds = %vector.body201
  br label %for.body32

for.cond44.preheader:                             ; preds = %for.body32
  %60 = load i32*, i32** %eta.addr, align 8, !tbaa !5
  %61 = load i32*, i32** %etan.addr, align 8, !tbaa !5
  br label %for.cond47.preheader

for.body32:                                       ; preds = %for.body32, %for.body32.preheader
  %indvars.iv183 = phi i64 [ 0, %for.body32.preheader ], [ %indvars.iv.next184.3, %for.body32 ]
  %62 = shl nsw i64 %indvars.iv183, 9
  %arrayidx36 = getelementptr inbounds i32, i32* %0, i64 %62
  %63 = or i64 %62, 511
  %arrayidx40 = getelementptr inbounds i32, i32* %0, i64 %63
  store i32 -10, i32* %arrayidx40, align 4, !tbaa !1
  store i32 -10, i32* %arrayidx36, align 4, !tbaa !1
  %indvars.iv.next184 = shl i64 %indvars.iv183, 9
  %64 = or i64 %indvars.iv.next184, 512
  %arrayidx36.1 = getelementptr inbounds i32, i32* %0, i64 %64
  %65 = or i64 %indvars.iv.next184, 1023
  %arrayidx40.1 = getelementptr inbounds i32, i32* %0, i64 %65
  store i32 -10, i32* %arrayidx40.1, align 4, !tbaa !1
  store i32 -10, i32* %arrayidx36.1, align 4, !tbaa !1
  %indvars.iv.next184.1 = shl i64 %indvars.iv183, 9
  %66 = or i64 %indvars.iv.next184.1, 1024
  %arrayidx36.2 = getelementptr inbounds i32, i32* %0, i64 %66
  %67 = or i64 %indvars.iv.next184.1, 1535
  %arrayidx40.2 = getelementptr inbounds i32, i32* %0, i64 %67
  store i32 -10, i32* %arrayidx40.2, align 4, !tbaa !1
  store i32 -10, i32* %arrayidx36.2, align 4, !tbaa !1
  %indvars.iv.next184.2 = shl i64 %indvars.iv183, 9
  %68 = or i64 %indvars.iv.next184.2, 1536
  %arrayidx36.3 = getelementptr inbounds i32, i32* %0, i64 %68
  %69 = or i64 %indvars.iv.next184.2, 2047
  %arrayidx40.3 = getelementptr inbounds i32, i32* %0, i64 %69
  store i32 -10, i32* %arrayidx40.3, align 4, !tbaa !1
  store i32 -10, i32* %arrayidx36.3, align 4, !tbaa !1
  %indvars.iv.next184.3 = add nsw i64 %indvars.iv183, 4
  %exitcond187.3 = icmp eq i64 %indvars.iv.next184.3, 512
  br i1 %exitcond187.3, label %for.cond44.preheader, label %for.body32

for.cond47.preheader:                             ; preds = %for.inc65, %for.cond44.preheader
  %indvars.iv179 = phi i64 [ 0, %for.cond44.preheader ], [ %indvars.iv.next180, %for.inc65 ]
  %70 = shl i64 %indvars.iv179, 9
  %scevgep = getelementptr i32, i32* %60, i64 %70
  %71 = add i64 %70, 512
  %scevgep220 = getelementptr i32, i32* %60, i64 %71
  %scevgep222 = getelementptr i32, i32* %61, i64 %70
  %scevgep224 = getelementptr i32, i32* %61, i64 %71
  %scevgep226 = getelementptr i32, i32* %0, i64 %70
  %scevgep228 = getelementptr i32, i32* %0, i64 %71
  %72 = shl i64 %indvars.iv179, 9
  %bound0 = icmp ult i32* %scevgep, %scevgep224
  %bound1 = icmp ult i32* %scevgep222, %scevgep220
  %found.conflict = and i1 %bound0, %bound1
  %bound0230 = icmp ult i32* %scevgep, %scevgep228
  %bound1231 = icmp ult i32* %scevgep226, %scevgep220
  %found.conflict232 = and i1 %bound0230, %bound1231
  %conflict.rdx = or i1 %found.conflict, %found.conflict232
  %bound0233 = icmp ult i32* %scevgep222, %scevgep228
  %bound1234 = icmp ult i32* %scevgep226, %scevgep224
  %found.conflict235 = and i1 %bound0233, %bound1234
  %conflict.rdx236 = or i1 %conflict.rdx, %found.conflict235
  br i1 %conflict.rdx236, label %for.body49.preheader, label %vector.body214.preheader

vector.body214.preheader:                         ; preds = %for.cond47.preheader
  br label %vector.body214

for.body49.preheader:                             ; preds = %for.cond47.preheader
  br label %for.body49

vector.body214:                                   ; preds = %vector.body214.preheader, %vector.body214
  %index238 = phi i64 [ %index.next239, %vector.body214 ], [ 0, %vector.body214.preheader ]
  %73 = add nuw nsw i64 %index238, %72
  %74 = getelementptr inbounds i32, i32* %60, i64 %73
  %75 = getelementptr inbounds i32, i32* %0, i64 %73
  %76 = bitcast i32* %75 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %76, align 4, !tbaa !1, !alias.scope !11
  %77 = getelementptr i32, i32* %75, i64 4
  %78 = bitcast i32* %77 to <4 x i32>*
  %wide.load246 = load <4 x i32>, <4 x i32>* %78, align 4, !tbaa !1, !alias.scope !11
  %79 = getelementptr inbounds i32, i32* %61, i64 %73
  %80 = icmp sgt <4 x i32> %wide.load, zeroinitializer
  %81 = icmp sgt <4 x i32> %wide.load246, zeroinitializer
  %82 = select <4 x i1> %80, <4 x i32> zeroinitializer, <4 x i32> %wide.load
  %83 = select <4 x i1> %81, <4 x i32> zeroinitializer, <4 x i32> %wide.load246
  %84 = sub nsw <4 x i32> zeroinitializer, %82
  %85 = sub nsw <4 x i32> zeroinitializer, %83
  %86 = bitcast i32* %74 to <4 x i32>*
  store <4 x i32> %84, <4 x i32>* %86, align 4, !tbaa !1, !alias.scope !14, !noalias !16
  %87 = getelementptr i32, i32* %74, i64 4
  %88 = bitcast i32* %87 to <4 x i32>*
  store <4 x i32> %85, <4 x i32>* %88, align 4, !tbaa !1, !alias.scope !14, !noalias !16
  %89 = bitcast i32* %79 to <4 x i32>*
  store <4 x i32> %84, <4 x i32>* %89, align 4, !tbaa !1, !alias.scope !18, !noalias !11
  %90 = getelementptr i32, i32* %79, i64 4
  %91 = bitcast i32* %90 to <4 x i32>*
  store <4 x i32> %85, <4 x i32>* %91, align 4, !tbaa !1, !alias.scope !18, !noalias !11
  %index.next239 = add i64 %index238, 8
  %92 = icmp eq i64 %index.next239, 512
  br i1 %92, label %for.inc65.loopexit247, label %vector.body214, !llvm.loop !19

for.cond68.preheader:                             ; preds = %for.inc65
  %93 = load i32*, i32** %h.addr, align 8, !tbaa !5
  %94 = load i32*, i32** %wet.addr, align 8, !tbaa !5
  %95 = load i32*, i32** %u.addr, align 8, !tbaa !5
  %96 = load i32*, i32** %un.addr, align 8, !tbaa !5
  %97 = load i32*, i32** %v.addr, align 8, !tbaa !5
  %98 = load i32*, i32** %vn.addr, align 8, !tbaa !5
  br label %for.cond71.preheader

for.body49:                                       ; preds = %for.body49, %for.body49.preheader
  %indvars.iv175 = phi i64 [ 0, %for.body49.preheader ], [ %indvars.iv.next176.1, %for.body49 ]
  %99 = add nuw nsw i64 %indvars.iv175, %72
  %arrayidx53 = getelementptr inbounds i32, i32* %60, i64 %99
  %arrayidx57 = getelementptr inbounds i32, i32* %0, i64 %99
  %100 = load i32, i32* %arrayidx57, align 4, !tbaa !1
  %arrayidx61 = getelementptr inbounds i32, i32* %61, i64 %99
  %cmp.i = icmp sgt i32 %100, 0
  %cond.i = select i1 %cmp.i, i32 0, i32 %100
  %sub.i = sub nsw i32 0, %cond.i
  store i32 %sub.i, i32* %arrayidx53, align 4, !tbaa !1
  store i32 %sub.i, i32* %arrayidx61, align 4, !tbaa !1
  %indvars.iv.next176 = or i64 %indvars.iv175, 1
  %101 = add nuw nsw i64 %indvars.iv.next176, %72
  %arrayidx53.1 = getelementptr inbounds i32, i32* %60, i64 %101
  %arrayidx57.1 = getelementptr inbounds i32, i32* %0, i64 %101
  %102 = load i32, i32* %arrayidx57.1, align 4, !tbaa !1
  %arrayidx61.1 = getelementptr inbounds i32, i32* %61, i64 %101
  %cmp.i.1 = icmp sgt i32 %102, 0
  %cond.i.1 = select i1 %cmp.i.1, i32 0, i32 %102
  %sub.i.1 = sub nsw i32 0, %cond.i.1
  store i32 %sub.i.1, i32* %arrayidx53.1, align 4, !tbaa !1
  store i32 %sub.i.1, i32* %arrayidx61.1, align 4, !tbaa !1
  %indvars.iv.next176.1 = add nsw i64 %indvars.iv175, 2
  %exitcond178.1 = icmp eq i64 %indvars.iv.next176.1, 512
  br i1 %exitcond178.1, label %for.inc65.loopexit, label %for.body49, !llvm.loop !20

for.inc65.loopexit:                               ; preds = %for.body49
  br label %for.inc65

for.inc65.loopexit247:                            ; preds = %vector.body214
  br label %for.inc65

for.inc65:                                        ; preds = %for.inc65.loopexit247, %for.inc65.loopexit
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next180, 512
  br i1 %exitcond182, label %for.cond68.preheader, label %for.cond47.preheader

for.cond71.preheader:                             ; preds = %for.inc109, %for.cond68.preheader
  %indvars.iv171 = phi i64 [ 0, %for.cond68.preheader ], [ %indvars.iv.next172, %for.inc109 ]
  %103 = shl i64 %indvars.iv171, 9
  br label %for.body73

for.body73:                                       ; preds = %for.body73, %for.cond71.preheader
  %indvars.iv = phi i64 [ 0, %for.cond71.preheader ], [ %indvars.iv.next, %for.body73 ]
  %104 = add nuw nsw i64 %indvars.iv, %103
  %arrayidx77 = getelementptr inbounds i32, i32* %93, i64 %104
  %arrayidx81 = getelementptr inbounds i32, i32* %0, i64 %104
  %105 = load i32, i32* %arrayidx81, align 4, !tbaa !1
  %arrayidx85 = getelementptr inbounds i32, i32* %60, i64 %104
  %106 = load i32, i32* %arrayidx85, align 4, !tbaa !1
  %arrayidx89 = getelementptr inbounds i32, i32* %94, i64 %104
  %107 = load i32, i32* %hmin.addr, align 4, !tbaa !1
  %arrayidx93 = getelementptr inbounds i32, i32* %95, i64 %104
  %arrayidx97 = getelementptr inbounds i32, i32* %96, i64 %104
  %arrayidx101 = getelementptr inbounds i32, i32* %97, i64 %104
  %arrayidx105 = getelementptr inbounds i32, i32* %98, i64 %104
  %add.i = add nsw i32 %106, %105
  store i32 %add.i, i32* %arrayidx77, align 4, !tbaa !1
  store i32 1, i32* %arrayidx89, align 4, !tbaa !1
  %108 = load i32, i32* %arrayidx77, align 4, !tbaa !1
  %not.cmp.i = icmp sge i32 %108, %107
  %..i = zext i1 %not.cmp.i to i32
  store i32 %..i, i32* %arrayidx89, align 4
  store i32 0, i32* %arrayidx105, align 4, !tbaa !1
  store i32 0, i32* %arrayidx101, align 4, !tbaa !1
  store i32 0, i32* %arrayidx97, align 4, !tbaa !1
  store i32 0, i32* %arrayidx93, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond, label %for.inc109, label %for.body73

for.inc109:                                       ; preds = %for.body73
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, 512
  br i1 %exitcond174, label %for.end111, label %for.cond71.preheader

for.end111:                                       ; preds = %for.inc109
  %puts = call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str, i64 0, i64 0))
  %puts157 = call i32 @puts(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @str.10, i64 0, i64 0))
  ret void
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_dyn_host_firstLoop(i32* nocapture %du, i32* nocapture %dv, i32 %dt, i32 %g, i32 %eta_jCOLS_k_1, i32 %eta_jCOLS_k, i32 %eta_j1COLS_k, i32 %dx, i32 %dy) local_unnamed_addr #0 {
entry:
  %sub = sub i32 0, %dt
  %mul = mul nsw i32 %sub, %g
  %sub1 = sub nsw i32 %eta_jCOLS_k_1, %eta_jCOLS_k
  %mul2 = mul nsw i32 %sub1, %mul
  %div = sdiv i32 %mul2, %dx
  store i32 %div, i32* %du, align 4, !tbaa !1
  %sub5 = sub nsw i32 %eta_j1COLS_k, %eta_jCOLS_k
  %mul6 = mul nsw i32 %sub5, %mul
  %div7 = sdiv i32 %mul6, %dy
  store i32 %div7, i32* %dv, align 4, !tbaa !1
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_dyn_host_secondLoop(i32* nocapture %un_jCOLS_k, i32 %u_jCOLS_k, i32 %du_jCOLS_k, i32 %wet_jCOLS_k, i32 %wet_jCOLS_k_1, i32* nocapture %vn, i32 %v_jCOLS_k, i32* nocapture readonly %dv) local_unnamed_addr #0 {
entry:
  store i32 0, i32* %un_jCOLS_k, align 4, !tbaa !1
  %cmp = icmp eq i32 %wet_jCOLS_k, 1
  %cmp1 = icmp eq i32 %wet_jCOLS_k_1, 1
  %cmp2 = icmp sgt i32 %du_jCOLS_k, 0
  %or.cond = or i1 %cmp2, %cmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %or.cond, label %if.then3, label %if.then12

if.then3:                                         ; preds = %if.then
  %add = add nsw i32 %du_jCOLS_k, %u_jCOLS_k
  store i32 %add, i32* %un_jCOLS_k, align 4, !tbaa !1
  br label %if.then12

if.else:                                          ; preds = %entry
  br i1 %or.cond, label %if.then7, label %if.else19

if.then7:                                         ; preds = %if.else
  %add8 = add nsw i32 %du_jCOLS_k, %u_jCOLS_k
  store i32 %add8, i32* %un_jCOLS_k, align 4, !tbaa !1
  br label %if.else19

if.then12:                                        ; preds = %if.then3, %if.then
  store i32 0, i32* %vn, align 4, !tbaa !1
  %0 = load i32, i32* %dv, align 4, !tbaa !1
  %cmp15 = icmp sgt i32 %0, 0
  %or.cond28 = or i1 %cmp1, %cmp15
  br i1 %or.cond28, label %if.then16, label %if.end26

if.then16:                                        ; preds = %if.then12
  %add17 = add nsw i32 %0, %v_jCOLS_k
  store i32 %add17, i32* %vn, align 4, !tbaa !1
  br label %if.end26

if.else19:                                        ; preds = %if.else, %if.then7
  store i32 0, i32* %vn, align 4, !tbaa !1
  %1 = load i32, i32* %dv, align 4, !tbaa !1
  %cmp22 = icmp slt i32 %1, 0
  %or.cond29 = or i1 %cmp1, %cmp22
  br i1 %or.cond29, label %if.then23, label %if.end26

if.then23:                                        ; preds = %if.else19
  %add24 = add nsw i32 %1, %v_jCOLS_k
  store i32 %add24, i32* %vn, align 4, !tbaa !1
  br label %if.end26

if.end26:                                         ; preds = %if.then23, %if.else19, %if.then16, %if.then12
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_dyn_host_finalLoop(i32 %dx, i32 %dy, i32 %dt, i32 %un_jCOLS_k, i32 %un_jCOLS_k_neg1, i32 %vn_jCOLS_k, i32 %vn_neg1_jCOLS_k, i32 %h_jCOLS_k, i32 %h_jCOLS_k_1, i32 %h_jCOLS_k_neg1, i32 %h_jCOLS_1_k, i32 %h_neg1_jCOLS_k, i32* nocapture %etan, i32* nocapture readonly %eta) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %un_jCOLS_k, -1
  %sub = sub nsw i32 0, %un_jCOLS_k
  %cond = select i1 %cmp, i32 %un_jCOLS_k, i32 %sub
  %add = add nsw i32 %cond, %un_jCOLS_k
  %mul = mul nsw i32 %add, %h_jCOLS_k
  %div = sdiv i32 %mul, 2
  %sub7 = sub nsw i32 %un_jCOLS_k, %cond
  %mul8 = mul nsw i32 %sub7, %h_jCOLS_k_1
  %div9 = sdiv i32 %mul8, 2
  %cmp11 = icmp sgt i32 %un_jCOLS_k_neg1, -1
  %sub14 = sub nsw i32 0, %un_jCOLS_k_neg1
  %cond16 = select i1 %cmp11, i32 %un_jCOLS_k_neg1, i32 %sub14
  %add17 = add nsw i32 %cond16, %un_jCOLS_k_neg1
  %mul18 = mul nsw i32 %add17, %h_jCOLS_k_neg1
  %sub26 = sub nsw i32 %un_jCOLS_k_neg1, %cond16
  %mul27 = mul nsw i32 %sub26, %h_jCOLS_k
  %cmp30 = icmp sgt i32 %vn_jCOLS_k, -1
  %sub33 = sub nsw i32 0, %vn_jCOLS_k
  %cond35 = select i1 %cmp30, i32 %vn_jCOLS_k, i32 %sub33
  %add36 = add nsw i32 %cond35, %vn_jCOLS_k
  %mul37 = mul nsw i32 %add36, %h_jCOLS_k
  %div38 = sdiv i32 %mul37, 2
  %sub45 = sub nsw i32 %vn_jCOLS_k, %cond35
  %mul46 = mul nsw i32 %sub45, %h_jCOLS_1_k
  %div47 = sdiv i32 %mul46, 2
  %cmp49 = icmp sgt i32 %vn_neg1_jCOLS_k, -1
  %sub52 = sub nsw i32 0, %vn_neg1_jCOLS_k
  %cond54 = select i1 %cmp49, i32 %vn_neg1_jCOLS_k, i32 %sub52
  %add55 = add nsw i32 %cond54, %vn_neg1_jCOLS_k
  %mul56 = mul nsw i32 %add55, %h_neg1_jCOLS_k
  %sub64 = sub nsw i32 %vn_neg1_jCOLS_k, %cond54
  %mul65 = mul nsw i32 %sub64, %h_jCOLS_k
  %0 = load i32, i32* %eta, align 4, !tbaa !1
  %div28.neg = sdiv i32 %mul27, -2
  %div19.neg = sdiv i32 %mul18, -2
  %add29.neg = add i32 %div28.neg, %div
  %add10 = add i32 %add29.neg, %div9
  %sub68 = add i32 %add10, %div19.neg
  %mul69 = mul nsw i32 %sub68, %dt
  %div70 = sdiv i32 %mul69, %dx
  %sub71 = sub i32 %0, %div70
  %div66.neg = sdiv i32 %mul65, -2
  %div57.neg = sdiv i32 %mul56, -2
  %add67.neg = add i32 %div66.neg, %div38
  %add48 = add i32 %add67.neg, %div47
  %sub72 = add i32 %add48, %div57.neg
  %mul73 = mul nsw i32 %sub72, %dt
  %div74 = sdiv i32 %mul73, %dy
  %sub75 = sub i32 %sub71, %div74
  store i32 %sub75, i32* %etan, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host(i32 %dt, i32 %dx, i32 %dy, i32 %g, i32* %eta, i32* %un, i32* %u, i32* %wet, i32* %v, i32* %vn, i32* %h, i32* %etan, i32 %BytesPerWord) local_unnamed_addr #1 {
entry:
  %dt.addr = alloca i32, align 4
  %dx.addr = alloca i32, align 4
  %dy.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %eta.addr = alloca i32*, align 8
  %un.addr = alloca i32*, align 8
  %u.addr = alloca i32*, align 8
  %wet.addr = alloca i32*, align 8
  %v.addr = alloca i32*, align 8
  %vn.addr = alloca i32*, align 8
  %h.addr = alloca i32*, align 8
  %etan.addr = alloca i32*, align 8
  %BytesPerWord.addr = alloca i32, align 4
  %du = alloca i32*, align 8
  %dv = alloca i32*, align 8
  store i32 %dt, i32* %dt.addr, align 4, !tbaa !1
  %dt.addr1 = bitcast i32* %dt.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %dt.addr1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 310)
  store i32 %dx, i32* %dx.addr, align 4, !tbaa !1
  %dx.addr2 = bitcast i32* %dx.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %dx.addr2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 311)
  store i32 %dy, i32* %dy.addr, align 4, !tbaa !1
  %dy.addr3 = bitcast i32* %dy.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %dy.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 312)
  store i32 %g, i32* %g.addr, align 4, !tbaa !1
  %g.addr4 = bitcast i32* %g.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 313)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !5
  %eta.addr5 = bitcast i32** %eta.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eta.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 314)
  store i32* %un, i32** %un.addr, align 8, !tbaa !5
  %un.addr6 = bitcast i32** %un.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %un.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 315)
  store i32* %u, i32** %u.addr, align 8, !tbaa !5
  %u.addr7 = bitcast i32** %u.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %u.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 316)
  store i32* %wet, i32** %wet.addr, align 8, !tbaa !5
  %wet.addr8 = bitcast i32** %wet.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 317)
  store i32* %v, i32** %v.addr, align 8, !tbaa !5
  %v.addr9 = bitcast i32** %v.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %v.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 318)
  store i32* %vn, i32** %vn.addr, align 8, !tbaa !5
  %vn.addr10 = bitcast i32** %vn.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %vn.addr10, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 319)
  store i32* %h, i32** %h.addr, align 8, !tbaa !5
  %h.addr11 = bitcast i32** %h.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %h.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 320)
  store i32* %etan, i32** %etan.addr, align 8, !tbaa !5
  %etan.addr12 = bitcast i32** %etan.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %etan.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 321)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !1
  %BytesPerWord.addr13 = bitcast i32* %BytesPerWord.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 322)
  %0 = bitcast i32** %du to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #2
  %1 = bitcast i32** %dv to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #2
  %2 = bitcast i32** %du to i8**
  %3 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !1
  %mul = shl nsw i32 %3, 18
  %conv = sext i32 %mul to i64
  %call = call i32 @posix_memalign(i8** nonnull %2, i64 64, i64 %conv) #2
  %4 = bitcast i32** %dv to i8**
  %5 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !1
  %mul14 = shl nsw i32 %5, 18
  %conv15 = sext i32 %mul14 to i64
  %call16 = call i32 @posix_memalign(i8** nonnull %4, i64 64, i64 %conv15) #2
  %6 = load i32*, i32** %du, align 8, !tbaa !5
  %7 = load i32*, i32** %dv, align 8, !tbaa !5
  %8 = load i32*, i32** %eta.addr, align 8, !tbaa !5
  br label %for.cond18.preheader

for.cond.loopexit:                                ; preds = %for.body21
  %exitcond257 = icmp eq i64 %indvars.iv.next254, 511
  br i1 %exitcond257, label %for.cond44.preheader, label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond.loopexit, %entry
  %indvars.iv253 = phi i64 [ 1, %entry ], [ %indvars.iv.next254, %for.cond.loopexit ]
  %indvars.iv.next254 = add nuw nsw i64 %indvars.iv253, 1
  %9 = shl nsw i64 %indvars.iv253, 9
  %10 = shl i64 %indvars.iv.next254, 9
  br label %for.body21

for.cond44.preheader:                             ; preds = %for.cond.loopexit
  %11 = load i32*, i32** %un.addr, align 8, !tbaa !5
  %12 = load i32*, i32** %u.addr, align 8, !tbaa !5
  %13 = load i32*, i32** %wet.addr, align 8, !tbaa !5
  %14 = load i32*, i32** %vn.addr, align 8, !tbaa !5
  %15 = load i32*, i32** %v.addr, align 8, !tbaa !5
  br label %for.cond48.preheader

for.body21:                                       ; preds = %for.body21, %for.cond18.preheader
  %indvars.iv247 = phi i64 [ 1, %for.cond18.preheader ], [ %indvars.iv.next248, %for.body21 ]
  %16 = add nuw nsw i64 %indvars.iv247, %9
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %16
  %arrayidx26 = getelementptr inbounds i32, i32* %7, i64 %16
  %17 = load i32, i32* %dt.addr, align 4, !tbaa !1
  %18 = load i32, i32* %g.addr, align 4, !tbaa !1
  %19 = add nuw nsw i64 %16, 1
  %arrayidx31 = getelementptr inbounds i32, i32* %8, i64 %19
  %20 = load i32, i32* %arrayidx31, align 4, !tbaa !1
  %arrayidx35 = getelementptr inbounds i32, i32* %8, i64 %16
  %21 = load i32, i32* %arrayidx35, align 4, !tbaa !1
  %22 = add nuw nsw i64 %indvars.iv247, %10
  %arrayidx40 = getelementptr inbounds i32, i32* %8, i64 %22
  %23 = load i32, i32* %arrayidx40, align 4, !tbaa !1
  %24 = load i32, i32* %dx.addr, align 4, !tbaa !1
  %25 = load i32, i32* %dy.addr, align 4, !tbaa !1
  %sub.i = sub i32 0, %17
  %mul.i = mul nsw i32 %18, %sub.i
  %sub1.i = sub nsw i32 %20, %21
  %mul2.i = mul nsw i32 %sub1.i, %mul.i
  %div.i = sdiv i32 %mul2.i, %24
  store i32 %div.i, i32* %arrayidx, align 4, !tbaa !1
  %sub5.i = sub nsw i32 %23, %21
  %mul6.i = mul nsw i32 %sub5.i, %mul.i
  %div7.i = sdiv i32 %mul6.i, %25
  store i32 %div7.i, i32* %arrayidx26, align 4, !tbaa !1
  %indvars.iv.next248 = add nuw nsw i64 %indvars.iv247, 1
  %exitcond252 = icmp eq i64 %indvars.iv.next248, 511
  br i1 %exitcond252, label %for.cond.loopexit, label %for.body21

for.cond48.preheader:                             ; preds = %for.inc88, %for.cond44.preheader
  %indvars.iv243 = phi i64 [ 1, %for.cond44.preheader ], [ %indvars.iv.next244, %for.inc88 ]
  %26 = shl nsw i64 %indvars.iv243, 9
  br label %for.body51

for.cond91.preheader:                             ; preds = %for.inc88
  %27 = load i32*, i32** %h.addr, align 8, !tbaa !5
  %28 = load i32*, i32** %etan.addr, align 8, !tbaa !5
  br label %for.cond95.preheader

for.body51:                                       ; preds = %sw2d_dyn_host_secondLoop.exit, %for.cond48.preheader
  %indvars.iv237 = phi i64 [ 1, %for.cond48.preheader ], [ %indvars.iv.next238, %sw2d_dyn_host_secondLoop.exit ]
  %29 = add nuw nsw i64 %indvars.iv237, %26
  %arrayidx55 = getelementptr inbounds i32, i32* %11, i64 %29
  %arrayidx59 = getelementptr inbounds i32, i32* %12, i64 %29
  %30 = load i32, i32* %arrayidx59, align 4, !tbaa !1
  %arrayidx63 = getelementptr inbounds i32, i32* %6, i64 %29
  %31 = load i32, i32* %arrayidx63, align 4, !tbaa !1
  %arrayidx67 = getelementptr inbounds i32, i32* %13, i64 %29
  %32 = load i32, i32* %arrayidx67, align 4, !tbaa !1
  %33 = add nuw nsw i64 %29, 1
  %arrayidx72 = getelementptr inbounds i32, i32* %13, i64 %33
  %34 = load i32, i32* %arrayidx72, align 4, !tbaa !1
  %arrayidx76 = getelementptr inbounds i32, i32* %14, i64 %29
  %arrayidx80 = getelementptr inbounds i32, i32* %15, i64 %29
  %35 = load i32, i32* %arrayidx80, align 4, !tbaa !1
  %arrayidx84 = getelementptr inbounds i32, i32* %7, i64 %29
  store i32 0, i32* %arrayidx55, align 4, !tbaa !1
  %cmp.i217 = icmp eq i32 %32, 1
  %cmp1.i = icmp eq i32 %34, 1
  %cmp2.i = icmp sgt i32 %31, 0
  %or.cond.i = or i1 %cmp2.i, %cmp1.i
  br i1 %cmp.i217, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %for.body51
  br i1 %or.cond.i, label %if.then3.i, label %if.then12.i

if.then3.i:                                       ; preds = %if.then.i
  %add.i218 = add nsw i32 %31, %30
  store i32 %add.i218, i32* %arrayidx55, align 4, !tbaa !1
  br label %if.then12.i

if.else.i:                                        ; preds = %for.body51
  br i1 %or.cond.i, label %if.then7.i, label %if.else19.i

if.then7.i:                                       ; preds = %if.else.i
  %add8.i = add nsw i32 %31, %30
  store i32 %add8.i, i32* %arrayidx55, align 4, !tbaa !1
  br label %if.else19.i

if.then12.i:                                      ; preds = %if.then3.i, %if.then.i
  store i32 0, i32* %arrayidx76, align 4, !tbaa !1
  %36 = load i32, i32* %arrayidx84, align 4, !tbaa !1
  %cmp15.i = icmp sgt i32 %36, 0
  %or.cond28.i = or i1 %cmp1.i, %cmp15.i
  br i1 %or.cond28.i, label %if.then16.i, label %sw2d_dyn_host_secondLoop.exit

if.then16.i:                                      ; preds = %if.then12.i
  %add17.i219 = add nsw i32 %36, %35
  store i32 %add17.i219, i32* %arrayidx76, align 4, !tbaa !1
  br label %sw2d_dyn_host_secondLoop.exit

if.else19.i:                                      ; preds = %if.then7.i, %if.else.i
  store i32 0, i32* %arrayidx76, align 4, !tbaa !1
  %37 = load i32, i32* %arrayidx84, align 4, !tbaa !1
  %cmp22.i = icmp slt i32 %37, 0
  %or.cond29.i = or i1 %cmp1.i, %cmp22.i
  br i1 %or.cond29.i, label %if.then23.i, label %sw2d_dyn_host_secondLoop.exit

if.then23.i:                                      ; preds = %if.else19.i
  %add24.i = add nsw i32 %37, %35
  store i32 %add24.i, i32* %arrayidx76, align 4, !tbaa !1
  br label %sw2d_dyn_host_secondLoop.exit

sw2d_dyn_host_secondLoop.exit:                    ; preds = %if.then12.i, %if.then16.i, %if.else19.i, %if.then23.i
  %indvars.iv.next238 = add nuw nsw i64 %indvars.iv237, 1
  %exitcond241 = icmp eq i64 %indvars.iv.next238, 511
  br i1 %exitcond241, label %for.inc88, label %for.body51

for.inc88:                                        ; preds = %sw2d_dyn_host_secondLoop.exit
  %indvars.iv.next244 = add nuw nsw i64 %indvars.iv243, 1
  %exitcond246 = icmp eq i64 %indvars.iv.next244, 511
  br i1 %exitcond246, label %for.cond91.preheader, label %for.cond48.preheader

for.cond91.loopexit:                              ; preds = %for.body98
  %exitcond236 = icmp eq i64 %indvars.iv.next232, 511
  br i1 %exitcond236, label %for.end153, label %for.cond95.preheader

for.cond95.preheader:                             ; preds = %for.cond91.loopexit, %for.cond91.preheader
  %indvars.iv231 = phi i64 [ 1, %for.cond91.preheader ], [ %indvars.iv.next232, %for.cond91.loopexit ]
  %indvars.iv.next232 = add nuw nsw i64 %indvars.iv231, 1
  %38 = shl i64 %indvars.iv231, 9
  %39 = add nsw i64 %38, -512
  %40 = shl i64 %indvars.iv.next232, 9
  br label %for.body98

for.body98:                                       ; preds = %for.body98, %for.cond95.preheader
  %indvars.iv = phi i64 [ 1, %for.cond95.preheader ], [ %indvars.iv.next, %for.body98 ]
  %41 = load i32, i32* %dx.addr, align 4, !tbaa !1
  %42 = load i32, i32* %dy.addr, align 4, !tbaa !1
  %43 = load i32, i32* %dt.addr, align 4, !tbaa !1
  %44 = add nuw nsw i64 %indvars.iv, %38
  %arrayidx102 = getelementptr inbounds i32, i32* %11, i64 %44
  %45 = load i32, i32* %arrayidx102, align 4, !tbaa !1
  %46 = add nsw i64 %44, -1
  %arrayidx106 = getelementptr inbounds i32, i32* %11, i64 %46
  %47 = load i32, i32* %arrayidx106, align 4, !tbaa !1
  %arrayidx110 = getelementptr inbounds i32, i32* %14, i64 %44
  %48 = load i32, i32* %arrayidx110, align 4, !tbaa !1
  %49 = add nuw nsw i64 %39, %indvars.iv
  %arrayidx115 = getelementptr inbounds i32, i32* %14, i64 %49
  %50 = load i32, i32* %arrayidx115, align 4, !tbaa !1
  %arrayidx119 = getelementptr inbounds i32, i32* %27, i64 %44
  %51 = load i32, i32* %arrayidx119, align 4, !tbaa !1
  %52 = add nuw nsw i64 %44, 1
  %arrayidx124 = getelementptr inbounds i32, i32* %27, i64 %52
  %53 = load i32, i32* %arrayidx124, align 4, !tbaa !1
  %arrayidx129 = getelementptr inbounds i32, i32* %27, i64 %46
  %54 = load i32, i32* %arrayidx129, align 4, !tbaa !1
  %55 = add nuw nsw i64 %indvars.iv, %40
  %arrayidx134 = getelementptr inbounds i32, i32* %27, i64 %55
  %56 = load i32, i32* %arrayidx134, align 4, !tbaa !1
  %arrayidx139 = getelementptr inbounds i32, i32* %27, i64 %49
  %57 = load i32, i32* %arrayidx139, align 4, !tbaa !1
  %arrayidx143 = getelementptr inbounds i32, i32* %28, i64 %44
  %arrayidx147 = getelementptr inbounds i32, i32* %8, i64 %44
  %cmp.i = icmp sgt i32 %45, -1
  %sub.i214 = sub nsw i32 0, %45
  %cond.i = select i1 %cmp.i, i32 %45, i32 %sub.i214
  %add.i = add nsw i32 %cond.i, %45
  %mul.i215 = mul nsw i32 %51, %add.i
  %div.i216 = sdiv i32 %mul.i215, 2
  %sub7.i = sub nsw i32 %45, %cond.i
  %mul8.i = mul nsw i32 %53, %sub7.i
  %div9.i = sdiv i32 %mul8.i, 2
  %cmp11.i = icmp sgt i32 %47, -1
  %sub14.i = sub nsw i32 0, %47
  %cond16.i = select i1 %cmp11.i, i32 %47, i32 %sub14.i
  %add17.i = add nsw i32 %cond16.i, %47
  %mul18.i = mul nsw i32 %54, %add17.i
  %sub26.i = sub nsw i32 %47, %cond16.i
  %mul27.i = mul nsw i32 %51, %sub26.i
  %cmp30.i = icmp sgt i32 %48, -1
  %sub33.i = sub nsw i32 0, %48
  %cond35.i = select i1 %cmp30.i, i32 %48, i32 %sub33.i
  %add36.i = add nsw i32 %cond35.i, %48
  %mul37.i = mul nsw i32 %add36.i, %51
  %div38.i = sdiv i32 %mul37.i, 2
  %sub45.i = sub nsw i32 %48, %cond35.i
  %mul46.i = mul nsw i32 %56, %sub45.i
  %div47.i = sdiv i32 %mul46.i, 2
  %cmp49.i = icmp sgt i32 %50, -1
  %sub52.i = sub nsw i32 0, %50
  %cond54.i = select i1 %cmp49.i, i32 %50, i32 %sub52.i
  %add55.i = add nsw i32 %cond54.i, %50
  %mul56.i = mul nsw i32 %57, %add55.i
  %sub64.i = sub nsw i32 %50, %cond54.i
  %mul65.i = mul nsw i32 %sub64.i, %51
  %58 = load i32, i32* %arrayidx147, align 4, !tbaa !1
  %div28.neg.i = sdiv i32 %mul27.i, -2
  %div19.neg.i = sdiv i32 %mul18.i, -2
  %add29.neg.i = add i32 %div28.neg.i, %div.i216
  %add10.i = add i32 %add29.neg.i, %div9.i
  %sub68.i = add i32 %add10.i, %div19.neg.i
  %mul69.i = mul nsw i32 %sub68.i, %43
  %div70.i = sdiv i32 %mul69.i, %41
  %sub71.i = sub i32 %58, %div70.i
  %div66.neg.i = sdiv i32 %mul65.i, -2
  %div57.neg.i = sdiv i32 %mul56.i, -2
  %add67.neg.i = add i32 %div66.neg.i, %div38.i
  %add48.i = add i32 %add67.neg.i, %div47.i
  %sub72.i = add i32 %add48.i, %div57.neg.i
  %mul73.i = mul nsw i32 %sub72.i, %43
  %div74.i = sdiv i32 %mul73.i, %42
  %sub75.i = sub i32 %sub71.i, %div74.i
  store i32 %sub75.i, i32* %arrayidx143, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 511
  br i1 %exitcond, label %for.cond91.loopexit, label %for.body98

for.end153:                                       ; preds = %for.cond91.loopexit
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #2
  ret void
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #4

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_shapiro_host_terms(i32 %wet_jCOLS_k, i32 %wet_jCOLS_k_1, i32 %wet_jCOLS_k_neg1, i32 %wet_j1COLS_k, i32 %wet_jNeg1COLS_k, i32 %etan_jCOLS_k, i32 %etan_j1COLS_k, i32 %etan_jNeg1COLS_k, i32 %etan_jCOLS_k_1, i32 %etan_jCOLS_k_neg1, i32 %eps, i32* nocapture %eta) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i32 %wet_jCOLS_k, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %add = add nsw i32 %wet_jCOLS_k_neg1, %wet_jCOLS_k_1
  %add1 = add nsw i32 %add, %wet_j1COLS_k
  %add2 = add nsw i32 %add1, %wet_jNeg1COLS_k
  %mul = mul nsw i32 %add2, %eps
  %div = sdiv i32 %mul, 4
  %sub = sub nsw i32 1, %div
  %mul3 = mul nsw i32 %sub, %etan_jCOLS_k
  %mul4 = mul nsw i32 %etan_jCOLS_k_1, %wet_jCOLS_k_1
  %mul5 = mul nsw i32 %etan_jCOLS_k_neg1, %wet_jCOLS_k_neg1
  %add6 = add nsw i32 %mul5, %mul4
  %mul7 = mul nsw i32 %add6, %eps
  %div8 = sdiv i32 %mul7, 4
  %mul9 = mul nsw i32 %etan_j1COLS_k, %wet_j1COLS_k
  %mul10 = mul nsw i32 %etan_jNeg1COLS_k, %wet_jNeg1COLS_k
  %add11 = add nsw i32 %mul10, %mul9
  %mul12 = mul nsw i32 %add11, %eps
  %div13 = sdiv i32 %mul12, 4
  %add14 = add nsw i32 %div8, %div13
  %add15 = add i32 %add14, %mul3
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %storemerge = phi i32 [ %add15, %if.then ], [ %etan_jNeg1COLS_k, %entry ]
  store i32 %storemerge, i32* %eta, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_shapiro_host(i32* %wet, i32* %etan, i32 %eps, i32* %eta) local_unnamed_addr #1 {
entry:
  %wet.addr = alloca i32*, align 8
  %etan.addr = alloca i32*, align 8
  %eps.addr = alloca i32, align 4
  %eta.addr = alloca i32*, align 8
  store i32* %wet, i32** %wet.addr, align 8, !tbaa !5
  %wet.addr1 = bitcast i32** %wet.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %wet.addr1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 443)
  store i32* %etan, i32** %etan.addr, align 8, !tbaa !5
  %etan.addr2 = bitcast i32** %etan.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %etan.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 444)
  store i32 %eps, i32* %eps.addr, align 4, !tbaa !1
  %eps.addr3 = bitcast i32* %eps.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eps.addr3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 445)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !5
  %eta.addr4 = bitcast i32** %eta.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eta.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 446)
  %0 = load i32*, i32** %wet.addr, align 8, !tbaa !5
  %1 = load i32*, i32** %etan.addr, align 8, !tbaa !5
  %2 = load i32*, i32** %eta.addr, align 8, !tbaa !5
  br label %for.cond5.preheader

for.cond.loopexit:                                ; preds = %sw2d_shapiro_host_terms.exit
  %exitcond100 = icmp eq i64 %indvars.iv.next96, 511
  br i1 %exitcond100, label %for.end58, label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond.loopexit, %entry
  %indvars.iv95 = phi i64 [ 1, %entry ], [ %indvars.iv.next96, %for.cond.loopexit ]
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %3 = shl i64 %indvars.iv95, 9
  %4 = shl i64 %indvars.iv.next96, 9
  %5 = add nsw i64 %3, -512
  br label %for.body7

for.body7:                                        ; preds = %sw2d_shapiro_host_terms.exit, %for.cond5.preheader
  %indvars.iv = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %sw2d_shapiro_host_terms.exit ]
  %6 = add nuw nsw i64 %indvars.iv, %3
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %6
  %7 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %8 = add nuw nsw i64 %6, 1
  %arrayidx12 = getelementptr inbounds i32, i32* %0, i64 %8
  %9 = load i32, i32* %arrayidx12, align 4, !tbaa !1
  %10 = add nsw i64 %6, -1
  %arrayidx16 = getelementptr inbounds i32, i32* %0, i64 %10
  %11 = load i32, i32* %arrayidx16, align 4, !tbaa !1
  %12 = add nuw nsw i64 %indvars.iv, %4
  %arrayidx21 = getelementptr inbounds i32, i32* %0, i64 %12
  %13 = load i32, i32* %arrayidx21, align 4, !tbaa !1
  %14 = add nuw nsw i64 %5, %indvars.iv
  %arrayidx26 = getelementptr inbounds i32, i32* %0, i64 %14
  %15 = load i32, i32* %arrayidx26, align 4, !tbaa !1
  %arrayidx40 = getelementptr inbounds i32, i32* %1, i64 %14
  %16 = load i32, i32* %arrayidx40, align 4, !tbaa !1
  %17 = load i32, i32* %eps.addr, align 4, !tbaa !1
  %arrayidx55 = getelementptr inbounds i32, i32* %2, i64 %14
  %cmp.i = icmp eq i32 %7, 1
  br i1 %cmp.i, label %if.then.i, label %sw2d_shapiro_host_terms.exit

if.then.i:                                        ; preds = %for.body7
  %arrayidx50 = getelementptr inbounds i32, i32* %1, i64 %10
  %18 = load i32, i32* %arrayidx50, align 4, !tbaa !1
  %arrayidx45 = getelementptr inbounds i32, i32* %1, i64 %8
  %19 = load i32, i32* %arrayidx45, align 4, !tbaa !1
  %arrayidx35 = getelementptr inbounds i32, i32* %1, i64 %12
  %20 = load i32, i32* %arrayidx35, align 4, !tbaa !1
  %arrayidx30 = getelementptr inbounds i32, i32* %1, i64 %6
  %21 = load i32, i32* %arrayidx30, align 4, !tbaa !1
  %add.i = add nsw i32 %11, %9
  %add1.i = add nsw i32 %add.i, %13
  %add2.i = add nsw i32 %add1.i, %15
  %mul.i = mul nsw i32 %17, %add2.i
  %div.i = sdiv i32 %mul.i, 4
  %sub.i = sub nsw i32 1, %div.i
  %mul3.i = mul nsw i32 %21, %sub.i
  %mul4.i = mul nsw i32 %19, %9
  %mul5.i = mul nsw i32 %18, %11
  %add6.i = add nsw i32 %mul4.i, %mul5.i
  %mul7.i = mul nsw i32 %add6.i, %17
  %div8.i = sdiv i32 %mul7.i, 4
  %mul9.i = mul nsw i32 %20, %13
  %mul10.i = mul nsw i32 %16, %15
  %add11.i = add nsw i32 %mul9.i, %mul10.i
  %mul12.i = mul nsw i32 %add11.i, %17
  %div13.i = sdiv i32 %mul12.i, 4
  %add14.i = add i32 %div8.i, %mul3.i
  %add15.i = add i32 %add14.i, %div13.i
  br label %sw2d_shapiro_host_terms.exit

sw2d_shapiro_host_terms.exit:                     ; preds = %for.body7, %if.then.i
  %storemerge.i = phi i32 [ %add15.i, %if.then.i ], [ %16, %for.body7 ]
  store i32 %storemerge.i, i32* %arrayidx55, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 511
  br i1 %exitcond, label %for.cond.loopexit, label %for.body7

for.end58:                                        ; preds = %for.cond.loopexit
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_updates_host_loop(i32* nocapture %h_jCOLS_k, i32 %hzero_jCOLS_k, i32 %eta_jCOLS_k, i32* nocapture %wet_jCOLS_k, i32 %hmin, i32* nocapture %u, i32* nocapture %v, i32 %un, i32 %vn) local_unnamed_addr #0 {
entry:
  %add = add nsw i32 %eta_jCOLS_k, %hzero_jCOLS_k
  store i32 %add, i32* %h_jCOLS_k, align 4, !tbaa !1
  store i32 1, i32* %wet_jCOLS_k, align 4, !tbaa !1
  %0 = load i32, i32* %h_jCOLS_k, align 4, !tbaa !1
  %not.cmp = icmp sge i32 %0, %hmin
  %. = zext i1 %not.cmp to i32
  store i32 %., i32* %wet_jCOLS_k, align 4
  store i32 %un, i32* %u, align 4, !tbaa !1
  store i32 %vn, i32* %v, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_updates_host(i32* %h, i32* %hzero, i32* %eta, i32* %u, i32* %un, i32* %v, i32* %vn, i32* %wet, i32 %hmin) local_unnamed_addr #1 {
entry:
  %h.addr = alloca i32*, align 8
  %hzero.addr = alloca i32*, align 8
  %eta.addr = alloca i32*, align 8
  %u.addr = alloca i32*, align 8
  %un.addr = alloca i32*, align 8
  %v.addr = alloca i32*, align 8
  %vn.addr = alloca i32*, align 8
  %wet.addr = alloca i32*, align 8
  %hmin.addr = alloca i32, align 4
  store i32* %h, i32** %h.addr, align 8, !tbaa !5
  %h.addr1 = bitcast i32** %h.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %h.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 520)
  store i32* %hzero, i32** %hzero.addr, align 8, !tbaa !5
  %hzero.addr2 = bitcast i32** %hzero.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %hzero.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 521)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !5
  %eta.addr3 = bitcast i32** %eta.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eta.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 522)
  store i32* %u, i32** %u.addr, align 8, !tbaa !5
  %u.addr4 = bitcast i32** %u.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %u.addr4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 523)
  store i32* %un, i32** %un.addr, align 8, !tbaa !5
  %un.addr5 = bitcast i32** %un.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %un.addr5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 524)
  store i32* %v, i32** %v.addr, align 8, !tbaa !5
  %v.addr6 = bitcast i32** %v.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %v.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 525)
  store i32* %vn, i32** %vn.addr, align 8, !tbaa !5
  %vn.addr7 = bitcast i32** %vn.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %vn.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 526)
  store i32* %wet, i32** %wet.addr, align 8, !tbaa !5
  %wet.addr8 = bitcast i32** %wet.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 527)
  store i32 %hmin, i32* %hmin.addr, align 4, !tbaa !1
  %hmin.addr9 = bitcast i32* %hmin.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %hmin.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 528)
  %0 = load i32*, i32** %h.addr, align 8, !tbaa !5
  %1 = load i32*, i32** %hzero.addr, align 8, !tbaa !5
  %2 = load i32*, i32** %eta.addr, align 8, !tbaa !5
  %3 = load i32*, i32** %wet.addr, align 8, !tbaa !5
  %4 = load i32*, i32** %u.addr, align 8, !tbaa !5
  %5 = load i32*, i32** %v.addr, align 8, !tbaa !5
  %6 = load i32*, i32** %un.addr, align 8, !tbaa !5
  %7 = load i32*, i32** %vn.addr, align 8, !tbaa !5
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond.cleanup12, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.cond.cleanup12 ]
  %8 = shl i64 %indvars.iv70, 9
  br label %for.body13

for.cond.cleanup:                                 ; preds = %for.cond.cleanup12
  ret void

for.cond.cleanup12:                               ; preds = %for.body13
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 512
  br i1 %exitcond73, label %for.cond.cleanup, label %for.cond10.preheader

for.body13:                                       ; preds = %for.body13, %for.cond10.preheader
  %indvars.iv = phi i64 [ 0, %for.cond10.preheader ], [ %indvars.iv.next, %for.body13 ]
  %9 = add nuw nsw i64 %indvars.iv, %8
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %9
  %arrayidx17 = getelementptr inbounds i32, i32* %1, i64 %9
  %10 = load i32, i32* %arrayidx17, align 4, !tbaa !1
  %arrayidx21 = getelementptr inbounds i32, i32* %2, i64 %9
  %11 = load i32, i32* %arrayidx21, align 4, !tbaa !1
  %arrayidx25 = getelementptr inbounds i32, i32* %3, i64 %9
  %12 = load i32, i32* %hmin.addr, align 4, !tbaa !1
  %arrayidx29 = getelementptr inbounds i32, i32* %4, i64 %9
  %arrayidx33 = getelementptr inbounds i32, i32* %5, i64 %9
  %arrayidx37 = getelementptr inbounds i32, i32* %6, i64 %9
  %13 = load i32, i32* %arrayidx37, align 4, !tbaa !1
  %arrayidx41 = getelementptr inbounds i32, i32* %7, i64 %9
  %14 = load i32, i32* %arrayidx41, align 4, !tbaa !1
  %add.i = add nsw i32 %11, %10
  store i32 %add.i, i32* %arrayidx, align 4, !tbaa !1
  store i32 1, i32* %arrayidx25, align 4, !tbaa !1
  %15 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %not.cmp.i = icmp sge i32 %15, %12
  %..i = zext i1 %not.cmp.i to i32
  store i32 %..i, i32* %arrayidx25, align 4
  store i32 %13, i32* %arrayidx29, align 4, !tbaa !1
  store i32 %14, i32* %arrayidx33, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond, label %for.cond.cleanup12, label %for.body13
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 284936)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !8, !9}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = !{!17, !12}
!17 = distinct !{!17, !13}
!18 = !{!17}
!19 = distinct !{!19, !8, !9}
!20 = distinct !{!20, !8, !9}
