; ModuleID = 'host-sw2d.bc'
source_filename = "host-sw2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"15 0 6\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [12 x i8] c"host-sw2d.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [6 x i8] c"1 0 0\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [9 x i8] c"10 -10 6\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [7 x i8] c"10 0 0\00", section "llvm.metadata"
@.str.5 = private unnamed_addr constant [8 x i8] c"514 0 0\00", section "llvm.metadata"
@.str.8 = private unnamed_addr constant [20 x i8] c"1500000 -1500000 10\00", section "llvm.metadata"
@.str.9 = private unnamed_addr constant [8 x i8] c"100 0 2\00", section "llvm.metadata"
@.str.10 = private unnamed_addr constant [7 x i8] c"10 9 2\00", section "llvm.metadata"
@.str.11 = private unnamed_addr constant [6 x i8] c"0 0 2\00", section "llvm.metadata"
@str = private unnamed_addr constant [25 x i8] c"Host arrays initialized.\00"
@str.12 = private unnamed_addr constant [62 x i8] c"-------------------------------------------------------------\00"

; Function Attrs: nounwind uwtable
define void @initHzero(i32* %hzero) local_unnamed_addr #0 {
entry:
  %hzero.addr = alloca i32*, align 8, !optimi !1
  store i32* %hzero, i32** %hzero.addr, align 8, !tbaa !2
  %hzero.addr1 = bitcast i32** %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 15)
  %0 = load i32*, i32** %hzero.addr, align 8, !tbaa !2, !optimi !1
  store i32 10, i32* %0, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #1

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host_loop2And3(i32* %hzero_row0_k, i32* %hzero_lastRow_k) local_unnamed_addr #0 {
entry:
  %hzero_row0_k.addr = alloca i32*, align 8, !optimi !1
  %hzero_lastRow_k.addr = alloca i32*, align 8, !optimi !1
  store i32* %hzero_row0_k, i32** %hzero_row0_k.addr, align 8, !tbaa !2
  %hzero_row0_k.addr1 = bitcast i32** %hzero_row0_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero_row0_k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 23)
  store i32* %hzero_lastRow_k, i32** %hzero_lastRow_k.addr, align 8, !tbaa !2
  %hzero_lastRow_k.addr2 = bitcast i32** %hzero_lastRow_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero_lastRow_k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 24)
  %0 = load i32*, i32** %hzero_lastRow_k.addr, align 8, !tbaa !2, !optimi !1
  store i32 -10, i32* %0, align 4, !tbaa !6
  %1 = load i32*, i32** %hzero_row0_k.addr, align 8, !tbaa !2, !optimi !1
  store i32 -10, i32* %1, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host_eta_etan(i32* %eta, i32 %hzero, i32* %etan) local_unnamed_addr #0 {
entry:
  %eta.addr = alloca i32*, align 8, !optimi !1
  %hzero.addr = alloca i32, align 4, !optimi !1
  %etan.addr = alloca i32*, align 8, !optimi !1
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !2
  %eta.addr1 = bitcast i32** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 32)
  store i32 %hzero, i32* %hzero.addr, align 4, !tbaa !6
  %hzero.addr2 = bitcast i32* %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 33)
  store i32* %etan, i32** %etan.addr, align 8, !tbaa !2
  %etan.addr3 = bitcast i32** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 34)
  %0 = load i32, i32* %hzero.addr, align 4, !tbaa !6, !optimi !1
  %cmp = icmp sgt i32 %0, 0, !optimi !8
  %cond = select i1 %cmp, i32 0, i32 %0, !optimi !1
  %sub = sub nsw i32 0, %cond, !optimi !9
  %1 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  store i32 %sub, i32* %1, align 4, !tbaa !6
  %2 = load i32*, i32** %etan.addr, align 8, !tbaa !2, !optimi !1
  store i32 %sub, i32* %2, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host_finalLoop(i32* %h_j_COLS_k, i32 %hzero_j_COLS_k, i32 %eta_j_COLS_k, i32* %wet_j_COLS_k, i32 %hmin, i32* %u, i32* %un, i32* %v, i32* %vn) local_unnamed_addr #0 {
entry:
  %h_j_COLS_k.addr = alloca i32*, align 8, !optimi !1
  %hzero_j_COLS_k.addr = alloca i32, align 4, !optimi !1
  %eta_j_COLS_k.addr = alloca i32, align 4, !optimi !1
  %wet_j_COLS_k.addr = alloca i32*, align 8, !optimi !8
  %hmin.addr = alloca i32, align 4, !optimi !1
  %u.addr = alloca i32*, align 8, !optimi !10
  %un.addr = alloca i32*, align 8, !optimi !10
  %v.addr = alloca i32*, align 8, !optimi !10
  %vn.addr = alloca i32*, align 8, !optimi !10
  store i32* %h_j_COLS_k, i32** %h_j_COLS_k.addr, align 8, !tbaa !2
  %h_j_COLS_k.addr1 = bitcast i32** %h_j_COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_j_COLS_k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 43)
  store i32 %hzero_j_COLS_k, i32* %hzero_j_COLS_k.addr, align 4, !tbaa !6
  %hzero_j_COLS_k.addr2 = bitcast i32* %hzero_j_COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero_j_COLS_k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 44)
  store i32 %eta_j_COLS_k, i32* %eta_j_COLS_k.addr, align 4, !tbaa !6
  %eta_j_COLS_k.addr3 = bitcast i32* %eta_j_COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_j_COLS_k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 45)
  store i32* %wet_j_COLS_k, i32** %wet_j_COLS_k.addr, align 8, !tbaa !2
  %wet_j_COLS_k.addr4 = bitcast i32** %wet_j_COLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_j_COLS_k.addr4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 46)
  store i32 %hmin, i32* %hmin.addr, align 4, !tbaa !6
  %hmin.addr5 = bitcast i32* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hmin.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 47)
  store i32* %u, i32** %u.addr, align 8, !tbaa !2
  %u.addr6 = bitcast i32** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 48)
  store i32* %un, i32** %un.addr, align 8, !tbaa !2
  %un.addr7 = bitcast i32** %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 49)
  store i32* %v, i32** %v.addr, align 8, !tbaa !2
  %v.addr8 = bitcast i32** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 50)
  store i32* %vn, i32** %vn.addr, align 8, !tbaa !2
  %vn.addr9 = bitcast i32** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 51)
  %0 = load i32, i32* %hzero_j_COLS_k.addr, align 4, !tbaa !6, !optimi !1
  %1 = load i32, i32* %eta_j_COLS_k.addr, align 4, !tbaa !6, !optimi !1
  %add = add nsw i32 %1, %0, !optimi !11
  %2 = load i32*, i32** %h_j_COLS_k.addr, align 8, !tbaa !2, !optimi !1
  store i32 %add, i32* %2, align 4, !tbaa !6
  %3 = load i32*, i32** %wet_j_COLS_k.addr, align 8, !tbaa !2, !optimi !8
  store i32 1, i32* %3, align 4, !tbaa !6
  %4 = load i32, i32* %2, align 4, !tbaa !6, !optimi !1
  %5 = load i32, i32* %hmin.addr, align 4, !tbaa !6, !optimi !1
  %not.cmp = icmp sge i32 %4, %5, !optimi !8
  %. = zext i1 %not.cmp to i32, !optimi !8
  store i32 %., i32* %3, align 4
  %6 = load i32*, i32** %vn.addr, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %6, align 4, !tbaa !6
  %7 = load i32*, i32** %v.addr, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %7, align 4, !tbaa !6
  %8 = load i32*, i32** %un.addr, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %8, align 4, !tbaa !6
  %9 = load i32*, i32** %u.addr, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %9, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host(i32* %hzero, i32* %eta, i32* %etan, i32* %h, i32* %wet, i32* %u, i32* %un, i32* %v, i32* %vn, i32 %hmin, i32 %BytesPerWord) local_unnamed_addr #0 {
entry:
  %hzero_row0_k.addr.i122 = alloca i32*, align 8, !optimi !1
  %hzero_lastRow_k.addr.i123 = alloca i32*, align 8, !optimi !1
  %hzero_row0_k.addr.i = alloca i32*, align 8, !optimi !1
  %hzero_lastRow_k.addr.i = alloca i32*, align 8, !optimi !1
  %eta.addr.i = alloca i32*, align 8, !optimi !1
  %hzero.addr.i121 = alloca i32, align 4, !optimi !1
  %etan.addr.i = alloca i32*, align 8, !optimi !1
  %h_j_COLS_k.addr.i = alloca i32*, align 8, !optimi !1
  %hzero_j_COLS_k.addr.i = alloca i32, align 4, !optimi !1
  %eta_j_COLS_k.addr.i = alloca i32, align 4, !optimi !1
  %wet_j_COLS_k.addr.i = alloca i32*, align 8, !optimi !8
  %hmin.addr.i = alloca i32, align 4, !optimi !1
  %u.addr.i = alloca i32*, align 8, !optimi !10
  %un.addr.i = alloca i32*, align 8, !optimi !10
  %v.addr.i = alloca i32*, align 8, !optimi !10
  %vn.addr.i = alloca i32*, align 8, !optimi !10
  %hzero.addr.i = alloca i32*, align 8, !optimi !1
  %hzero.addr = alloca i32*, align 8, !optimi !1
  %eta.addr = alloca i32*, align 8, !optimi !1
  %etan.addr = alloca i32*, align 8, !optimi !1
  %h.addr = alloca i32*, align 8, !optimi !1
  %wet.addr = alloca i32*, align 8, !optimi !8
  %u.addr = alloca i32*, align 8, !optimi !10
  %un.addr = alloca i32*, align 8, !optimi !10
  %v.addr = alloca i32*, align 8, !optimi !10
  %vn.addr = alloca i32*, align 8, !optimi !10
  %hmin.addr = alloca i32, align 4, !optimi !1
  %BytesPerWord.addr = alloca i32, align 4, !optimi !12
  %j = alloca i32, align 4, !optimi !13
  %k = alloca i32, align 4, !optimi !13
  store i32* %hzero, i32** %hzero.addr, align 8, !tbaa !2
  %hzero.addr1 = bitcast i32** %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 73)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !2
  %eta.addr2 = bitcast i32** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 74)
  store i32* %etan, i32** %etan.addr, align 8, !tbaa !2
  %etan.addr3 = bitcast i32** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 75)
  store i32* %h, i32** %h.addr, align 8, !tbaa !2
  %h.addr4 = bitcast i32** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 76)
  store i32* %wet, i32** %wet.addr, align 8, !tbaa !2
  %wet.addr5 = bitcast i32** %wet.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 77)
  store i32* %u, i32** %u.addr, align 8, !tbaa !2
  %u.addr6 = bitcast i32** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 78)
  store i32* %un, i32** %un.addr, align 8, !tbaa !2
  %un.addr7 = bitcast i32** %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 79)
  store i32* %v, i32** %v.addr, align 8, !tbaa !2
  %v.addr8 = bitcast i32** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 80)
  store i32* %vn, i32** %vn.addr, align 8, !tbaa !2
  %vn.addr9 = bitcast i32** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 81)
  store i32 %hmin, i32* %hmin.addr, align 4, !tbaa !6
  %hmin.addr10 = bitcast i32* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hmin.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 82)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !6
  %BytesPerWord.addr11 = bitcast i32* %BytesPerWord.addr to i8*, !optimi !12
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 83)
  %0 = bitcast i32* %j to i8*, !optimi !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %0) #1
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 99)
  %1 = bitcast i32* %k to i8*, !optimi !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1) #1
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 99)
  store i32 0, i32* %j, align 4, !tbaa !6
  store i32 0, i32* %k, align 4, !tbaa !6
  %2 = bitcast i32** %hzero.addr.i to i8*, !optimi !1
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %entry, %for.inc17
  %3 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !optimi !14
  br label %for.body16

for.cond20.preheader:                             ; preds = %for.inc17
  %4 = bitcast i32** %hzero_row0_k.addr.i122 to i8*, !optimi !1
  %5 = bitcast i32** %hzero_lastRow_k.addr.i123 to i8*, !optimi !1
  br label %for.body22

for.body16:                                       ; preds = %for.cond14.preheader, %for.body16
  %6 = phi i32 [ %3, %for.cond14.preheader ], [ %11, %for.body16 ], !optimi !14
  %7 = phi i32 [ 0, %for.cond14.preheader ], [ %inc, %for.body16 ], !optimi !14
  %8 = load i32*, i32** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %mul = shl i32 %6, 9, !optimi !15
  %add = add nsw i32 %mul, %7, !optimi !16
  %idxprom = sext i32 %add to i64, !optimi !16
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %idxprom, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2)
  store i32* %arrayidx, i32** %hzero.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 15) #1
  %9 = load i32*, i32** %hzero.addr.i, align 8, !tbaa !2, !optimi !1
  store i32 10, i32* %9, align 4, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2)
  %10 = load i32, i32* %k, align 4, !tbaa !6, !optimi !13
  %inc = add nsw i32 %10, 1, !optimi !17
  store i32 %inc, i32* %k, align 4, !tbaa !6
  %cmp15 = icmp slt i32 %inc, 512, !optimi !8
  %11 = load i32, i32* %j, align 4, !tbaa !6, !optimi !13
  br i1 %cmp15, label %for.body16, label %for.inc17

for.inc17:                                        ; preds = %for.body16
  %inc18 = add nsw i32 %11, 1, !optimi !17
  store i32 %inc18, i32* %j, align 4, !tbaa !6
  %cmp = icmp slt i32 %inc18, 512, !optimi !8
  store i32 0, i32* %k, align 4, !tbaa !6
  br i1 %cmp, label %for.cond14.preheader, label %for.cond20.preheader

for.cond32.preheader:                             ; preds = %for.body22
  store i32 0, i32* %j, align 4, !tbaa !6
  %12 = bitcast i32** %hzero_row0_k.addr.i to i8*, !optimi !1
  %13 = bitcast i32** %hzero_lastRow_k.addr.i to i8*, !optimi !1
  br label %for.body34

for.body22:                                       ; preds = %for.cond20.preheader, %for.body22
  %14 = phi i32 [ 0, %for.cond20.preheader ], [ %inc30, %for.body22 ], !optimi !14
  %15 = load i32*, i32** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %idxprom24 = sext i32 %14 to i64, !optimi !14
  %arrayidx25 = getelementptr inbounds i32, i32* %15, i64 %idxprom24, !optimi !1
  %add26 = add nsw i32 %14, 261632, !optimi !18
  %idxprom27 = sext i32 %add26 to i64, !optimi !18
  %arrayidx28 = getelementptr inbounds i32, i32* %15, i64 %idxprom27, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5)
  store i32* %arrayidx25, i32** %hzero_row0_k.addr.i122, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 23) #1
  store i32* %arrayidx28, i32** %hzero_lastRow_k.addr.i123, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 24) #1
  %16 = load i32*, i32** %hzero_lastRow_k.addr.i123, align 8, !tbaa !2, !optimi !1
  store i32 -10, i32* %16, align 4, !tbaa !6
  %17 = load i32*, i32** %hzero_row0_k.addr.i122, align 8, !tbaa !2, !optimi !1
  store i32 -10, i32* %17, align 4, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %4)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %5)
  %18 = load i32, i32* %k, align 4, !tbaa !6, !optimi !13
  %inc30 = add nsw i32 %18, 1, !optimi !17
  store i32 %inc30, i32* %k, align 4, !tbaa !6
  %cmp21 = icmp slt i32 %inc30, 512, !optimi !8
  br i1 %cmp21, label %for.body22, label %for.cond32.preheader

for.cond46.preheader:                             ; preds = %for.body34
  store i32 0, i32* %j, align 4, !tbaa !6
  %19 = bitcast i32** %eta.addr.i to i8*, !optimi !1
  %20 = bitcast i32* %hzero.addr.i121 to i8*, !optimi !1
  %21 = bitcast i32** %etan.addr.i to i8*, !optimi !1
  br label %for.cond49.preheader

for.body34:                                       ; preds = %for.cond32.preheader, %for.body34
  %storemerge115130 = phi i32 [ 0, %for.cond32.preheader ], [ %inc44, %for.body34 ], !optimi !14
  %22 = load i32*, i32** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %mul35 = shl nsw i32 %storemerge115130, 9, !optimi !15
  %idxprom37 = sext i32 %mul35 to i64, !optimi !15
  %arrayidx38 = getelementptr inbounds i32, i32* %22, i64 %idxprom37, !optimi !1
  %sub = or i32 %mul35, 511, !optimi !19
  %idxprom41 = sext i32 %sub to i64, !optimi !19
  %arrayidx42 = getelementptr inbounds i32, i32* %22, i64 %idxprom41, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %12)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %13)
  store i32* %arrayidx38, i32** %hzero_row0_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 23) #1
  store i32* %arrayidx42, i32** %hzero_lastRow_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 24) #1
  %23 = load i32*, i32** %hzero_lastRow_k.addr.i, align 8, !tbaa !2, !optimi !1
  store i32 -10, i32* %23, align 4, !tbaa !6
  %24 = load i32*, i32** %hzero_row0_k.addr.i, align 8, !tbaa !2, !optimi !1
  store i32 -10, i32* %24, align 4, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %12)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %13)
  %25 = load i32, i32* %j, align 4, !tbaa !6, !optimi !13
  %inc44 = add nsw i32 %25, 1, !optimi !17
  store i32 %inc44, i32* %j, align 4, !tbaa !6
  %cmp33 = icmp slt i32 %inc44, 512, !optimi !8
  br i1 %cmp33, label %for.body34, label %for.cond46.preheader

for.cond49.preheader:                             ; preds = %for.cond46.preheader, %for.inc67
  %26 = phi i32 [ 0, %for.cond46.preheader ], [ %inc68, %for.inc67 ], !optimi !14
  store i32 0, i32* %k, align 4, !tbaa !6
  br label %for.body51

for.cond70.preheader:                             ; preds = %for.inc67
  store i32 0, i32* %j, align 4, !tbaa !6
  %27 = bitcast i32** %h_j_COLS_k.addr.i to i8*, !optimi !1
  %28 = bitcast i32* %hzero_j_COLS_k.addr.i to i8*, !optimi !1
  %29 = bitcast i32* %eta_j_COLS_k.addr.i to i8*, !optimi !1
  %30 = bitcast i32** %wet_j_COLS_k.addr.i to i8*, !optimi !8
  %31 = bitcast i32* %hmin.addr.i to i8*, !optimi !1
  %32 = bitcast i32** %u.addr.i to i8*, !optimi !10
  %33 = bitcast i32** %un.addr.i to i8*, !optimi !10
  %34 = bitcast i32** %v.addr.i to i8*, !optimi !10
  %35 = bitcast i32** %vn.addr.i to i8*, !optimi !10
  br label %for.cond73.preheader

for.body51:                                       ; preds = %for.cond49.preheader, %for.body51
  %36 = phi i32 [ %26, %for.cond49.preheader ], [ %45, %for.body51 ], !optimi !14
  %storemerge120129 = phi i32 [ 0, %for.cond49.preheader ], [ %inc65, %for.body51 ], !optimi !14
  %37 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  %mul52 = shl i32 %36, 9, !optimi !15
  %add53 = add nsw i32 %mul52, %storemerge120129, !optimi !16
  %idxprom54 = sext i32 %add53 to i64, !optimi !16
  %arrayidx55 = getelementptr inbounds i32, i32* %37, i64 %idxprom54, !optimi !1
  %38 = load i32*, i32** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx59 = getelementptr inbounds i32, i32* %38, i64 %idxprom54, !optimi !1
  %39 = load i32, i32* %arrayidx59, align 4, !tbaa !6, !optimi !1
  %40 = load i32*, i32** %etan.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx63 = getelementptr inbounds i32, i32* %40, i64 %idxprom54, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %19)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %20)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %21)
  store i32* %arrayidx55, i32** %eta.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %19, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 32) #1
  store i32 %39, i32* %hzero.addr.i121, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 33) #1
  store i32* %arrayidx63, i32** %etan.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 34) #1
  %41 = load i32, i32* %hzero.addr.i121, align 4, !tbaa !6, !optimi !1
  %cmp.i = icmp sgt i32 %41, 0, !optimi !8
  %cond.i = select i1 %cmp.i, i32 0, i32 %41, !optimi !1
  %sub.i = sub nsw i32 0, %cond.i, !optimi !9
  %42 = load i32*, i32** %eta.addr.i, align 8, !tbaa !2, !optimi !1
  store i32 %sub.i, i32* %42, align 4, !tbaa !6
  %43 = load i32*, i32** %etan.addr.i, align 8, !tbaa !2, !optimi !1
  store i32 %sub.i, i32* %43, align 4, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %19)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %20)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %21)
  %44 = load i32, i32* %k, align 4, !tbaa !6, !optimi !13
  %inc65 = add nsw i32 %44, 1, !optimi !17
  store i32 %inc65, i32* %k, align 4, !tbaa !6
  %cmp50 = icmp slt i32 %inc65, 512, !optimi !8
  %45 = load i32, i32* %j, align 4, !tbaa !6, !optimi !13
  br i1 %cmp50, label %for.body51, label %for.inc67

for.inc67:                                        ; preds = %for.body51
  %inc68 = add nsw i32 %45, 1, !optimi !17
  store i32 %inc68, i32* %j, align 4, !tbaa !6
  %cmp47 = icmp slt i32 %inc68, 512, !optimi !8
  br i1 %cmp47, label %for.cond49.preheader, label %for.cond70.preheader

for.cond73.preheader:                             ; preds = %for.cond70.preheader, %for.inc111
  %46 = phi i32 [ 0, %for.cond70.preheader ], [ %inc112, %for.inc111 ], !optimi !14
  store i32 0, i32* %k, align 4, !tbaa !6
  br label %for.body75

for.body75:                                       ; preds = %for.cond73.preheader, %for.body75
  %47 = phi i32 [ %46, %for.cond73.preheader ], [ %70, %for.body75 ], !optimi !14
  %storemerge119128 = phi i32 [ 0, %for.cond73.preheader ], [ %inc109, %for.body75 ], !optimi !14
  %48 = load i32*, i32** %h.addr, align 8, !tbaa !2, !optimi !1
  %mul76 = shl i32 %47, 9, !optimi !15
  %add77 = add nsw i32 %mul76, %storemerge119128, !optimi !16
  %idxprom78 = sext i32 %add77 to i64, !optimi !16
  %arrayidx79 = getelementptr inbounds i32, i32* %48, i64 %idxprom78, !optimi !1
  %49 = load i32*, i32** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx83 = getelementptr inbounds i32, i32* %49, i64 %idxprom78, !optimi !1
  %50 = load i32, i32* %arrayidx83, align 4, !tbaa !6, !optimi !1
  %51 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx87 = getelementptr inbounds i32, i32* %51, i64 %idxprom78, !optimi !1
  %52 = load i32, i32* %arrayidx87, align 4, !tbaa !6, !optimi !1
  %53 = load i32*, i32** %wet.addr, align 8, !tbaa !2, !optimi !8
  %arrayidx91 = getelementptr inbounds i32, i32* %53, i64 %idxprom78, !optimi !8
  %54 = load i32, i32* %hmin.addr, align 4, !tbaa !6, !optimi !1
  %55 = load i32*, i32** %u.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx95 = getelementptr inbounds i32, i32* %55, i64 %idxprom78, !optimi !10
  %56 = load i32*, i32** %un.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx99 = getelementptr inbounds i32, i32* %56, i64 %idxprom78, !optimi !10
  %57 = load i32*, i32** %v.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx103 = getelementptr inbounds i32, i32* %57, i64 %idxprom78, !optimi !10
  %58 = load i32*, i32** %vn.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx107 = getelementptr inbounds i32, i32* %58, i64 %idxprom78, !optimi !10
  call void @llvm.lifetime.start(i64 8, i8* nonnull %27)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %28)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %29)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %30)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %31)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %32)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %33)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %34)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %35)
  store i32* %arrayidx79, i32** %h_j_COLS_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 43) #1
  store i32 %50, i32* %hzero_j_COLS_k.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %28, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 44) #1
  store i32 %52, i32* %eta_j_COLS_k.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %29, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 45) #1
  store i32* %arrayidx91, i32** %wet_j_COLS_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %30, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 46) #1
  store i32 %54, i32* %hmin.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %31, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 47) #1
  store i32* %arrayidx95, i32** %u.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %32, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 48) #1
  store i32* %arrayidx99, i32** %un.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %33, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 49) #1
  store i32* %arrayidx103, i32** %v.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %34, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 50) #1
  store i32* %arrayidx107, i32** %vn.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %35, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 51) #1
  %59 = load i32, i32* %hzero_j_COLS_k.addr.i, align 4, !tbaa !6, !optimi !1
  %60 = load i32, i32* %eta_j_COLS_k.addr.i, align 4, !tbaa !6, !optimi !1
  %add.i = add nsw i32 %60, %59, !optimi !11
  %61 = load i32*, i32** %h_j_COLS_k.addr.i, align 8, !tbaa !2, !optimi !1
  store i32 %add.i, i32* %61, align 4, !tbaa !6
  %62 = load i32*, i32** %wet_j_COLS_k.addr.i, align 8, !tbaa !2, !optimi !8
  store i32 1, i32* %62, align 4, !tbaa !6
  %63 = load i32, i32* %61, align 4, !tbaa !6, !optimi !1
  %64 = load i32, i32* %hmin.addr.i, align 4, !tbaa !6, !optimi !1
  %not.cmp.i = icmp sge i32 %63, %64, !optimi !8
  %..i = zext i1 %not.cmp.i to i32, !optimi !8
  store i32 %..i, i32* %62, align 4
  %65 = load i32*, i32** %vn.addr.i, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %65, align 4, !tbaa !6
  %66 = load i32*, i32** %v.addr.i, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %66, align 4, !tbaa !6
  %67 = load i32*, i32** %un.addr.i, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %67, align 4, !tbaa !6
  %68 = load i32*, i32** %u.addr.i, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %68, align 4, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %27)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %28)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %29)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %30)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %31)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %32)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %33)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %34)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %35)
  %69 = load i32, i32* %k, align 4, !tbaa !6, !optimi !13
  %inc109 = add nsw i32 %69, 1, !optimi !17
  store i32 %inc109, i32* %k, align 4, !tbaa !6
  %cmp74 = icmp slt i32 %inc109, 512, !optimi !8
  %70 = load i32, i32* %j, align 4, !tbaa !6, !optimi !13
  br i1 %cmp74, label %for.body75, label %for.inc111

for.inc111:                                       ; preds = %for.body75
  %inc112 = add nsw i32 %70, 1, !optimi !17
  store i32 %inc112, i32* %j, align 4, !tbaa !6
  %cmp71 = icmp slt i32 %inc112, 512, !optimi !8
  br i1 %cmp71, label %for.cond73.preheader, label %for.end113

for.end113:                                       ; preds = %for.inc111
  %puts = call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str, i64 0, i64 0)), !optimi !20
  %puts118 = call i32 @puts(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @str.12, i64 0, i64 0)), !optimi !20
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %0) #1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host_firstLoop(i32* %du, i32* %dv, i32 %dt, i32 %g, i32 %eta_jCOLS_k_1, i32 %eta_jCOLS_k, i32 %eta_j1COLS_k, i32 %dx, i32 %dy) local_unnamed_addr #0 {
entry:
  %du.addr = alloca i32*, align 8, !optimi !21
  %dv.addr = alloca i32*, align 8, !optimi !21
  %dt.addr = alloca i32, align 4, !optimi !22
  %g.addr = alloca i32, align 4, !optimi !23
  %eta_jCOLS_k_1.addr = alloca i32, align 4, !optimi !1
  %eta_jCOLS_k.addr = alloca i32, align 4, !optimi !1
  %eta_j1COLS_k.addr = alloca i32, align 4, !optimi !1
  %dx.addr = alloca i32, align 4, !optimi !22
  %dy.addr = alloca i32, align 4, !optimi !22
  store i32* %du, i32** %du.addr, align 8, !tbaa !2
  %du.addr1 = bitcast i32** %du.addr to i8*, !optimi !21
  call void @llvm.var.annotation(i8* nonnull %du.addr1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 151)
  store i32* %dv, i32** %dv.addr, align 8, !tbaa !2
  %dv.addr2 = bitcast i32** %dv.addr to i8*, !optimi !21
  call void @llvm.var.annotation(i8* nonnull %dv.addr2, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 152)
  store i32 %dt, i32* %dt.addr, align 4, !tbaa !6
  %dt.addr3 = bitcast i32* %dt.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dt.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 153)
  store i32 %g, i32* %g.addr, align 4, !tbaa !6
  %g.addr4 = bitcast i32* %g.addr to i8*, !optimi !23
  call void @llvm.var.annotation(i8* nonnull %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 154)
  store i32 %eta_jCOLS_k_1, i32* %eta_jCOLS_k_1.addr, align 4, !tbaa !6
  %eta_jCOLS_k_1.addr5 = bitcast i32* %eta_jCOLS_k_1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_jCOLS_k_1.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 155)
  store i32 %eta_jCOLS_k, i32* %eta_jCOLS_k.addr, align 4, !tbaa !6
  %eta_jCOLS_k.addr6 = bitcast i32* %eta_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_jCOLS_k.addr6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 156)
  store i32 %eta_j1COLS_k, i32* %eta_j1COLS_k.addr, align 4, !tbaa !6
  %eta_j1COLS_k.addr7 = bitcast i32* %eta_j1COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_j1COLS_k.addr7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 157)
  store i32 %dx, i32* %dx.addr, align 4, !tbaa !6
  %dx.addr8 = bitcast i32* %dx.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dx.addr8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 158)
  store i32 %dy, i32* %dy.addr, align 4, !tbaa !6
  %dy.addr9 = bitcast i32* %dy.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dy.addr9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 159)
  %0 = load i32, i32* %dt.addr, align 4, !tbaa !6, !optimi !22
  %sub = sub i32 0, %0, !optimi !24
  %1 = load i32, i32* %g.addr, align 4, !tbaa !6, !optimi !23
  %mul = mul nsw i32 %1, %sub, !optimi !25
  %2 = load i32, i32* %eta_jCOLS_k_1.addr, align 4, !tbaa !6, !optimi !1
  %3 = load i32, i32* %eta_jCOLS_k.addr, align 4, !tbaa !6, !optimi !1
  %sub10 = sub nsw i32 %2, %3, !optimi !26
  %mul11 = mul nsw i32 %mul, %sub10, !optimi !27
  %4 = load i32, i32* %dx.addr, align 4, !tbaa !6, !optimi !22
  %div = sdiv i32 %mul11, %4, !optimi !21
  %5 = load i32*, i32** %du.addr, align 8, !tbaa !2, !optimi !21
  store i32 %div, i32* %5, align 4, !tbaa !6

  %6 = load i32, i32* %dt.addr, align 4, !tbaa !6, !optimi !22
  %sub12 = sub i32 0, %6, !optimi !24
  %7 = load i32, i32* %g.addr, align 4, !tbaa !6, !optimi !23
  %mul13 = mul nsw i32 %7, %sub12, !optimi !25
  %8 = load i32, i32* %eta_j1COLS_k.addr, align 4, !tbaa !6, !optimi !1
  %9 = load i32, i32* %eta_jCOLS_k.addr, align 4, !tbaa !6, !optimi !1
  %sub14 = sub nsw i32 %8, %9, !optimi !26
  %mul15 = mul nsw i32 %mul13, %sub14, !optimi !27
  %10 = load i32, i32* %dy.addr, align 4, !tbaa !6, !optimi !22
  %div16 = sdiv i32 %mul15, %10, !optimi !21
  %11 = load i32*, i32** %dv.addr, align 8, !tbaa !2, !optimi !21
  store i32 %div16, i32* %11, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host_secondLoop(i32* %un_jCOLS_k, i32 %u_jCOLS_k, i32 %du_jCOLS_k, i32 %wet_jCOLS_k, i32 %wet_jCOLS_k_1, i32* %vn, i32 %v_jCOLS_k, i32* %dv) local_unnamed_addr #0 {
entry:
  %un_jCOLS_k.addr = alloca i32*, align 8, !optimi !10
  %u_jCOLS_k.addr = alloca i32, align 4, !optimi !10
  %du_jCOLS_k.addr = alloca i32, align 4, !optimi !21
  %wet_jCOLS_k.addr = alloca i32, align 4, !optimi !8
  %wet_jCOLS_k_1.addr = alloca i32, align 4, !optimi !8
  %vn.addr = alloca i32*, align 8, !optimi !10
  %v_jCOLS_k.addr = alloca i32, align 4, !optimi !10
  %dv.addr = alloca i32*, align 8, !optimi !21
  store i32* %un_jCOLS_k, i32** %un_jCOLS_k.addr, align 8, !tbaa !2
  %un_jCOLS_k.addr1 = bitcast i32** %un_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un_jCOLS_k.addr1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 179)
  store i32 %u_jCOLS_k, i32* %u_jCOLS_k.addr, align 4, !tbaa !6
  %u_jCOLS_k.addr2 = bitcast i32* %u_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u_jCOLS_k.addr2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 180)
  store i32 %du_jCOLS_k, i32* %du_jCOLS_k.addr, align 4, !tbaa !6
  %du_jCOLS_k.addr3 = bitcast i32* %du_jCOLS_k.addr to i8*, !optimi !21
  call void @llvm.var.annotation(i8* nonnull %du_jCOLS_k.addr3, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 181)
  store i32 %wet_jCOLS_k, i32* %wet_jCOLS_k.addr, align 4, !tbaa !6
  %wet_jCOLS_k.addr4 = bitcast i32* %wet_jCOLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k.addr4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 182)
  store i32 %wet_jCOLS_k_1, i32* %wet_jCOLS_k_1.addr, align 4, !tbaa !6
  %wet_jCOLS_k_1.addr5 = bitcast i32* %wet_jCOLS_k_1.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k_1.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 183)
  store i32* %vn, i32** %vn.addr, align 8, !tbaa !2
  %vn.addr6 = bitcast i32** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 184)
  store i32 %v_jCOLS_k, i32* %v_jCOLS_k.addr, align 4, !tbaa !6
  %v_jCOLS_k.addr7 = bitcast i32* %v_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v_jCOLS_k.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 185)
  store i32* %dv, i32** %dv.addr, align 8, !tbaa !2
  %dv.addr8 = bitcast i32** %dv.addr to i8*, !optimi !21
  call void @llvm.var.annotation(i8* nonnull %dv.addr8, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 186)
  %0 = load i32*, i32** %un_jCOLS_k.addr, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %0, align 4, !tbaa !6
  %1 = load i32, i32* %u_jCOLS_k.addr, align 4, !tbaa !6, !optimi !10
  %2 = load i32, i32* %du_jCOLS_k.addr, align 4, !tbaa !6, !optimi !21
  %3 = load i32, i32* %wet_jCOLS_k.addr, align 4, !tbaa !6, !optimi !8
  %cmp = icmp eq i32 %3, 1, !optimi !8
  %4 = load i32, i32* %wet_jCOLS_k_1.addr, align 4, !tbaa !6, !optimi !8
  %cmp9 = icmp eq i32 %4, 1, !optimi !8
  %cmp10 = icmp sgt i32 %2, 0, !optimi !8
  %or.cond = or i1 %cmp10, %cmp9, !optimi !8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %or.cond, label %if.then11, label %if.end18

if.then11:                                        ; preds = %if.then
  %add = add nsw i32 %2, %1, !optimi !28
  store i32 %add, i32* %0, align 4, !tbaa !6
  br label %if.end18

if.else:                                          ; preds = %entry
  br i1 %or.cond, label %if.then15, label %if.end18

if.then15:                                        ; preds = %if.else
  %add16 = add nsw i32 %2, %1, !optimi !28
  store i32 %add16, i32* %0, align 4, !tbaa !6
  br label %if.end18

if.end18:                                         ; preds = %if.then15, %if.else, %if.then11, %if.then
  %5 = load i32*, i32** %vn.addr, align 8, !tbaa !2, !optimi !10
  store i32 0, i32* %5, align 4, !tbaa !6
  %6 = load i32, i32* %v_jCOLS_k.addr, align 4, !tbaa !6, !optimi !10
  %7 = load i32*, i32** %dv.addr, align 8, !tbaa !2, !optimi !21
  %8 = load i32, i32* %7, align 4, !tbaa !6, !optimi !21
  %9 = load i32, i32* %wet_jCOLS_k.addr, align 4, !tbaa !6, !optimi !8
  %cmp19 = icmp eq i32 %9, 1, !optimi !8
  %10 = load i32, i32* %wet_jCOLS_k_1.addr, align 4, !tbaa !6, !optimi !8
  %cmp21 = icmp eq i32 %10, 1, !optimi !8
  br i1 %cmp19, label %if.then20, label %if.else27

if.then20:                                        ; preds = %if.end18
  %cmp23 = icmp sgt i32 %8, 0, !optimi !8
  %or.cond36 = or i1 %cmp23, %cmp21, !optimi !8
  br i1 %or.cond36, label %if.then24, label %if.end34

if.then24:                                        ; preds = %if.then20
  %add25 = add nsw i32 %8, %6, !optimi !28
  store i32 %add25, i32* %5, align 4, !tbaa !6
  br label %if.end34

if.else27:                                        ; preds = %if.end18
  %cmp30 = icmp slt i32 %8, 0, !optimi !8
  %or.cond37 = or i1 %cmp30, %cmp21, !optimi !8
  br i1 %or.cond37, label %if.then31, label %if.end34

if.then31:                                        ; preds = %if.else27
  %add32 = add nsw i32 %8, %6, !optimi !28
  store i32 %add32, i32* %5, align 4, !tbaa !6
  br label %if.end34

if.end34:                                         ; preds = %if.then31, %if.else27, %if.then24, %if.then20
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host_finalLoop(i32 %dx, i32 %dy, i32 %dt, i32 %un_jCOLS_k, i32 %un_jCOLS_k_neg1, i32 %vn_jCOLS_k, i32 %vn_neg1_jCOLS_k, i32 %h_jCOLS_k, i32 %h_jCOLS_k_1, i32 %h_jCOLS_k_neg1, i32 %h_jCOLS_1_k, i32 %h_neg1_jCOLS_k, i32* %etan, i32* %eta) local_unnamed_addr #0 {
entry:
  %dx.addr = alloca i32, align 4, !optimi !22
  %dy.addr = alloca i32, align 4, !optimi !22
  %dt.addr = alloca i32, align 4, !optimi !22
  %un_jCOLS_k.addr = alloca i32, align 4, !optimi !10
  %un_jCOLS_k_neg1.addr = alloca i32, align 4, !optimi !10
  %vn_jCOLS_k.addr = alloca i32, align 4, !optimi !10
  %vn_neg1_jCOLS_k.addr = alloca i32, align 4, !optimi !10
  %h_jCOLS_k.addr = alloca i32, align 4, !optimi !1
  %h_jCOLS_k_1.addr = alloca i32, align 4, !optimi !1
  %h_jCOLS_k_neg1.addr = alloca i32, align 4, !optimi !1
  %h_jCOLS_1_k.addr = alloca i32, align 4, !optimi !1
  %h_neg1_jCOLS_k.addr = alloca i32, align 4, !optimi !1
  %etan.addr = alloca i32*, align 8, !optimi !1
  %eta.addr = alloca i32*, align 8, !optimi !1
  store i32 %dx, i32* %dx.addr, align 4, !tbaa !6
  %dx.addr1 = bitcast i32* %dx.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dx.addr1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 233)
  store i32 %dy, i32* %dy.addr, align 4, !tbaa !6
  %dy.addr2 = bitcast i32* %dy.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dy.addr2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 234)
  store i32 %dt, i32* %dt.addr, align 4, !tbaa !6
  %dt.addr3 = bitcast i32* %dt.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dt.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 235)
  store i32 %un_jCOLS_k, i32* %un_jCOLS_k.addr, align 4, !tbaa !6
  %un_jCOLS_k.addr4 = bitcast i32* %un_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un_jCOLS_k.addr4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 236)
  store i32 %un_jCOLS_k_neg1, i32* %un_jCOLS_k_neg1.addr, align 4, !tbaa !6
  %un_jCOLS_k_neg1.addr5 = bitcast i32* %un_jCOLS_k_neg1.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un_jCOLS_k_neg1.addr5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 237)
  store i32 %vn_jCOLS_k, i32* %vn_jCOLS_k.addr, align 4, !tbaa !6
  %vn_jCOLS_k.addr6 = bitcast i32* %vn_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn_jCOLS_k.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 238)
  store i32 %vn_neg1_jCOLS_k, i32* %vn_neg1_jCOLS_k.addr, align 4, !tbaa !6
  %vn_neg1_jCOLS_k.addr7 = bitcast i32* %vn_neg1_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn_neg1_jCOLS_k.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 239)
  store i32 %h_jCOLS_k, i32* %h_jCOLS_k.addr, align 4, !tbaa !6
  %h_jCOLS_k.addr8 = bitcast i32* %h_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_k.addr8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 240)
  store i32 %h_jCOLS_k_1, i32* %h_jCOLS_k_1.addr, align 4, !tbaa !6
  %h_jCOLS_k_1.addr9 = bitcast i32* %h_jCOLS_k_1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_k_1.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 241)
  store i32 %h_jCOLS_k_neg1, i32* %h_jCOLS_k_neg1.addr, align 4, !tbaa !6
  %h_jCOLS_k_neg1.addr10 = bitcast i32* %h_jCOLS_k_neg1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_k_neg1.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 242)
  store i32 %h_jCOLS_1_k, i32* %h_jCOLS_1_k.addr, align 4, !tbaa !6
  %h_jCOLS_1_k.addr11 = bitcast i32* %h_jCOLS_1_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_1_k.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 243)
  store i32 %h_neg1_jCOLS_k, i32* %h_neg1_jCOLS_k.addr, align 4, !tbaa !6
  %h_neg1_jCOLS_k.addr12 = bitcast i32* %h_neg1_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_neg1_jCOLS_k.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 244)
  store i32* %etan, i32** %etan.addr, align 8, !tbaa !2
  %etan.addr13 = bitcast i32** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 245)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !2
  %eta.addr14 = bitcast i32** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 246)
  %0 = load i32, i32* %un_jCOLS_k.addr, align 4, !tbaa !6, !optimi !10
  %cmp = icmp sgt i32 %0, -1, !optimi !8
  %sub = sub nsw i32 0, %0, !optimi !10
  %cond = select i1 %cmp, i32 %0, i32 %sub, !optimi !10
  %add = add nsw i32 %cond, %0, !optimi !29
  %1 = load i32, i32* %h_jCOLS_k.addr, align 4, !tbaa !6, !optimi !1
  %mul = mul nsw i32 %add, %1, !optimi !30
  %div = sdiv i32 %mul, 2, !optimi !31
  %sub21 = sub nsw i32 %0, %cond, !optimi !29
  %2 = load i32, i32* %h_jCOLS_k_1.addr, align 4, !tbaa !6, !optimi !1
  %mul22 = mul nsw i32 %sub21, %2, !optimi !30
  %div23 = sdiv i32 %mul22, 2, !optimi !31

  %3 = load i32, i32* %un_jCOLS_k_neg1.addr, align 4, !tbaa !6, !optimi !10
  %cmp25 = icmp sgt i32 %3, -1, !optimi !8
  %sub28 = sub nsw i32 0, %3, !optimi !10
  %cond30 = select i1 %cmp25, i32 %3, i32 %sub28, !optimi !10
  %add31 = add nsw i32 %cond30, %3, !optimi !29
  %4 = load i32, i32* %h_jCOLS_k_neg1.addr, align 4, !tbaa !6, !optimi !1
  %mul32 = mul nsw i32 %add31, %4, !optimi !30
  %sub40 = sub nsw i32 %3, %cond30, !optimi !29
  %mul41 = mul nsw i32 %sub40, %1, !optimi !30

  %5 = load i32, i32* %vn_jCOLS_k.addr, align 4, !tbaa !6, !optimi !10
  %cmp44 = icmp sgt i32 %5, -1, !optimi !8
  %sub47 = sub nsw i32 0, %5, !optimi !10
  %cond49 = select i1 %cmp44, i32 %5, i32 %sub47, !optimi !10
  %add50 = add nsw i32 %cond49, %5, !optimi !29
  %mul51 = mul nsw i32 %add50, %1, !optimi !30
  %div52 = sdiv i32 %mul51, 2, !optimi !31
  %sub59 = sub nsw i32 %5, %cond49, !optimi !29
  %6 = load i32, i32* %h_jCOLS_1_k.addr, align 4, !tbaa !6, !optimi !1
  %mul60 = mul nsw i32 %sub59, %6, !optimi !30
  %div61 = sdiv i32 %mul60, 2, !optimi !31

  %7 = load i32, i32* %vn_neg1_jCOLS_k.addr, align 4, !tbaa !6, !optimi !10
  %cmp63 = icmp sgt i32 %7, -1, !optimi !8
  %sub66 = sub nsw i32 0, %7, !optimi !10
  %cond68 = select i1 %cmp63, i32 %7, i32 %sub66, !optimi !10
  %add69 = add nsw i32 %cond68, %7, !optimi !29
  %8 = load i32, i32* %h_neg1_jCOLS_k.addr, align 4, !tbaa !6, !optimi !1
  %mul70 = mul nsw i32 %add69, %8, !optimi !30
  %sub78 = sub nsw i32 %7, %cond68, !optimi !29
  %mul79 = mul nsw i32 %sub78, %1, !optimi !30

  
  %9 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  %10 = load i32, i32* %9, align 4, !tbaa !6, !optimi !1
  %11 = load i32, i32* %dt.addr, align 4, !tbaa !6, !optimi !22
  %div33.neg = sdiv i32 %mul32, -2, !optimi !31
  %div42.neg = sdiv i32 %mul41, -2, !optimi !31
  %add43.neg = add nsw i32 %div, %div23, !optimi !30
  %add24 = add i32 %add43.neg, %div42.neg, !optimi !32
  %sub82 = add i32 %add24, %div33.neg, !optimi !33
  %mul83 = mul nsw i32 %11, %sub82, !optimi !34
  %12 = load i32, i32* %dx.addr, align 4, !tbaa !6, !optimi !22
  %div84 = sdiv i32 %mul83, %12, !optimi !35
  %sub85 = sub i32 %10, %div84, !optimi !36
  %div71.neg = sdiv i32 %mul70, -2, !optimi !31
  %div80.neg = sdiv i32 %mul79, -2, !optimi !31
  %add81.neg = add nsw i32 %div52, %div61, !optimi !30
  %add62 = add i32 %add81.neg, %div80.neg, !optimi !32
  %sub86 = add i32 %add62, %div71.neg, !optimi !33
  %mul87 = mul nsw i32 %sub86, %11, !optimi !34
  %13 = load i32, i32* %dy.addr, align 4, !tbaa !6, !optimi !22
  %div88 = sdiv i32 %mul87, %13, !optimi !35
  %sub89 = sub i32 %sub85, %div88, !optimi !37
  %14 = load i32*, i32** %etan.addr, align 8, !tbaa !2, !optimi !1
  store i32 %sub89, i32* %14, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host(i32 %dt, i32 %dx, i32 %dy, i32 %g, i32* %eta, i32* %un, i32* %u, i32* %wet, i32* %v, i32* %vn, i32* %h, i32* %etan, i32 %BytesPerWord) local_unnamed_addr #0 {
entry:
  %du.addr.i = alloca i32*, align 8, !optimi !21
  %dv.addr.i = alloca i32*, align 8, !optimi !21
  %dt.addr.i = alloca i32, align 4, !optimi !22
  %g.addr.i = alloca i32, align 4, !optimi !23
  %eta_jCOLS_k_1.addr.i = alloca i32, align 4, !optimi !1
  %eta_jCOLS_k.addr.i = alloca i32, align 4, !optimi !1
  %eta_j1COLS_k.addr.i = alloca i32, align 4, !optimi !1
  %dx.addr.i = alloca i32, align 4, !optimi !22
  %dy.addr.i = alloca i32, align 4, !optimi !22
  %dt.addr = alloca i32, align 4, !optimi !22
  %dx.addr = alloca i32, align 4, !optimi !22
  %dy.addr = alloca i32, align 4, !optimi !22
  %g.addr = alloca i32, align 4, !optimi !23
  %eta.addr = alloca i32*, align 8, !optimi !1
  %un.addr = alloca i32*, align 8, !optimi !10
  %u.addr = alloca i32*, align 8, !optimi !10
  %wet.addr = alloca i32*, align 8, !optimi !8
  %v.addr = alloca i32*, align 8, !optimi !10
  %vn.addr = alloca i32*, align 8, !optimi !10
  %h.addr = alloca i32*, align 8, !optimi !1
  %etan.addr = alloca i32*, align 8, !optimi !1
  %BytesPerWord.addr = alloca i32, align 4, !optimi !12
  %dv = alloca i32*, align 8, !optimi !21
  %du = alloca i32*, align 8, !optimi !21
  store i32 %dt, i32* %dt.addr, align 4, !tbaa !6
  %dt.addr1 = bitcast i32* %dt.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dt.addr1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 296)
  store i32 %dx, i32* %dx.addr, align 4, !tbaa !6
  %dx.addr2 = bitcast i32* %dx.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dx.addr2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 297)
  store i32 %dy, i32* %dy.addr, align 4, !tbaa !6
  %dy.addr3 = bitcast i32* %dy.addr to i8*, !optimi !22
  call void @llvm.var.annotation(i8* nonnull %dy.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 298)
  store i32 %g, i32* %g.addr, align 4, !tbaa !6
  %g.addr4 = bitcast i32* %g.addr to i8*, !optimi !23
  call void @llvm.var.annotation(i8* nonnull %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 299)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !2
  %eta.addr5 = bitcast i32** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 300)
  store i32* %un, i32** %un.addr, align 8, !tbaa !2
  %un.addr6 = bitcast i32** %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 301)
  store i32* %u, i32** %u.addr, align 8, !tbaa !2
  %u.addr7 = bitcast i32** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 302)
  store i32* %wet, i32** %wet.addr, align 8, !tbaa !2
  %wet.addr8 = bitcast i32** %wet.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 303)
  store i32* %v, i32** %v.addr, align 8, !tbaa !2
  %v.addr9 = bitcast i32** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 304)
  store i32* %vn, i32** %vn.addr, align 8, !tbaa !2
  %vn.addr10 = bitcast i32** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr10, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 305)
  store i32* %h, i32** %h.addr, align 8, !tbaa !2
  %h.addr11 = bitcast i32** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 306)
  store i32* %etan, i32** %etan.addr, align 8, !tbaa !2
  %etan.addr12 = bitcast i32** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 307)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !6
  %BytesPerWord.addr13 = bitcast i32* %BytesPerWord.addr to i8*, !optimi !12
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 308)
  %0 = bitcast i32** %dv to i8*, !optimi !21
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #1
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 327)
  %1 = bitcast i32** %du to i8*, !optimi !21
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #1
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 328)
  %2 = bitcast i32** %du to i8**, !optimi !21
  %3 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !6, !optimi !12
  %mul = shl nsw i32 %3, 18, !optimi !38
  %conv = sext i32 %mul to i64, !optimi !38
  %call = call i32 @posix_memalign(i8** nonnull %2, i64 64, i64 %conv) #1, !optimi !39
  %4 = bitcast i32** %dv to i8**, !optimi !21
  %5 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !6, !optimi !12
  %mul16 = shl nsw i32 %5, 18, !optimi !38
  %conv17 = sext i32 %mul16 to i64, !optimi !38
  %call18 = call i32 @posix_memalign(i8** nonnull %4, i64 64, i64 %conv17) #1, !optimi !39
  %6 = bitcast i32** %du.addr.i to i8*, !optimi !21
  %7 = bitcast i32** %dv.addr.i to i8*, !optimi !21
  %8 = bitcast i32* %dt.addr.i to i8*, !optimi !22
  %9 = bitcast i32* %g.addr.i to i8*, !optimi !23
  %10 = bitcast i32* %eta_jCOLS_k_1.addr.i to i8*, !optimi !1
  %11 = bitcast i32* %eta_jCOLS_k.addr.i to i8*, !optimi !1
  %12 = bitcast i32* %eta_j1COLS_k.addr.i to i8*, !optimi !1
  %13 = bitcast i32* %dx.addr.i to i8*, !optimi !22
  %14 = bitcast i32* %dy.addr.i to i8*, !optimi !22
  br label %for.cond20.preheader

for.cond.loopexit:                                ; preds = %for.body23
  %exitcond252 = icmp eq i64 %indvars.iv.next249, 511, !optimi !8
  br i1 %exitcond252, label %for.cond50.preheader.preheader, label %for.cond20.preheader

for.cond50.preheader.preheader:                   ; preds = %for.cond.loopexit
  br label %for.cond50.preheader

for.cond20.preheader:                             ; preds = %for.cond.loopexit, %entry
  %indvars.iv248 = phi i64 [ 1, %entry ], [ %indvars.iv.next249, %for.cond.loopexit ], !optimi !40
  %indvars.iv.next249 = add nuw nsw i64 %indvars.iv248, 1, !optimi !40
  %15 = shl nsw i64 %indvars.iv248, 9, !optimi !41
  %16 = shl i64 %indvars.iv.next249, 9, !optimi !41
  br label %for.body23

for.body23:                                       ; preds = %for.body23, %for.cond20.preheader
  %indvars.iv242 = phi i64 [ 1, %for.cond20.preheader ], [ %indvars.iv.next243, %for.body23 ], !optimi !40
  %17 = load i32*, i32** %du, align 8, !tbaa !2, !optimi !21
  %18 = add nuw nsw i64 %indvars.iv242, %15, !optimi !42
  %arrayidx = getelementptr inbounds i32, i32* %17, i64 %18, !optimi !21
  %19 = load i32*, i32** %dv, align 8, !tbaa !2, !optimi !21
  %arrayidx28 = getelementptr inbounds i32, i32* %19, i64 %18, !optimi !21
  %20 = load i32, i32* %dt.addr, align 4, !tbaa !6, !optimi !22
  %21 = load i32, i32* %g.addr, align 4, !tbaa !6, !optimi !23
  %22 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  %23 = add nuw nsw i64 %18, 1, !optimi !43
  %arrayidx33 = getelementptr inbounds i32, i32* %22, i64 %23, !optimi !1
  %24 = load i32, i32* %arrayidx33, align 4, !tbaa !6, !optimi !1
  %arrayidx37 = getelementptr inbounds i32, i32* %22, i64 %18, !optimi !1
  %25 = load i32, i32* %arrayidx37, align 4, !tbaa !6, !optimi !1
  %26 = add nuw nsw i64 %indvars.iv242, %16, !optimi !42
  %arrayidx42 = getelementptr inbounds i32, i32* %22, i64 %26, !optimi !1
  %27 = load i32, i32* %arrayidx42, align 4, !tbaa !6, !optimi !1
  %28 = load i32, i32* %dx.addr, align 4, !tbaa !6, !optimi !22
  %29 = load i32, i32* %dy.addr, align 4, !tbaa !6, !optimi !22
  call void @llvm.lifetime.start(i64 8, i8* nonnull %6)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %7)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %8)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %9)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %10)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %11)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %12)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %13)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %14)
  store i32* %arrayidx, i32** %du.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %6, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 151) #1
  store i32* %arrayidx28, i32** %dv.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %7, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 152) #1
  store i32 %20, i32* %dt.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 153) #1
  store i32 %21, i32* %g.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 154) #1
  store i32 %24, i32* %eta_jCOLS_k_1.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 155) #1
  store i32 %25, i32* %eta_jCOLS_k.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 156) #1
  store i32 %27, i32* %eta_j1COLS_k.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 157) #1
  store i32 %28, i32* %dx.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 158) #1
  store i32 %29, i32* %dy.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 159) #1
  %30 = load i32, i32* %dt.addr.i, align 4, !tbaa !6, !optimi !22
  %sub.i = sub i32 0, %30, !optimi !24
  %31 = load i32, i32* %g.addr.i, align 4, !tbaa !6, !optimi !23
  %mul.i = mul nsw i32 %31, %sub.i, !optimi !25
  %32 = load i32, i32* %eta_jCOLS_k_1.addr.i, align 4, !tbaa !6, !optimi !1
  %33 = load i32, i32* %eta_jCOLS_k.addr.i, align 4, !tbaa !6, !optimi !1
  %sub10.i = sub nsw i32 %32, %33, !optimi !26
  %mul11.i = mul nsw i32 %mul.i, %sub10.i, !optimi !27
  %34 = load i32, i32* %dx.addr.i, align 4, !tbaa !6, !optimi !22
  %div.i = sdiv i32 %mul11.i, %34, !optimi !21
  %35 = load i32*, i32** %du.addr.i, align 8, !tbaa !2, !optimi !21
  store i32 %div.i, i32* %35, align 4, !tbaa !6
  %36 = load i32, i32* %dt.addr.i, align 4, !tbaa !6, !optimi !22
  %sub12.i = sub i32 0, %36, !optimi !24
  %37 = load i32, i32* %g.addr.i, align 4, !tbaa !6, !optimi !23
  %mul13.i = mul nsw i32 %37, %sub12.i, !optimi !25
  %38 = load i32, i32* %eta_j1COLS_k.addr.i, align 4, !tbaa !6, !optimi !1
  %39 = load i32, i32* %eta_jCOLS_k.addr.i, align 4, !tbaa !6, !optimi !1
  %sub14.i = sub nsw i32 %38, %39, !optimi !26
  %mul15.i = mul nsw i32 %mul13.i, %sub14.i, !optimi !27
  %40 = load i32, i32* %dy.addr.i, align 4, !tbaa !6, !optimi !22
  %div16.i = sdiv i32 %mul15.i, %40, !optimi !21
  %41 = load i32*, i32** %dv.addr.i, align 8, !tbaa !2, !optimi !21
  store i32 %div16.i, i32* %41, align 4, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %6)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %7)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %8)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %9)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %10)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %11)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %12)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %13)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %14)
  %indvars.iv.next243 = add nuw nsw i64 %indvars.iv242, 1, !optimi !40
  %exitcond247 = icmp eq i64 %indvars.iv.next243, 511, !optimi !8
  br i1 %exitcond247, label %for.cond.loopexit, label %for.body23

for.cond50.preheader:                             ; preds = %for.cond50.preheader.preheader, %for.inc90
  %indvars.iv238 = phi i64 [ %indvars.iv.next239, %for.inc90 ], [ 1, %for.cond50.preheader.preheader ], !optimi !40
  %42 = shl nsw i64 %indvars.iv238, 9, !optimi !41
  br label %for.body53

for.body53:                                       ; preds = %for.body53, %for.cond50.preheader
  %indvars.iv233 = phi i64 [ 1, %for.cond50.preheader ], [ %indvars.iv.next234, %for.body53 ], !optimi !40
  %43 = load i32*, i32** %un.addr, align 8, !tbaa !2, !optimi !10
  %44 = add nuw nsw i64 %indvars.iv233, %42, !optimi !42
  %arrayidx57 = getelementptr inbounds i32, i32* %43, i64 %44, !optimi !10
  %45 = load i32*, i32** %u.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx61 = getelementptr inbounds i32, i32* %45, i64 %44, !optimi !10
  %46 = load i32, i32* %arrayidx61, align 4, !tbaa !6, !optimi !10
  %47 = load i32*, i32** %du, align 8, !tbaa !2, !optimi !21
  %arrayidx65 = getelementptr inbounds i32, i32* %47, i64 %44, !optimi !21
  %48 = load i32, i32* %arrayidx65, align 4, !tbaa !6, !optimi !21
  %49 = load i32*, i32** %wet.addr, align 8, !tbaa !2, !optimi !8
  %arrayidx69 = getelementptr inbounds i32, i32* %49, i64 %44, !optimi !8
  %50 = load i32, i32* %arrayidx69, align 4, !tbaa !6, !optimi !8
  %51 = add nuw nsw i64 %44, 1, !optimi !43
  %arrayidx74 = getelementptr inbounds i32, i32* %49, i64 %51, !optimi !8
  %52 = load i32, i32* %arrayidx74, align 4, !tbaa !6, !optimi !8
  %53 = load i32*, i32** %vn.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx78 = getelementptr inbounds i32, i32* %53, i64 %44, !optimi !10
  %54 = load i32*, i32** %v.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx82 = getelementptr inbounds i32, i32* %54, i64 %44, !optimi !10
  %55 = load i32, i32* %arrayidx82, align 4, !tbaa !6, !optimi !10
  %56 = load i32*, i32** %dv, align 8, !tbaa !2, !optimi !21
  %arrayidx86 = getelementptr inbounds i32, i32* %56, i64 %44, !optimi !21
  call void @sw2d_dyn_host_secondLoop(i32* %arrayidx57, i32 %46, i32 %48, i32 %50, i32 %52, i32* %arrayidx78, i32 %55, i32* %arrayidx86)
  %indvars.iv.next234 = add nuw nsw i64 %indvars.iv233, 1, !optimi !40
  %exitcond237 = icmp eq i64 %indvars.iv.next234, 511, !optimi !8
  br i1 %exitcond237, label %for.inc90, label %for.body53

for.inc90:                                        ; preds = %for.body53
  %indvars.iv.next239 = add nuw nsw i64 %indvars.iv238, 1, !optimi !40
  %exitcond241 = icmp eq i64 %indvars.iv.next239, 511, !optimi !8
  br i1 %exitcond241, label %for.cond97.preheader.preheader, label %for.cond50.preheader

for.cond97.preheader.preheader:                   ; preds = %for.inc90
  br label %for.cond97.preheader

for.cond93.loopexit:                              ; preds = %for.body100
  %exitcond232 = icmp eq i64 %indvars.iv.next228, 511, !optimi !8
  br i1 %exitcond232, label %for.end155, label %for.cond97.preheader

for.cond97.preheader:                             ; preds = %for.cond97.preheader.preheader, %for.cond93.loopexit
  %indvars.iv227 = phi i64 [ %indvars.iv.next228, %for.cond93.loopexit ], [ 1, %for.cond97.preheader.preheader ], !optimi !40
  %indvars.iv.next228 = add nuw nsw i64 %indvars.iv227, 1, !optimi !40
  %57 = shl i64 %indvars.iv227, 9, !optimi !41
  %58 = add nsw i64 %57, -512, !optimi !44
  %59 = shl i64 %indvars.iv.next228, 9, !optimi !41
  br label %for.body100

for.body100:                                      ; preds = %for.body100, %for.cond97.preheader
  %indvars.iv = phi i64 [ 1, %for.cond97.preheader ], [ %indvars.iv.next, %for.body100 ], !optimi !40
  %60 = load i32, i32* %dx.addr, align 4, !tbaa !6, !optimi !22
  %61 = load i32, i32* %dy.addr, align 4, !tbaa !6, !optimi !22
  %62 = load i32, i32* %dt.addr, align 4, !tbaa !6, !optimi !22
  %63 = load i32*, i32** %un.addr, align 8, !tbaa !2, !optimi !10
  %64 = add nuw nsw i64 %indvars.iv, %57, !optimi !42
  %arrayidx104 = getelementptr inbounds i32, i32* %63, i64 %64, !optimi !10
  %65 = load i32, i32* %arrayidx104, align 4, !tbaa !6, !optimi !10
  %66 = add nsw i64 %64, -1, !optimi !45
  %arrayidx108 = getelementptr inbounds i32, i32* %63, i64 %66, !optimi !10
  %67 = load i32, i32* %arrayidx108, align 4, !tbaa !6, !optimi !10
  %68 = load i32*, i32** %vn.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx112 = getelementptr inbounds i32, i32* %68, i64 %64, !optimi !10
  %69 = load i32, i32* %arrayidx112, align 4, !tbaa !6, !optimi !10
  %70 = add nuw nsw i64 %58, %indvars.iv, !optimi !46
  %arrayidx117 = getelementptr inbounds i32, i32* %68, i64 %70, !optimi !10
  %71 = load i32, i32* %arrayidx117, align 4, !tbaa !6, !optimi !10
  %72 = load i32*, i32** %h.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx121 = getelementptr inbounds i32, i32* %72, i64 %64, !optimi !1
  %73 = load i32, i32* %arrayidx121, align 4, !tbaa !6, !optimi !1
  %74 = add nuw nsw i64 %64, 1, !optimi !43
  %arrayidx126 = getelementptr inbounds i32, i32* %72, i64 %74, !optimi !1
  %75 = load i32, i32* %arrayidx126, align 4, !tbaa !6, !optimi !1
  %arrayidx131 = getelementptr inbounds i32, i32* %72, i64 %66, !optimi !1
  %76 = load i32, i32* %arrayidx131, align 4, !tbaa !6, !optimi !1
  %77 = add nuw nsw i64 %indvars.iv, %59, !optimi !42
  %arrayidx136 = getelementptr inbounds i32, i32* %72, i64 %77, !optimi !1
  %78 = load i32, i32* %arrayidx136, align 4, !tbaa !6, !optimi !1
  %arrayidx141 = getelementptr inbounds i32, i32* %72, i64 %70, !optimi !1
  %79 = load i32, i32* %arrayidx141, align 4, !tbaa !6, !optimi !1
  %80 = load i32*, i32** %etan.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx145 = getelementptr inbounds i32, i32* %80, i64 %64, !optimi !1
  %81 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx149 = getelementptr inbounds i32, i32* %81, i64 %64, !optimi !1
  call void @sw2d_dyn_host_finalLoop(i32 %60, i32 %61, i32 %62, i32 %65, i32 %67, i32 %69, i32 %71, i32 %73, i32 %75, i32 %76, i32 %78, i32 %79, i32* %arrayidx145, i32* %arrayidx149)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !40
  %exitcond = icmp eq i64 %indvars.iv.next, 511, !optimi !8
  br i1 %exitcond, label %for.cond93.loopexit, label %for.body100

for.end155:                                       ; preds = %for.cond93.loopexit
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #1
  ret void
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @sw2d_shapiro_host_terms(i32 %wet_jCOLS_k, i32 %wet_jCOLS_k_1, i32 %wet_jCOLS_k_neg1, i32 %wet_j1COLS_k, i32 %wet_jNeg1COLS_k, i32 %etan_jCOLS_k, i32 %etan_j1COLS_k, i32 %etan_jNeg1COLS_k, i32 %etan_jCOLS_k_1, i32 %etan_jCOLS_k_neg1, i32 %eps, i32* %eta) local_unnamed_addr #0 {
entry:
  %wet_jCOLS_k.addr = alloca i32, align 4, !optimi !8
  %wet_jCOLS_k_1.addr = alloca i32, align 4, !optimi !8
  %wet_jCOLS_k_neg1.addr = alloca i32, align 4, !optimi !8
  %wet_j1COLS_k.addr = alloca i32, align 4, !optimi !8
  %wet_jNeg1COLS_k.addr = alloca i32, align 4, !optimi !8
  %etan_jCOLS_k.addr = alloca i32, align 4, !optimi !1
  %etan_j1COLS_k.addr = alloca i32, align 4, !optimi !1
  %etan_jNeg1COLS_k.addr = alloca i32, align 4, !optimi !1
  %etan_jCOLS_k_1.addr = alloca i32, align 4, !optimi !1
  %etan_jCOLS_k_neg1.addr = alloca i32, align 4, !optimi !1
  %eps.addr = alloca i32, align 4, !optimi !47
  %eta.addr = alloca i32*, align 8, !optimi !1
  store i32 %wet_jCOLS_k, i32* %wet_jCOLS_k.addr, align 4, !tbaa !6
  %wet_jCOLS_k.addr1 = bitcast i32* %wet_jCOLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k.addr1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 397)
  store i32 %wet_jCOLS_k_1, i32* %wet_jCOLS_k_1.addr, align 4, !tbaa !6
  %wet_jCOLS_k_1.addr2 = bitcast i32* %wet_jCOLS_k_1.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k_1.addr2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 398)
  store i32 %wet_jCOLS_k_neg1, i32* %wet_jCOLS_k_neg1.addr, align 4, !tbaa !6
  %wet_jCOLS_k_neg1.addr3 = bitcast i32* %wet_jCOLS_k_neg1.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k_neg1.addr3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 399)
  store i32 %wet_j1COLS_k, i32* %wet_j1COLS_k.addr, align 4, !tbaa !6
  %wet_j1COLS_k.addr4 = bitcast i32* %wet_j1COLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_j1COLS_k.addr4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 400)
  store i32 %wet_jNeg1COLS_k, i32* %wet_jNeg1COLS_k.addr, align 4, !tbaa !6
  %wet_jNeg1COLS_k.addr5 = bitcast i32* %wet_jNeg1COLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jNeg1COLS_k.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 401)
  store i32 %etan_jCOLS_k, i32* %etan_jCOLS_k.addr, align 4, !tbaa !6
  %etan_jCOLS_k.addr6 = bitcast i32* %etan_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_jCOLS_k.addr6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 402)
  store i32 %etan_j1COLS_k, i32* %etan_j1COLS_k.addr, align 4, !tbaa !6
  %etan_j1COLS_k.addr7 = bitcast i32* %etan_j1COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_j1COLS_k.addr7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 403)
  store i32 %etan_jNeg1COLS_k, i32* %etan_jNeg1COLS_k.addr, align 4, !tbaa !6
  %etan_jNeg1COLS_k.addr8 = bitcast i32* %etan_jNeg1COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_jNeg1COLS_k.addr8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 404)
  store i32 %etan_jCOLS_k_1, i32* %etan_jCOLS_k_1.addr, align 4, !tbaa !6
  %etan_jCOLS_k_1.addr9 = bitcast i32* %etan_jCOLS_k_1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_jCOLS_k_1.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 405)
  store i32 %etan_jCOLS_k_neg1, i32* %etan_jCOLS_k_neg1.addr, align 4, !tbaa !6
  %etan_jCOLS_k_neg1.addr10 = bitcast i32* %etan_jCOLS_k_neg1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_jCOLS_k_neg1.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 406)
  store i32 %eps, i32* %eps.addr, align 4, !tbaa !6
  %eps.addr11 = bitcast i32* %eps.addr to i8*, !optimi !47
  call void @llvm.var.annotation(i8* nonnull %eps.addr11, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 407)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !2
  %eta.addr12 = bitcast i32** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 408)
  %0 = load i32, i32* %wet_jCOLS_k.addr, align 4, !tbaa !6, !optimi !8
  %cmp = icmp eq i32 %0, 1, !optimi !8
  %1 = load i32, i32* %etan_jNeg1COLS_k.addr, align 4, !tbaa !6, !optimi !1
  %2 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %eps.addr, align 4, !tbaa !6, !optimi !47
  %4 = load i32, i32* %wet_jCOLS_k_1.addr, align 4, !tbaa !6, !optimi !8
  %5 = load i32, i32* %wet_jCOLS_k_neg1.addr, align 4, !tbaa !6, !optimi !8
  %add = add nsw i32 %5, %4, !optimi !48
  %6 = load i32, i32* %wet_j1COLS_k.addr, align 4, !tbaa !6, !optimi !8
  %add13 = add nsw i32 %add, %6, !optimi !49
  %7 = load i32, i32* %wet_jNeg1COLS_k.addr, align 4, !tbaa !6, !optimi !8
  %add14 = add nsw i32 %add13, %7, !optimi !50
  %mul = mul nsw i32 %add14, %3, !optimi !47
  %div = sdiv i32 %mul, 4, !optimi !47
  %sub = sub nsw i32 1, %div, !optimi !51
  %8 = load i32, i32* %etan_jCOLS_k.addr, align 4, !tbaa !6, !optimi !1
  %mul15 = mul nsw i32 %sub, %8, !optimi !52
  %9 = load i32, i32* %etan_jCOLS_k_1.addr, align 4, !tbaa !6, !optimi !1
  %mul16 = mul nsw i32 %9, %4, !optimi !1
  %10 = load i32, i32* %etan_jCOLS_k_neg1.addr, align 4, !tbaa !6, !optimi !1
  %mul17 = mul nsw i32 %10, %5, !optimi !1
  %add18 = add nsw i32 %mul17, %mul16, !optimi !11
  %mul19 = mul nsw i32 %add18, %3, !optimi !53
  %div20 = sdiv i32 %mul19, 4, !optimi !53
  %11 = load i32, i32* %etan_j1COLS_k.addr, align 4, !tbaa !6, !optimi !1
  %mul21 = mul nsw i32 %11, %6, !optimi !1
  %mul22 = mul nsw i32 %7, %1, !optimi !1
  %add23 = add nsw i32 %mul21, %mul22, !optimi !11
  %mul24 = mul nsw i32 %add23, %3, !optimi !53
  %div25 = sdiv i32 %mul24, 4, !optimi !53
  %add26 = add nsw i32 %div20, %mul15, !optimi !52
  %add27 = add nsw i32 %add26, %div25, !optimi !52
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %storemerge = phi i32 [ %add27, %if.then ], [ %1, %entry ], !optimi !52
  store i32 %storemerge, i32* %2, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_shapiro_host(i32* %wet, i32* %etan, i32 %eps, i32* %eta) local_unnamed_addr #0 {
entry:
  %wet.addr = alloca i32*, align 8, !optimi !8
  %etan.addr = alloca i32*, align 8, !optimi !1
  %eps.addr = alloca i32, align 4, !optimi !47
  %eta.addr = alloca i32*, align 8, !optimi !1
  store i32* %wet, i32** %wet.addr, align 8, !tbaa !2
  %wet.addr1 = bitcast i32** %wet.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet.addr1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 438)
  store i32* %etan, i32** %etan.addr, align 8, !tbaa !2
  %etan.addr2 = bitcast i32** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 439)
  store i32 %eps, i32* %eps.addr, align 4, !tbaa !6
  %eps.addr3 = bitcast i32* %eps.addr to i8*, !optimi !47
  call void @llvm.var.annotation(i8* nonnull %eps.addr3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 440)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !2
  %eta.addr4 = bitcast i32** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 441)
  br label %for.cond5.preheader

for.cond.loopexit:                                ; preds = %for.body7
  %exitcond100 = icmp eq i64 %indvars.iv.next96, 511, !optimi !8
  br i1 %exitcond100, label %for.end58, label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond.loopexit, %entry
  %indvars.iv95 = phi i64 [ 1, %entry ], [ %indvars.iv.next96, %for.cond.loopexit ], !optimi !40
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1, !optimi !40
  %0 = shl i64 %indvars.iv95, 9, !optimi !41
  %1 = shl i64 %indvars.iv.next96, 9, !optimi !41
  %2 = add nsw i64 %0, -512, !optimi !44
  br label %for.body7

for.body7:                                        ; preds = %for.body7, %for.cond5.preheader
  %indvars.iv = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %for.body7 ], !optimi !40
  %3 = load i32*, i32** %wet.addr, align 8, !tbaa !2, !optimi !8
  %4 = add nuw nsw i64 %indvars.iv, %0, !optimi !42
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !optimi !8
  %5 = load i32, i32* %arrayidx, align 4, !tbaa !6, !optimi !8
  %6 = add nuw nsw i64 %4, 1, !optimi !43
  %arrayidx12 = getelementptr inbounds i32, i32* %3, i64 %6, !optimi !8
  %7 = load i32, i32* %arrayidx12, align 4, !tbaa !6, !optimi !8
  %8 = add nsw i64 %4, -1, !optimi !45
  %arrayidx16 = getelementptr inbounds i32, i32* %3, i64 %8, !optimi !8
  %9 = load i32, i32* %arrayidx16, align 4, !tbaa !6, !optimi !8
  %10 = add nuw nsw i64 %indvars.iv, %1, !optimi !42
  %arrayidx21 = getelementptr inbounds i32, i32* %3, i64 %10, !optimi !8
  %11 = load i32, i32* %arrayidx21, align 4, !tbaa !6, !optimi !8
  %12 = add nuw nsw i64 %2, %indvars.iv, !optimi !46
  %arrayidx26 = getelementptr inbounds i32, i32* %3, i64 %12, !optimi !8
  %13 = load i32, i32* %arrayidx26, align 4, !tbaa !6, !optimi !8
  %14 = load i32*, i32** %etan.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx30 = getelementptr inbounds i32, i32* %14, i64 %4, !optimi !1
  %15 = load i32, i32* %arrayidx30, align 4, !tbaa !6, !optimi !1
  %arrayidx35 = getelementptr inbounds i32, i32* %14, i64 %10, !optimi !1
  %16 = load i32, i32* %arrayidx35, align 4, !tbaa !6, !optimi !1
  %arrayidx40 = getelementptr inbounds i32, i32* %14, i64 %12, !optimi !1
  %17 = load i32, i32* %arrayidx40, align 4, !tbaa !6, !optimi !1
  %arrayidx45 = getelementptr inbounds i32, i32* %14, i64 %6, !optimi !1
  %18 = load i32, i32* %arrayidx45, align 4, !tbaa !6, !optimi !1
  %arrayidx50 = getelementptr inbounds i32, i32* %14, i64 %8, !optimi !1
  %19 = load i32, i32* %arrayidx50, align 4, !tbaa !6, !optimi !1
  %20 = load i32, i32* %eps.addr, align 4, !tbaa !6, !optimi !47
  %21 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx55 = getelementptr inbounds i32, i32* %21, i64 %12, !optimi !1
  call void @sw2d_shapiro_host_terms(i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %16, i32 %17, i32 %18, i32 %19, i32 %20, i32* %arrayidx55)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !40
  %exitcond = icmp eq i64 %indvars.iv.next, 511, !optimi !8
  br i1 %exitcond, label %for.cond.loopexit, label %for.body7

for.end58:                                        ; preds = %for.cond.loopexit
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_updates_host_loop(i32* %h_jCOLS_k, i32 %hzero_jCOLS_k, i32 %eta_jCOLS_k, i32* %wet_jCOLS_k, i32 %hmin, i32* %u, i32* %v, i32 %un, i32 %vn) local_unnamed_addr #0 {
entry:
  %h_jCOLS_k.addr = alloca i32*, align 8, !optimi !1
  %hzero_jCOLS_k.addr = alloca i32, align 4, !optimi !1
  %eta_jCOLS_k.addr = alloca i32, align 4, !optimi !1
  %wet_jCOLS_k.addr = alloca i32*, align 8, !optimi !8
  %hmin.addr = alloca i32, align 4, !optimi !1
  %u.addr = alloca i32*, align 8, !optimi !10
  %v.addr = alloca i32*, align 8, !optimi !10
  %un.addr = alloca i32, align 4, !optimi !10
  %vn.addr = alloca i32, align 4, !optimi !10
  store i32* %h_jCOLS_k, i32** %h_jCOLS_k.addr, align 8, !tbaa !2
  %h_jCOLS_k.addr1 = bitcast i32** %h_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 474)
  store i32 %hzero_jCOLS_k, i32* %hzero_jCOLS_k.addr, align 4, !tbaa !6
  %hzero_jCOLS_k.addr2 = bitcast i32* %hzero_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero_jCOLS_k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 475)
  store i32 %eta_jCOLS_k, i32* %eta_jCOLS_k.addr, align 4, !tbaa !6
  %eta_jCOLS_k.addr3 = bitcast i32* %eta_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_jCOLS_k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 476)
  store i32* %wet_jCOLS_k, i32** %wet_jCOLS_k.addr, align 8, !tbaa !2
  %wet_jCOLS_k.addr4 = bitcast i32** %wet_jCOLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k.addr4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 477)
  store i32 %hmin, i32* %hmin.addr, align 4, !tbaa !6
  %hmin.addr5 = bitcast i32* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hmin.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 478)
  store i32* %u, i32** %u.addr, align 8, !tbaa !2
  %u.addr6 = bitcast i32** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 479)
  store i32* %v, i32** %v.addr, align 8, !tbaa !2
  %v.addr7 = bitcast i32** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 480)
  store i32 %un, i32* %un.addr, align 4, !tbaa !6
  %un.addr8 = bitcast i32* %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 481)
  store i32 %vn, i32* %vn.addr, align 4, !tbaa !6
  %vn.addr9 = bitcast i32* %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 482)
  %0 = load i32, i32* %hzero_jCOLS_k.addr, align 4, !tbaa !6, !optimi !1
  %1 = load i32, i32* %eta_jCOLS_k.addr, align 4, !tbaa !6, !optimi !1
  %add = add nsw i32 %1, %0, !optimi !11
  %2 = load i32*, i32** %h_jCOLS_k.addr, align 8, !tbaa !2, !optimi !1
  store i32 %add, i32* %2, align 4, !tbaa !6
  %3 = load i32*, i32** %wet_jCOLS_k.addr, align 8, !tbaa !2, !optimi !8
  store i32 1, i32* %3, align 4, !tbaa !6
  %4 = load i32, i32* %2, align 4, !tbaa !6, !optimi !1
  %5 = load i32, i32* %hmin.addr, align 4, !tbaa !6, !optimi !1
  %not.cmp = icmp sge i32 %4, %5, !optimi !8
  %. = zext i1 %not.cmp to i32, !optimi !8
  store i32 %., i32* %3, align 4
  %6 = load i32, i32* %un.addr, align 4, !tbaa !6, !optimi !10
  %7 = load i32*, i32** %u.addr, align 8, !tbaa !2, !optimi !10
  store i32 %6, i32* %7, align 4, !tbaa !6
  %8 = load i32, i32* %vn.addr, align 4, !tbaa !6, !optimi !10
  %9 = load i32*, i32** %v.addr, align 8, !tbaa !2, !optimi !10
  store i32 %8, i32* %9, align 4, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_updates_host(i32* %h, i32* %hzero, i32* %eta, i32* %u, i32* %un, i32* %v, i32* %vn, i32* %wet, i32 %hmin) local_unnamed_addr #0 {
entry:
  %h_jCOLS_k.addr.i = alloca i32*, align 8, !optimi !1
  %hzero_jCOLS_k.addr.i = alloca i32, align 4, !optimi !1
  %eta_jCOLS_k.addr.i = alloca i32, align 4, !optimi !1
  %wet_jCOLS_k.addr.i = alloca i32*, align 8, !optimi !8
  %hmin.addr.i = alloca i32, align 4, !optimi !1
  %u.addr.i = alloca i32*, align 8, !optimi !10
  %v.addr.i = alloca i32*, align 8, !optimi !10
  %un.addr.i = alloca i32, align 4, !optimi !10
  %vn.addr.i = alloca i32, align 4, !optimi !10
  %h.addr = alloca i32*, align 8, !optimi !1
  %hzero.addr = alloca i32*, align 8, !optimi !1
  %eta.addr = alloca i32*, align 8, !optimi !1
  %u.addr = alloca i32*, align 8, !optimi !10
  %un.addr = alloca i32*, align 8, !optimi !10
  %v.addr = alloca i32*, align 8, !optimi !10
  %vn.addr = alloca i32*, align 8, !optimi !10
  %wet.addr = alloca i32*, align 8, !optimi !8
  %hmin.addr = alloca i32, align 4, !optimi !1
  store i32* %h, i32** %h.addr, align 8, !tbaa !2
  %h.addr1 = bitcast i32** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 510)
  store i32* %hzero, i32** %hzero.addr, align 8, !tbaa !2
  %hzero.addr2 = bitcast i32** %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 511)
  store i32* %eta, i32** %eta.addr, align 8, !tbaa !2
  %eta.addr3 = bitcast i32** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 512)
  store i32* %u, i32** %u.addr, align 8, !tbaa !2
  %u.addr4 = bitcast i32** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 513)
  store i32* %un, i32** %un.addr, align 8, !tbaa !2
  %un.addr5 = bitcast i32** %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 514)
  store i32* %v, i32** %v.addr, align 8, !tbaa !2
  %v.addr6 = bitcast i32** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 515)
  store i32* %vn, i32** %vn.addr, align 8, !tbaa !2
  %vn.addr7 = bitcast i32** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 516)
  store i32* %wet, i32** %wet.addr, align 8, !tbaa !2
  %wet.addr8 = bitcast i32** %wet.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 517)
  store i32 %hmin, i32* %hmin.addr, align 4, !tbaa !6
  %hmin.addr9 = bitcast i32* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hmin.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 518)
  %0 = bitcast i32** %h_jCOLS_k.addr.i to i8*, !optimi !1
  %1 = bitcast i32* %hzero_jCOLS_k.addr.i to i8*, !optimi !1
  %2 = bitcast i32* %eta_jCOLS_k.addr.i to i8*, !optimi !1
  %3 = bitcast i32** %wet_jCOLS_k.addr.i to i8*, !optimi !8
  %4 = bitcast i32* %hmin.addr.i to i8*, !optimi !1
  %5 = bitcast i32** %u.addr.i to i8*, !optimi !10
  %6 = bitcast i32** %v.addr.i to i8*, !optimi !10
  %7 = bitcast i32* %un.addr.i to i8*, !optimi !10
  %8 = bitcast i32* %vn.addr.i to i8*, !optimi !10
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond.cleanup12, %entry
  %indvars.iv68 = phi i64 [ 0, %entry ], [ %indvars.iv.next69, %for.cond.cleanup12 ], !optimi !54
  %9 = shl i64 %indvars.iv68, 9, !optimi !42
  br label %for.body13

for.cond.cleanup:                                 ; preds = %for.cond.cleanup12
  ret void

for.cond.cleanup12:                               ; preds = %for.body13
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1, !optimi !54
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 512, !optimi !8
  br i1 %exitcond71, label %for.cond.cleanup, label %for.cond10.preheader

for.body13:                                       ; preds = %for.body13, %for.cond10.preheader
  %indvars.iv = phi i64 [ 0, %for.cond10.preheader ], [ %indvars.iv.next, %for.body13 ], !optimi !54
  %10 = load i32*, i32** %h.addr, align 8, !tbaa !2, !optimi !1
  %11 = add nuw nsw i64 %indvars.iv, %9, !optimi !55
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 %11, !optimi !1
  %12 = load i32*, i32** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx17 = getelementptr inbounds i32, i32* %12, i64 %11, !optimi !1
  %13 = load i32, i32* %arrayidx17, align 4, !tbaa !6, !optimi !1
  %14 = load i32*, i32** %eta.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx21 = getelementptr inbounds i32, i32* %14, i64 %11, !optimi !1
  %15 = load i32, i32* %arrayidx21, align 4, !tbaa !6, !optimi !1
  %16 = load i32*, i32** %wet.addr, align 8, !tbaa !2, !optimi !8
  %arrayidx25 = getelementptr inbounds i32, i32* %16, i64 %11, !optimi !8
  %17 = load i32, i32* %hmin.addr, align 4, !tbaa !6, !optimi !1
  %18 = load i32*, i32** %u.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx29 = getelementptr inbounds i32, i32* %18, i64 %11, !optimi !10
  %19 = load i32*, i32** %v.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %11, !optimi !10
  %20 = load i32*, i32** %un.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx37 = getelementptr inbounds i32, i32* %20, i64 %11, !optimi !10
  %21 = load i32, i32* %arrayidx37, align 4, !tbaa !6, !optimi !10
  %22 = load i32*, i32** %vn.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx41 = getelementptr inbounds i32, i32* %22, i64 %11, !optimi !10
  %23 = load i32, i32* %arrayidx41, align 4, !tbaa !6, !optimi !10
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %2)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %3)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %4)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %6)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %7)
  call void @llvm.lifetime.start(i64 4, i8* nonnull %8)
  store i32* %arrayidx, i32** %h_jCOLS_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 474) #1
  store i32 %13, i32* %hzero_jCOLS_k.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 475) #1
  store i32 %15, i32* %eta_jCOLS_k.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 476) #1
  store i32* %arrayidx25, i32** %wet_jCOLS_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 477) #1
  store i32 %17, i32* %hmin.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 478) #1
  store i32* %arrayidx29, i32** %u.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 479) #1
  store i32* %arrayidx33, i32** %v.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 480) #1
  store i32 %21, i32* %un.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 481) #1
  store i32 %23, i32* %vn.addr.i, align 4, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 482) #1
  %24 = load i32, i32* %hzero_jCOLS_k.addr.i, align 4, !tbaa !6, !optimi !1
  %25 = load i32, i32* %eta_jCOLS_k.addr.i, align 4, !tbaa !6, !optimi !1
  %add.i = add nsw i32 %25, %24, !optimi !11
  %26 = load i32*, i32** %h_jCOLS_k.addr.i, align 8, !tbaa !2, !optimi !1
  store i32 %add.i, i32* %26, align 4, !tbaa !6
  %27 = load i32*, i32** %wet_jCOLS_k.addr.i, align 8, !tbaa !2, !optimi !8
  store i32 1, i32* %27, align 4, !tbaa !6
  %28 = load i32, i32* %26, align 4, !tbaa !6, !optimi !1
  %29 = load i32, i32* %hmin.addr.i, align 4, !tbaa !6, !optimi !1
  %not.cmp.i = icmp sge i32 %28, %29, !optimi !8
  %..i = zext i1 %not.cmp.i to i32, !optimi !8
  store i32 %..i, i32* %27, align 4
  %30 = load i32, i32* %un.addr.i, align 4, !tbaa !6, !optimi !10
  %31 = load i32*, i32** %u.addr.i, align 8, !tbaa !2, !optimi !10
  store i32 %30, i32* %31, align 4, !tbaa !6
  %32 = load i32, i32* %vn.addr.i, align 4, !tbaa !6, !optimi !10
  %33 = load i32*, i32** %v.addr.i, align 8, !tbaa !2, !optimi !10
  store i32 %32, i32* %33, align 4, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %2)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %3)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %4)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %5)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %6)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %7)
  call void @llvm.lifetime.end(i64 4, i8* nonnull %8)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !54
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !optimi !8
  br i1 %exitcond, label %for.cond.cleanup12, label %for.body13
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 284936)"}
!1 = !{!"(15, 0, 6, 23)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!"(1, 0, 0, 1)"}
!9 = !{!"(0, -15, 6, 23)"}
!10 = !{!"(10, -10, 6, 23)"}
!11 = !{!"(30, 0, 6, 24)"}
!12 = !{!"(10, 0, 0, 5)"}
!13 = !{!"(514, 0, 0, 11)"}
!14 = !{!"(515, 0, 0, 11)"}
!15 = !{!"(263680, 0, 0, 20)"}
!16 = !{!"(264195, 0, 0, 20)"}
!17 = !{!"(515, 1, 0, 11)"}
!18 = !{!"(262147, 261632, 0, 20)"}
!19 = !{!"(264191, 511, 0, 20)"}
!20 = !{!"(2.14748e+09, -2.14748e+09, 0, 32)"}
!21 = !{!"(1.5e+06, -1.5e+06, 10, 52)"}
!22 = !{!"(100, 0, 2, 14)"}
!23 = !{!"(10, 9, 2, 11)"}
!24 = !{!"(0, -100, 2, 14)"}
!25 = !{!"(0, -1000, 4, 23)"}
!26 = !{!"(15, -15, 6, 23)"}
!27 = !{!"(15000, -15000, 10, 45)"}
!28 = !{!"(1.50001e+06, -1.50001e+06, 10, 52)"}
!29 = !{!"(20, -20, 6, 24)"}
!30 = !{!"(300, -300, 12, 46)"}
!31 = !{!"(150, -150, 12, 45)"}
!32 = !{!"(450, -450, 12, 46)"}
!33 = !{!"(600, -600, 12, 47)"}
!34 = !{!"(60000, -60000, 14, 59)"}
!35 = !{!"(6e+06, -6e+06, 14, 66)"}
!36 = !{!"(6.00002e+06, -6e+06, 14, 66)"}
!37 = !{!"(1.2e+07, -1.2e+07, 14, 67)"}
!38 = !{!"(2.62144e+06, 0, 0, 23)"}
!39 = !{!"(3546, 0, 0, 13)"}
!40 = !{!"(512, 0, 0, 10)"}
!41 = !{!"(262144, 0, 0, 19)"}
!42 = !{!"(262656, 0, 0, 20)"}
!43 = !{!"(262657, 1, 0, 20)"}
!44 = !{!"(261632, -512, 0, 19)"}
!45 = !{!"(262655, -1, 0, 20)"}
!46 = !{!"(262144, -512, 0, 19)"}
!47 = !{!"(0, 0, 2, 8)"}
!48 = !{!"(2, 0, 0, 2)"}
!49 = !{!"(3, 0, 0, 3)"}
!50 = !{!"(4, 0, 0, 3)"}
!51 = !{!"(1, 1, 2, 7)"}
!52 = !{!"(15, 0, 8, 29)"}
!53 = !{!"(0, 0, 8, 26)"}
!54 = !{!"(513, 0, 0, 11)"}
!55 = !{!"(263169, 0, 0, 20)"}
