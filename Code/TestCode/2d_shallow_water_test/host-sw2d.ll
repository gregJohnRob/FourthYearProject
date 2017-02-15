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
define void @initHzero(double* %hzero) local_unnamed_addr #0 {
entry:
  %hzero.addr = alloca double*, align 8, !optimi !1
  store double* %hzero, double** %hzero.addr, align 8, !tbaa !2
  %hzero.addr1 = bitcast double** %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 15)
  %0 = load double*, double** %hzero.addr, align 8, !tbaa !2, !optimi !1
  store double 1.000000e+01, double* %0, align 8, !tbaa !6
  ret void
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #1

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host_loop2And3(double* %hzero_row0_k, double* %hzero_lastRow_k) local_unnamed_addr #0 {
entry:
  %hzero_row0_k.addr = alloca double*, align 8, !optimi !1
  %hzero_lastRow_k.addr = alloca double*, align 8, !optimi !1
  store double* %hzero_row0_k, double** %hzero_row0_k.addr, align 8, !tbaa !2
  %hzero_row0_k.addr1 = bitcast double** %hzero_row0_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero_row0_k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 23)
  store double* %hzero_lastRow_k, double** %hzero_lastRow_k.addr, align 8, !tbaa !2
  %hzero_lastRow_k.addr2 = bitcast double** %hzero_lastRow_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero_lastRow_k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 24)
  %0 = load double*, double** %hzero_lastRow_k.addr, align 8, !tbaa !2, !optimi !1
  store double -1.000000e+01, double* %0, align 8, !tbaa !6
  %1 = load double*, double** %hzero_row0_k.addr, align 8, !tbaa !2, !optimi !1
  store double -1.000000e+01, double* %1, align 8, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host_eta_etan(double* %eta, double %hzero, double* %etan) local_unnamed_addr #0 {
entry:
  %eta.addr = alloca double*, align 8, !optimi !1
  %hzero.addr = alloca double, align 8, !optimi !1
  %etan.addr = alloca double*, align 8, !optimi !1
  store double* %eta, double** %eta.addr, align 8, !tbaa !2
  %eta.addr1 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 32)
  store double %hzero, double* %hzero.addr, align 8, !tbaa !6
  %hzero.addr2 = bitcast double* %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 33)
  store double* %etan, double** %etan.addr, align 8, !tbaa !2
  %etan.addr3 = bitcast double** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 34)
  %0 = load double, double* %hzero.addr, align 8, !tbaa !6, !optimi !1
  %cmp = fcmp ogt double %0, 0.000000e+00, !optimi !8
  %cond = select i1 %cmp, double 0.000000e+00, double %0, !optimi !1
  %sub = fsub double -0.000000e+00, %cond, !optimi !9
  %1 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  store double %sub, double* %1, align 8, !tbaa !6
  %2 = load double*, double** %etan.addr, align 8, !tbaa !2, !optimi !1
  store double %sub, double* %2, align 8, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host_finalLoop(double* %h_j_COLS_k, double %hzero_j_COLS_k, double %eta_j_COLS_k, double* %wet_j_COLS_k, double %hmin, double* %u, double* %un, double* %v, double* %vn) local_unnamed_addr #0 {
entry:
  %h_j_COLS_k.addr = alloca double*, align 8, !optimi !1
  %hzero_j_COLS_k.addr = alloca double, align 8, !optimi !1
  %eta_j_COLS_k.addr = alloca double, align 8, !optimi !1
  %wet_j_COLS_k.addr = alloca double*, align 8, !optimi !8
  %hmin.addr = alloca double, align 8, !optimi !1
  %u.addr = alloca double*, align 8, !optimi !10
  %un.addr = alloca double*, align 8, !optimi !10
  %v.addr = alloca double*, align 8, !optimi !10
  %vn.addr = alloca double*, align 8, !optimi !10
  store double* %h_j_COLS_k, double** %h_j_COLS_k.addr, align 8, !tbaa !2
  %h_j_COLS_k.addr1 = bitcast double** %h_j_COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_j_COLS_k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 43)
  store double %hzero_j_COLS_k, double* %hzero_j_COLS_k.addr, align 8, !tbaa !6
  %hzero_j_COLS_k.addr2 = bitcast double* %hzero_j_COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero_j_COLS_k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 44)
  store double %eta_j_COLS_k, double* %eta_j_COLS_k.addr, align 8, !tbaa !6
  %eta_j_COLS_k.addr3 = bitcast double* %eta_j_COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_j_COLS_k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 45)
  store double* %wet_j_COLS_k, double** %wet_j_COLS_k.addr, align 8, !tbaa !2
  %wet_j_COLS_k.addr4 = bitcast double** %wet_j_COLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_j_COLS_k.addr4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 46)
  store double %hmin, double* %hmin.addr, align 8, !tbaa !6
  %hmin.addr5 = bitcast double* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hmin.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 47)
  store double* %u, double** %u.addr, align 8, !tbaa !2
  %u.addr6 = bitcast double** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 48)
  store double* %un, double** %un.addr, align 8, !tbaa !2
  %un.addr7 = bitcast double** %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 49)
  store double* %v, double** %v.addr, align 8, !tbaa !2
  %v.addr8 = bitcast double** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 50)
  store double* %vn, double** %vn.addr, align 8, !tbaa !2
  %vn.addr9 = bitcast double** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 51)
  %0 = load double, double* %hzero_j_COLS_k.addr, align 8, !tbaa !6, !optimi !1
  %1 = load double, double* %eta_j_COLS_k.addr, align 8, !tbaa !6, !optimi !1
  %add = fadd double %0, %1, !optimi !11
  %2 = load double*, double** %h_j_COLS_k.addr, align 8, !tbaa !2, !optimi !1
  store double %add, double* %2, align 8, !tbaa !6
  %3 = load double*, double** %wet_j_COLS_k.addr, align 8, !tbaa !2, !optimi !8
  store double 1.000000e+00, double* %3, align 8, !tbaa !6
  %4 = load double, double* %2, align 8, !tbaa !6, !optimi !1
  %5 = load double, double* %hmin.addr, align 8, !tbaa !6, !optimi !1
  %cmp = fcmp olt double %4, %5, !optimi !8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* %3, align 8, !tbaa !6
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load double*, double** %vn.addr, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %6, align 8, !tbaa !6
  %7 = load double*, double** %v.addr, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %7, align 8, !tbaa !6
  %8 = load double*, double** %un.addr, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %8, align 8, !tbaa !6
  %9 = load double*, double** %u.addr, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %9, align 8, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host(double* %hzero, double* %eta, double* %etan, double* %h, double* %wet, double* %u, double* %un, double* %v, double* %vn, double %hmin, i32 %BytesPerWord) local_unnamed_addr #0 {
entry:
  %hzero_row0_k.addr.i123 = alloca double*, align 8, !optimi !1
  %hzero_lastRow_k.addr.i124 = alloca double*, align 8, !optimi !1
  %hzero_row0_k.addr.i = alloca double*, align 8, !optimi !1
  %hzero_lastRow_k.addr.i = alloca double*, align 8, !optimi !1
  %eta.addr.i = alloca double*, align 8, !optimi !1
  %hzero.addr.i121 = alloca double, align 8, !optimi !1
  %etan.addr.i = alloca double*, align 8, !optimi !1
  %h_j_COLS_k.addr.i = alloca double*, align 8, !optimi !1
  %hzero_j_COLS_k.addr.i = alloca double, align 8, !optimi !1
  %eta_j_COLS_k.addr.i = alloca double, align 8, !optimi !1
  %wet_j_COLS_k.addr.i = alloca double*, align 8, !optimi !8
  %hmin.addr.i = alloca double, align 8, !optimi !1
  %u.addr.i = alloca double*, align 8, !optimi !10
  %un.addr.i = alloca double*, align 8, !optimi !10
  %v.addr.i = alloca double*, align 8, !optimi !10
  %vn.addr.i = alloca double*, align 8, !optimi !10
  %hzero.addr.i = alloca double*, align 8, !optimi !1
  %hzero.addr = alloca double*, align 8, !optimi !1
  %eta.addr = alloca double*, align 8, !optimi !1
  %etan.addr = alloca double*, align 8, !optimi !1
  %h.addr = alloca double*, align 8, !optimi !1
  %wet.addr = alloca double*, align 8, !optimi !8
  %u.addr = alloca double*, align 8, !optimi !10
  %un.addr = alloca double*, align 8, !optimi !10
  %v.addr = alloca double*, align 8, !optimi !10
  %vn.addr = alloca double*, align 8, !optimi !10
  %hmin.addr = alloca double, align 8, !optimi !1
  %BytesPerWord.addr = alloca i32, align 4, !optimi !12
  %j = alloca i32, align 4, !optimi !13
  %k = alloca i32, align 4, !optimi !13
  store double* %hzero, double** %hzero.addr, align 8, !tbaa !2
  %hzero.addr1 = bitcast double** %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 73)
  store double* %eta, double** %eta.addr, align 8, !tbaa !2
  %eta.addr2 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 74)
  store double* %etan, double** %etan.addr, align 8, !tbaa !2
  %etan.addr3 = bitcast double** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 75)
  store double* %h, double** %h.addr, align 8, !tbaa !2
  %h.addr4 = bitcast double** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 76)
  store double* %wet, double** %wet.addr, align 8, !tbaa !2
  %wet.addr5 = bitcast double** %wet.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 77)
  store double* %u, double** %u.addr, align 8, !tbaa !2
  %u.addr6 = bitcast double** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 78)
  store double* %un, double** %un.addr, align 8, !tbaa !2
  %un.addr7 = bitcast double** %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 79)
  store double* %v, double** %v.addr, align 8, !tbaa !2
  %v.addr8 = bitcast double** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 80)
  store double* %vn, double** %vn.addr, align 8, !tbaa !2
  %vn.addr9 = bitcast double** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 81)
  store double %hmin, double* %hmin.addr, align 8, !tbaa !6
  %hmin.addr10 = bitcast double* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hmin.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 82)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !14
  %BytesPerWord.addr11 = bitcast i32* %BytesPerWord.addr to i8*, !optimi !12
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 83)
  %0 = bitcast i32* %j to i8*, !optimi !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %0) #1
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 99)
  %1 = bitcast i32* %k to i8*, !optimi !13
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1) #1
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 99)
  store i32 0, i32* %j, align 4, !tbaa !14
  store i32 0, i32* %k, align 4, !tbaa !14
  %2 = bitcast double** %hzero.addr.i to i8*, !optimi !1
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %entry, %for.inc17
  %3 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !optimi !16
  br label %for.body16

for.cond20.preheader:                             ; preds = %for.inc17
  %4 = bitcast double** %hzero_row0_k.addr.i123 to i8*, !optimi !1
  %5 = bitcast double** %hzero_lastRow_k.addr.i124 to i8*, !optimi !1
  br label %for.body22

for.body16:                                       ; preds = %for.cond14.preheader, %for.body16
  %6 = phi i32 [ %3, %for.cond14.preheader ], [ %11, %for.body16 ], !optimi !16
  %7 = phi i32 [ 0, %for.cond14.preheader ], [ %inc, %for.body16 ], !optimi !16
  %8 = load double*, double** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %mul = shl i32 %6, 9, !optimi !17
  %add = add nsw i32 %mul, %7, !optimi !18
  %idxprom = sext i32 %add to i64, !optimi !18
  %arrayidx = getelementptr inbounds double, double* %8, i64 %idxprom, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2)
  store double* %arrayidx, double** %hzero.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 15) #1
  %9 = load double*, double** %hzero.addr.i, align 8, !tbaa !2, !optimi !1
  store double 1.000000e+01, double* %9, align 8, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2)
  %10 = load i32, i32* %k, align 4, !tbaa !14, !optimi !13
  %inc = add nsw i32 %10, 1, !optimi !19
  store i32 %inc, i32* %k, align 4, !tbaa !14
  %cmp15 = icmp slt i32 %inc, 512, !optimi !8
  %11 = load i32, i32* %j, align 4, !tbaa !14, !optimi !13
  br i1 %cmp15, label %for.body16, label %for.inc17

for.inc17:                                        ; preds = %for.body16
  %inc18 = add nsw i32 %11, 1, !optimi !19
  store i32 %inc18, i32* %j, align 4, !tbaa !14
  %cmp = icmp slt i32 %inc18, 512, !optimi !8
  store i32 0, i32* %k, align 4, !tbaa !14
  br i1 %cmp, label %for.cond14.preheader, label %for.cond20.preheader

for.cond32.preheader:                             ; preds = %for.body22
  store i32 0, i32* %j, align 4, !tbaa !14
  %12 = bitcast double** %hzero_row0_k.addr.i to i8*, !optimi !1
  %13 = bitcast double** %hzero_lastRow_k.addr.i to i8*, !optimi !1
  br label %for.body34

for.body22:                                       ; preds = %for.cond20.preheader, %for.body22
  %14 = phi i32 [ 0, %for.cond20.preheader ], [ %inc30, %for.body22 ], !optimi !16
  %15 = load double*, double** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %idxprom24 = sext i32 %14 to i64, !optimi !16
  %arrayidx25 = getelementptr inbounds double, double* %15, i64 %idxprom24, !optimi !1
  %add26 = add nsw i32 %14, 261632, !optimi !20
  %idxprom27 = sext i32 %add26 to i64, !optimi !20
  %arrayidx28 = getelementptr inbounds double, double* %15, i64 %idxprom27, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5)
  store double* %arrayidx25, double** %hzero_row0_k.addr.i123, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 23) #1
  store double* %arrayidx28, double** %hzero_lastRow_k.addr.i124, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 24) #1
  %16 = load double*, double** %hzero_lastRow_k.addr.i124, align 8, !tbaa !2, !optimi !1
  store double -1.000000e+01, double* %16, align 8, !tbaa !6
  %17 = load double*, double** %hzero_row0_k.addr.i123, align 8, !tbaa !2, !optimi !1
  store double -1.000000e+01, double* %17, align 8, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %4)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %5)
  %18 = load i32, i32* %k, align 4, !tbaa !14, !optimi !13
  %inc30 = add nsw i32 %18, 1, !optimi !19
  store i32 %inc30, i32* %k, align 4, !tbaa !14
  %cmp21 = icmp slt i32 %inc30, 512, !optimi !8
  br i1 %cmp21, label %for.body22, label %for.cond32.preheader

for.cond46.preheader:                             ; preds = %for.body34
  store i32 0, i32* %j, align 4, !tbaa !14
  %19 = bitcast double** %eta.addr.i to i8*, !optimi !1
  %20 = bitcast double* %hzero.addr.i121 to i8*, !optimi !1
  %21 = bitcast double** %etan.addr.i to i8*, !optimi !1
  %22 = bitcast double* %hzero.addr.i121 to i64*, !optimi !1
  br label %for.cond49.preheader

for.body34:                                       ; preds = %for.cond32.preheader, %for.body34
  %storemerge115131 = phi i32 [ 0, %for.cond32.preheader ], [ %inc44, %for.body34 ], !optimi !16
  %23 = load double*, double** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %mul35 = shl nsw i32 %storemerge115131, 9, !optimi !17
  %idxprom37 = sext i32 %mul35 to i64, !optimi !17
  %arrayidx38 = getelementptr inbounds double, double* %23, i64 %idxprom37, !optimi !1
  %sub = or i32 %mul35, 511, !optimi !21
  %idxprom41 = sext i32 %sub to i64, !optimi !21
  %arrayidx42 = getelementptr inbounds double, double* %23, i64 %idxprom41, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %12)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %13)
  store double* %arrayidx38, double** %hzero_row0_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 23) #1
  store double* %arrayidx42, double** %hzero_lastRow_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 24) #1
  %24 = load double*, double** %hzero_lastRow_k.addr.i, align 8, !tbaa !2, !optimi !1
  store double -1.000000e+01, double* %24, align 8, !tbaa !6
  %25 = load double*, double** %hzero_row0_k.addr.i, align 8, !tbaa !2, !optimi !1
  store double -1.000000e+01, double* %25, align 8, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %12)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %13)
  %26 = load i32, i32* %j, align 4, !tbaa !14, !optimi !13
  %inc44 = add nsw i32 %26, 1, !optimi !19
  store i32 %inc44, i32* %j, align 4, !tbaa !14
  %cmp33 = icmp slt i32 %inc44, 512, !optimi !8
  br i1 %cmp33, label %for.body34, label %for.cond46.preheader

for.cond49.preheader:                             ; preds = %for.cond46.preheader, %for.inc67
  %27 = phi i32 [ 0, %for.cond46.preheader ], [ %inc68, %for.inc67 ], !optimi !16
  store i32 0, i32* %k, align 4, !tbaa !14
  br label %for.body51

for.cond70.preheader:                             ; preds = %for.inc67
  store i32 0, i32* %j, align 4, !tbaa !14
  %28 = bitcast double* %hmin.addr to i64*, !optimi !1
  %29 = bitcast double** %h_j_COLS_k.addr.i to i8*, !optimi !1
  %30 = bitcast double* %hzero_j_COLS_k.addr.i to i8*, !optimi !1
  %31 = bitcast double* %eta_j_COLS_k.addr.i to i8*, !optimi !1
  %32 = bitcast double** %wet_j_COLS_k.addr.i to i8*, !optimi !8
  %33 = bitcast double* %hmin.addr.i to i8*, !optimi !1
  %34 = bitcast double** %u.addr.i to i8*, !optimi !10
  %35 = bitcast double** %un.addr.i to i8*, !optimi !10
  %36 = bitcast double** %v.addr.i to i8*, !optimi !10
  %37 = bitcast double** %vn.addr.i to i8*, !optimi !10
  %38 = bitcast double* %hzero_j_COLS_k.addr.i to i64*, !optimi !1
  %39 = bitcast double* %eta_j_COLS_k.addr.i to i64*, !optimi !1
  %40 = bitcast double* %hmin.addr.i to i64*, !optimi !1
  br label %for.cond73.preheader

for.body51:                                       ; preds = %for.cond49.preheader, %for.body51
  %41 = phi i32 [ %27, %for.cond49.preheader ], [ %51, %for.body51 ], !optimi !16
  %storemerge120130 = phi i32 [ 0, %for.cond49.preheader ], [ %inc65, %for.body51 ], !optimi !16
  %42 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  %mul52 = shl i32 %41, 9, !optimi !17
  %add53 = add nsw i32 %mul52, %storemerge120130, !optimi !18
  %idxprom54 = sext i32 %add53 to i64, !optimi !18
  %arrayidx55 = getelementptr inbounds double, double* %42, i64 %idxprom54, !optimi !1
  %43 = load double*, double** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx59 = getelementptr inbounds double, double* %43, i64 %idxprom54, !optimi !1
  %44 = bitcast double* %arrayidx59 to i64*, !optimi !1
  %45 = load i64, i64* %44, align 8, !tbaa !6, !optimi !1
  %46 = load double*, double** %etan.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx63 = getelementptr inbounds double, double* %46, i64 %idxprom54, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %19)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %20)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %21)
  store double* %arrayidx55, double** %eta.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %19, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 32) #1
  store i64 %45, i64* %22, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 33) #1
  store double* %arrayidx63, double** %etan.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 34) #1
  %47 = load double, double* %hzero.addr.i121, align 8, !tbaa !6, !optimi !1
  %cmp.i122 = fcmp ogt double %47, 0.000000e+00, !optimi !8
  %cond.i = select i1 %cmp.i122, double 0.000000e+00, double %47, !optimi !1
  %sub.i = fsub double -0.000000e+00, %cond.i, !optimi !9
  %48 = load double*, double** %eta.addr.i, align 8, !tbaa !2, !optimi !1
  store double %sub.i, double* %48, align 8, !tbaa !6
  %49 = load double*, double** %etan.addr.i, align 8, !tbaa !2, !optimi !1
  store double %sub.i, double* %49, align 8, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %19)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %20)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %21)
  %50 = load i32, i32* %k, align 4, !tbaa !14, !optimi !13
  %inc65 = add nsw i32 %50, 1, !optimi !19
  store i32 %inc65, i32* %k, align 4, !tbaa !14
  %cmp50 = icmp slt i32 %inc65, 512, !optimi !8
  %51 = load i32, i32* %j, align 4, !tbaa !14, !optimi !13
  br i1 %cmp50, label %for.body51, label %for.inc67

for.inc67:                                        ; preds = %for.body51
  %inc68 = add nsw i32 %51, 1, !optimi !19
  store i32 %inc68, i32* %j, align 4, !tbaa !14
  %cmp47 = icmp slt i32 %inc68, 512, !optimi !8
  br i1 %cmp47, label %for.cond49.preheader, label %for.cond70.preheader

for.cond73.preheader:                             ; preds = %for.cond70.preheader, %for.inc111
  %52 = phi i32 [ 0, %for.cond70.preheader ], [ %inc112, %for.inc111 ], !optimi !16
  store i32 0, i32* %k, align 4, !tbaa !14
  br label %for.body75

for.body75:                                       ; preds = %for.cond73.preheader, %sw2d_init_data_host_finalLoop.exit
  %53 = phi i32 [ %52, %for.cond73.preheader ], [ %78, %sw2d_init_data_host_finalLoop.exit ], !optimi !16
  %storemerge119129 = phi i32 [ 0, %for.cond73.preheader ], [ %inc109, %sw2d_init_data_host_finalLoop.exit ], !optimi !16
  %54 = load double*, double** %h.addr, align 8, !tbaa !2, !optimi !1
  %mul76 = shl i32 %53, 9, !optimi !17
  %add77 = add nsw i32 %mul76, %storemerge119129, !optimi !18
  %idxprom78 = sext i32 %add77 to i64, !optimi !18
  %arrayidx79 = getelementptr inbounds double, double* %54, i64 %idxprom78, !optimi !1
  %55 = load double*, double** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx83 = getelementptr inbounds double, double* %55, i64 %idxprom78, !optimi !1
  %56 = bitcast double* %arrayidx83 to i64*, !optimi !1
  %57 = load i64, i64* %56, align 8, !tbaa !6, !optimi !1
  %58 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx87 = getelementptr inbounds double, double* %58, i64 %idxprom78, !optimi !1
  %59 = bitcast double* %arrayidx87 to i64*, !optimi !1
  %60 = load i64, i64* %59, align 8, !tbaa !6, !optimi !1
  %61 = load double*, double** %wet.addr, align 8, !tbaa !2, !optimi !8
  %arrayidx91 = getelementptr inbounds double, double* %61, i64 %idxprom78, !optimi !8
  %62 = load i64, i64* %28, align 8, !tbaa !6, !optimi !1
  %63 = load double*, double** %u.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx95 = getelementptr inbounds double, double* %63, i64 %idxprom78, !optimi !10
  %64 = load double*, double** %un.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx99 = getelementptr inbounds double, double* %64, i64 %idxprom78, !optimi !10
  %65 = load double*, double** %v.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx103 = getelementptr inbounds double, double* %65, i64 %idxprom78, !optimi !10
  %66 = load double*, double** %vn.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx107 = getelementptr inbounds double, double* %66, i64 %idxprom78, !optimi !10
  call void @llvm.lifetime.start(i64 8, i8* nonnull %29)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %30)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %31)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %32)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %33)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %34)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %35)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %36)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %37)
  store double* %arrayidx79, double** %h_j_COLS_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %29, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 43) #1
  store i64 %57, i64* %38, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %30, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 44) #1
  store i64 %60, i64* %39, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %31, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 45) #1
  store double* %arrayidx91, double** %wet_j_COLS_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 46) #1
  store i64 %62, i64* %40, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %33, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 47) #1
  store double* %arrayidx95, double** %u.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %34, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 48) #1
  store double* %arrayidx99, double** %un.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %35, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 49) #1
  store double* %arrayidx103, double** %v.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %36, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 50) #1
  store double* %arrayidx107, double** %vn.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %37, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 51) #1
  %67 = load double, double* %hzero_j_COLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %68 = load double, double* %eta_j_COLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %add.i = fadd double %67, %68, !optimi !11
  %69 = load double*, double** %h_j_COLS_k.addr.i, align 8, !tbaa !2, !optimi !1
  store double %add.i, double* %69, align 8, !tbaa !6
  %70 = load double*, double** %wet_j_COLS_k.addr.i, align 8, !tbaa !2, !optimi !8
  store double 1.000000e+00, double* %70, align 8, !tbaa !6
  %71 = load double, double* %69, align 8, !tbaa !6, !optimi !1
  %72 = load double, double* %hmin.addr.i, align 8, !tbaa !6, !optimi !1
  %cmp.i = fcmp olt double %71, %72, !optimi !8
  br i1 %cmp.i, label %if.then.i, label %sw2d_init_data_host_finalLoop.exit

if.then.i:                                        ; preds = %for.body75
  store double 0.000000e+00, double* %70, align 8, !tbaa !6
  br label %sw2d_init_data_host_finalLoop.exit

sw2d_init_data_host_finalLoop.exit:               ; preds = %for.body75, %if.then.i
  %73 = load double*, double** %vn.addr.i, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %73, align 8, !tbaa !6
  %74 = load double*, double** %v.addr.i, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %74, align 8, !tbaa !6
  %75 = load double*, double** %un.addr.i, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %75, align 8, !tbaa !6
  %76 = load double*, double** %u.addr.i, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %76, align 8, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %29)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %30)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %31)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %32)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %33)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %34)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %35)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %36)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %37)
  %77 = load i32, i32* %k, align 4, !tbaa !14, !optimi !13
  %inc109 = add nsw i32 %77, 1, !optimi !19
  store i32 %inc109, i32* %k, align 4, !tbaa !14
  %cmp74 = icmp slt i32 %inc109, 512, !optimi !8
  %78 = load i32, i32* %j, align 4, !tbaa !14, !optimi !13
  br i1 %cmp74, label %for.body75, label %for.inc111

for.inc111:                                       ; preds = %sw2d_init_data_host_finalLoop.exit
  %inc112 = add nsw i32 %78, 1, !optimi !19
  store i32 %inc112, i32* %j, align 4, !tbaa !14
  %cmp71 = icmp slt i32 %inc112, 512, !optimi !8
  br i1 %cmp71, label %for.cond73.preheader, label %for.end113

for.end113:                                       ; preds = %for.inc111
  %puts = call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str, i64 0, i64 0)), !optimi !22
  %puts118 = call i32 @puts(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @str.12, i64 0, i64 0)), !optimi !22
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %0) #1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host_firstLoop(double* %du, double* %dv, double %dt, double %g, double %eta_jCOLS_k_1, double %eta_jCOLS_k, double %eta_j1COLS_k, double %dx, double %dy) local_unnamed_addr #0 {
entry:
  %du.addr = alloca double*, align 8, !optimi !23
  %dv.addr = alloca double*, align 8, !optimi !23
  %dt.addr = alloca double, align 8, !optimi !24
  %g.addr = alloca double, align 8, !optimi !25
  %eta_jCOLS_k_1.addr = alloca double, align 8, !optimi !1
  %eta_jCOLS_k.addr = alloca double, align 8, !optimi !1
  %eta_j1COLS_k.addr = alloca double, align 8, !optimi !1
  %dx.addr = alloca double, align 8, !optimi !24
  %dy.addr = alloca double, align 8, !optimi !24
  store double* %du, double** %du.addr, align 8, !tbaa !2
  %du.addr1 = bitcast double** %du.addr to i8*, !optimi !23
  call void @llvm.var.annotation(i8* nonnull %du.addr1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 151)
  store double* %dv, double** %dv.addr, align 8, !tbaa !2
  %dv.addr2 = bitcast double** %dv.addr to i8*, !optimi !23
  call void @llvm.var.annotation(i8* nonnull %dv.addr2, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 152)
  store double %dt, double* %dt.addr, align 8, !tbaa !6
  %dt.addr3 = bitcast double* %dt.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dt.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 153)
  store double %g, double* %g.addr, align 8, !tbaa !6
  %g.addr4 = bitcast double* %g.addr to i8*, !optimi !25
  call void @llvm.var.annotation(i8* nonnull %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 154)
  store double %eta_jCOLS_k_1, double* %eta_jCOLS_k_1.addr, align 8, !tbaa !6
  %eta_jCOLS_k_1.addr5 = bitcast double* %eta_jCOLS_k_1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_jCOLS_k_1.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 155)
  store double %eta_jCOLS_k, double* %eta_jCOLS_k.addr, align 8, !tbaa !6
  %eta_jCOLS_k.addr6 = bitcast double* %eta_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_jCOLS_k.addr6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 156)
  store double %eta_j1COLS_k, double* %eta_j1COLS_k.addr, align 8, !tbaa !6
  %eta_j1COLS_k.addr7 = bitcast double* %eta_j1COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_j1COLS_k.addr7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 157)
  store double %dx, double* %dx.addr, align 8, !tbaa !6
  %dx.addr8 = bitcast double* %dx.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dx.addr8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 158)
  store double %dy, double* %dy.addr, align 8, !tbaa !6
  %dy.addr9 = bitcast double* %dy.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dy.addr9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 159)
  %0 = load double, double* %dt.addr, align 8, !tbaa !6, !optimi !24
  %1 = load double, double* %g.addr, align 8, !tbaa !6, !optimi !25
  %2 = fmul double %0, %1, !optimi !26
  %3 = load double, double* %eta_jCOLS_k_1.addr, align 8, !tbaa !6, !optimi !1
  %4 = load double, double* %eta_jCOLS_k.addr, align 8, !tbaa !6, !optimi !1
  %sub10 = fsub double %3, %4, !optimi !27
  %5 = fmul double %2, %sub10, !optimi !28
  %mul11 = fsub double -0.000000e+00, %5, !optimi !28
  %6 = load double, double* %dx.addr, align 8, !tbaa !6, !optimi !24
  %div = fdiv double %mul11, %6, !optimi !23
  %7 = load double*, double** %du.addr, align 8, !tbaa !2, !optimi !23
  store double %div, double* %7, align 8, !tbaa !6
  %8 = load double, double* %dt.addr, align 8, !tbaa !6, !optimi !24
  %9 = load double, double* %g.addr, align 8, !tbaa !6, !optimi !25
  %10 = fmul double %8, %9, !optimi !26
  %11 = load double, double* %eta_j1COLS_k.addr, align 8, !tbaa !6, !optimi !1
  %12 = load double, double* %eta_jCOLS_k.addr, align 8, !tbaa !6, !optimi !1
  %sub14 = fsub double %11, %12, !optimi !27
  %13 = fmul double %10, %sub14, !optimi !28
  %mul15 = fsub double -0.000000e+00, %13, !optimi !28
  %14 = load double, double* %dy.addr, align 8, !tbaa !6, !optimi !24
  %div16 = fdiv double %mul15, %14, !optimi !23
  %15 = load double*, double** %dv.addr, align 8, !tbaa !2, !optimi !23
  store double %div16, double* %15, align 8, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host_secondLoop(double* %un_jCOLS_k, double %u_jCOLS_k, double %du_jCOLS_k, double %wet_jCOLS_k, double %wet_jCOLS_k_1, double* %vn, double %v_jCOLS_k, double* %dv) local_unnamed_addr #0 {
entry:
  %un_jCOLS_k.addr = alloca double*, align 8, !optimi !10
  %u_jCOLS_k.addr = alloca double, align 8, !optimi !10
  %du_jCOLS_k.addr = alloca double, align 8, !optimi !23
  %wet_jCOLS_k.addr = alloca double, align 8, !optimi !8
  %wet_jCOLS_k_1.addr = alloca double, align 8, !optimi !8
  %vn.addr = alloca double*, align 8, !optimi !10
  %v_jCOLS_k.addr = alloca double, align 8, !optimi !10
  %dv.addr = alloca double*, align 8, !optimi !23
  store double* %un_jCOLS_k, double** %un_jCOLS_k.addr, align 8, !tbaa !2
  %un_jCOLS_k.addr1 = bitcast double** %un_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un_jCOLS_k.addr1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 179)
  store double %u_jCOLS_k, double* %u_jCOLS_k.addr, align 8, !tbaa !6
  %u_jCOLS_k.addr2 = bitcast double* %u_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u_jCOLS_k.addr2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 180)
  store double %du_jCOLS_k, double* %du_jCOLS_k.addr, align 8, !tbaa !6
  %du_jCOLS_k.addr3 = bitcast double* %du_jCOLS_k.addr to i8*, !optimi !23
  call void @llvm.var.annotation(i8* nonnull %du_jCOLS_k.addr3, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 181)
  store double %wet_jCOLS_k, double* %wet_jCOLS_k.addr, align 8, !tbaa !6
  %wet_jCOLS_k.addr4 = bitcast double* %wet_jCOLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k.addr4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 182)
  store double %wet_jCOLS_k_1, double* %wet_jCOLS_k_1.addr, align 8, !tbaa !6
  %wet_jCOLS_k_1.addr5 = bitcast double* %wet_jCOLS_k_1.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k_1.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 183)
  store double* %vn, double** %vn.addr, align 8, !tbaa !2
  %vn.addr6 = bitcast double** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 184)
  store double %v_jCOLS_k, double* %v_jCOLS_k.addr, align 8, !tbaa !6
  %v_jCOLS_k.addr7 = bitcast double* %v_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v_jCOLS_k.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 185)
  store double* %dv, double** %dv.addr, align 8, !tbaa !2
  %dv.addr8 = bitcast double** %dv.addr to i8*, !optimi !23
  call void @llvm.var.annotation(i8* nonnull %dv.addr8, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 186)
  %0 = load double*, double** %un_jCOLS_k.addr, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %0, align 8, !tbaa !6
  %1 = load double, double* %u_jCOLS_k.addr, align 8, !tbaa !6, !optimi !10
  %2 = load double, double* %du_jCOLS_k.addr, align 8, !tbaa !6, !optimi !23
  %3 = load double, double* %wet_jCOLS_k.addr, align 8, !tbaa !6, !optimi !8
  %cmp = fcmp oeq double %3, 1.000000e+00, !optimi !8
  %4 = load double, double* %wet_jCOLS_k_1.addr, align 8, !tbaa !6, !optimi !8
  %cmp9 = fcmp oeq double %4, 1.000000e+00, !optimi !8
  %cmp10 = fcmp ogt double %2, 0.000000e+00, !optimi !8
  %or.cond = or i1 %cmp10, %cmp9, !optimi !8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %or.cond, label %if.then11, label %if.end18

if.then11:                                        ; preds = %if.then
  %add = fadd double %1, %2, !optimi !29
  store double %add, double* %0, align 8, !tbaa !6
  br label %if.end18

if.else:                                          ; preds = %entry
  br i1 %or.cond, label %if.then15, label %if.end18

if.then15:                                        ; preds = %if.else
  %add16 = fadd double %1, %2, !optimi !29
  store double %add16, double* %0, align 8, !tbaa !6
  br label %if.end18

if.end18:                                         ; preds = %if.then15, %if.else, %if.then11, %if.then
  %5 = load double*, double** %vn.addr, align 8, !tbaa !2, !optimi !10
  store double 0.000000e+00, double* %5, align 8, !tbaa !6
  %6 = load double, double* %v_jCOLS_k.addr, align 8, !tbaa !6, !optimi !10
  %7 = load double*, double** %dv.addr, align 8, !tbaa !2, !optimi !23
  %8 = load double, double* %7, align 8, !tbaa !6, !optimi !23
  %9 = load double, double* %wet_jCOLS_k.addr, align 8, !tbaa !6, !optimi !8
  %cmp19 = fcmp oeq double %9, 1.000000e+00, !optimi !8
  %10 = load double, double* %wet_jCOLS_k_1.addr, align 8, !tbaa !6, !optimi !8
  %cmp21 = fcmp oeq double %10, 1.000000e+00, !optimi !8
  br i1 %cmp19, label %if.then20, label %if.else27

if.then20:                                        ; preds = %if.end18
  %cmp23 = fcmp ogt double %8, 0.000000e+00, !optimi !8
  %or.cond36 = or i1 %cmp23, %cmp21, !optimi !8
  br i1 %or.cond36, label %if.then24, label %if.end34

if.then24:                                        ; preds = %if.then20
  %add25 = fadd double %6, %8, !optimi !29
  store double %add25, double* %5, align 8, !tbaa !6
  br label %if.end34

if.else27:                                        ; preds = %if.end18
  %cmp30 = fcmp olt double %8, 0.000000e+00, !optimi !8
  %or.cond37 = or i1 %cmp30, %cmp21, !optimi !8
  br i1 %or.cond37, label %if.then31, label %if.end34

if.then31:                                        ; preds = %if.else27
  %add32 = fadd double %6, %8, !optimi !29
  store double %add32, double* %5, align 8, !tbaa !6
  br label %if.end34

if.end34:                                         ; preds = %if.then31, %if.else27, %if.then24, %if.then20
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host_finalLoop(double %dx, double %dy, double %dt, double %un_jCOLS_k, double %un_jCOLS_k_neg1, double %vn_jCOLS_k, double %vn_neg1_jCOLS_k, double %h_jCOLS_k, double %h_jCOLS_k_1, double %h_jCOLS_k_neg1, double %h_jCOLS_1_k, double %h_neg1_jCOLS_k, double* %etan, double* %eta) local_unnamed_addr #0 {
entry:
  %dx.addr = alloca double, align 8, !optimi !24
  %dy.addr = alloca double, align 8, !optimi !24
  %dt.addr = alloca double, align 8, !optimi !24
  %un_jCOLS_k.addr = alloca double, align 8, !optimi !10
  %un_jCOLS_k_neg1.addr = alloca double, align 8, !optimi !10
  %vn_jCOLS_k.addr = alloca double, align 8, !optimi !10
  %vn_neg1_jCOLS_k.addr = alloca double, align 8, !optimi !10
  %h_jCOLS_k.addr = alloca double, align 8, !optimi !1
  %h_jCOLS_k_1.addr = alloca double, align 8, !optimi !1
  %h_jCOLS_k_neg1.addr = alloca double, align 8, !optimi !1
  %h_jCOLS_1_k.addr = alloca double, align 8, !optimi !1
  %h_neg1_jCOLS_k.addr = alloca double, align 8, !optimi !1
  %etan.addr = alloca double*, align 8, !optimi !1
  %eta.addr = alloca double*, align 8, !optimi !1
  store double %dx, double* %dx.addr, align 8, !tbaa !6
  %dx.addr1 = bitcast double* %dx.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dx.addr1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 233)
  store double %dy, double* %dy.addr, align 8, !tbaa !6
  %dy.addr2 = bitcast double* %dy.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dy.addr2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 234)
  store double %dt, double* %dt.addr, align 8, !tbaa !6
  %dt.addr3 = bitcast double* %dt.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dt.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 235)
  store double %un_jCOLS_k, double* %un_jCOLS_k.addr, align 8, !tbaa !6
  %un_jCOLS_k.addr4 = bitcast double* %un_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un_jCOLS_k.addr4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 236)
  store double %un_jCOLS_k_neg1, double* %un_jCOLS_k_neg1.addr, align 8, !tbaa !6
  %un_jCOLS_k_neg1.addr5 = bitcast double* %un_jCOLS_k_neg1.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un_jCOLS_k_neg1.addr5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 237)
  store double %vn_jCOLS_k, double* %vn_jCOLS_k.addr, align 8, !tbaa !6
  %vn_jCOLS_k.addr6 = bitcast double* %vn_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn_jCOLS_k.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 238)
  store double %vn_neg1_jCOLS_k, double* %vn_neg1_jCOLS_k.addr, align 8, !tbaa !6
  %vn_neg1_jCOLS_k.addr7 = bitcast double* %vn_neg1_jCOLS_k.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn_neg1_jCOLS_k.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 239)
  store double %h_jCOLS_k, double* %h_jCOLS_k.addr, align 8, !tbaa !6
  %h_jCOLS_k.addr8 = bitcast double* %h_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_k.addr8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 240)
  store double %h_jCOLS_k_1, double* %h_jCOLS_k_1.addr, align 8, !tbaa !6
  %h_jCOLS_k_1.addr9 = bitcast double* %h_jCOLS_k_1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_k_1.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 241)
  store double %h_jCOLS_k_neg1, double* %h_jCOLS_k_neg1.addr, align 8, !tbaa !6
  %h_jCOLS_k_neg1.addr10 = bitcast double* %h_jCOLS_k_neg1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_k_neg1.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 242)
  store double %h_jCOLS_1_k, double* %h_jCOLS_1_k.addr, align 8, !tbaa !6
  %h_jCOLS_1_k.addr11 = bitcast double* %h_jCOLS_1_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_1_k.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 243)
  store double %h_neg1_jCOLS_k, double* %h_neg1_jCOLS_k.addr, align 8, !tbaa !6
  %h_neg1_jCOLS_k.addr12 = bitcast double* %h_neg1_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_neg1_jCOLS_k.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 244)
  store double* %etan, double** %etan.addr, align 8, !tbaa !2
  %etan.addr13 = bitcast double** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 245)
  store double* %eta, double** %eta.addr, align 8, !tbaa !2
  %eta.addr14 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 246)
  %0 = load double, double* %un_jCOLS_k.addr, align 8, !tbaa !6, !optimi !10
  %cmp = fcmp oge double %0, 0.000000e+00, !optimi !8
  %sub = fsub double -0.000000e+00, %0, !optimi !10
  %cond = select i1 %cmp, double %0, double %sub, !optimi !10
  %add = fadd double %0, %cond, !optimi !30
  %mul = fmul double %add, 5.000000e-01, !optimi !31
  %1 = load double, double* %h_jCOLS_k.addr, align 8, !tbaa !6, !optimi !1
  %mul15 = fmul double %1, %mul, !optimi !32
  %sub22 = fsub double %0, %cond, !optimi !30
  %mul23 = fmul double %sub22, 5.000000e-01, !optimi !31
  %2 = load double, double* %h_jCOLS_k_1.addr, align 8, !tbaa !6, !optimi !1
  %mul24 = fmul double %2, %mul23, !optimi !32
  %add25 = fadd double %mul15, %mul24, !optimi !33
  %3 = load double, double* %un_jCOLS_k_neg1.addr, align 8, !tbaa !6, !optimi !10
  %cmp26 = fcmp oge double %3, 0.000000e+00, !optimi !8
  %sub29 = fsub double -0.000000e+00, %3, !optimi !10
  %cond31 = select i1 %cmp26, double %3, double %sub29, !optimi !10
  %add32 = fadd double %3, %cond31, !optimi !30
  %mul33 = fmul double %add32, 5.000000e-01, !optimi !31
  %4 = load double, double* %h_jCOLS_k_neg1.addr, align 8, !tbaa !6, !optimi !1
  %mul34 = fmul double %4, %mul33, !optimi !32
  %sub41 = fsub double %3, %cond31, !optimi !30
  %mul42 = fmul double %sub41, 5.000000e-01, !optimi !31
  %mul43 = fmul double %1, %mul42, !optimi !32
  %add44 = fadd double %mul34, %mul43, !optimi !33
  %5 = load double, double* %vn_jCOLS_k.addr, align 8, !tbaa !6, !optimi !10
  %cmp45 = fcmp oge double %5, 0.000000e+00, !optimi !8
  %sub48 = fsub double -0.000000e+00, %5, !optimi !10
  %cond50 = select i1 %cmp45, double %5, double %sub48, !optimi !10
  %add51 = fadd double %5, %cond50, !optimi !30
  %mul52 = fmul double %add51, 5.000000e-01, !optimi !31
  %mul53 = fmul double %1, %mul52, !optimi !32
  %sub60 = fsub double %5, %cond50, !optimi !30
  %mul61 = fmul double %sub60, 5.000000e-01, !optimi !31
  %6 = load double, double* %h_jCOLS_1_k.addr, align 8, !tbaa !6, !optimi !1
  %mul62 = fmul double %6, %mul61, !optimi !32
  %add63 = fadd double %mul53, %mul62, !optimi !33
  %7 = load double, double* %vn_neg1_jCOLS_k.addr, align 8, !tbaa !6, !optimi !10
  %cmp64 = fcmp oge double %7, 0.000000e+00, !optimi !8
  %sub67 = fsub double -0.000000e+00, %7, !optimi !10
  %cond69 = select i1 %cmp64, double %7, double %sub67, !optimi !10
  %add70 = fadd double %7, %cond69, !optimi !30
  %mul71 = fmul double %add70, 5.000000e-01, !optimi !31
  %8 = load double, double* %h_neg1_jCOLS_k.addr, align 8, !tbaa !6, !optimi !1
  %mul72 = fmul double %8, %mul71, !optimi !32
  %sub79 = fsub double %7, %cond69, !optimi !30
  %mul80 = fmul double %sub79, 5.000000e-01, !optimi !31
  %mul81 = fmul double %1, %mul80, !optimi !32
  %add82 = fadd double %mul72, %mul81, !optimi !33
  %9 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  %10 = load double, double* %9, align 8, !tbaa !6, !optimi !1
  %11 = load double, double* %dt.addr, align 8, !tbaa !6, !optimi !24
  %sub83 = fsub double %add25, %add44, !optimi !34
  %mul84 = fmul double %sub83, %11, !optimi !35
  %12 = load double, double* %dx.addr, align 8, !tbaa !6, !optimi !24
  %div = fdiv double %mul84, %12, !optimi !36
  %sub85 = fsub double %10, %div, !optimi !37
  %sub86 = fsub double %add63, %add82, !optimi !34
  %mul87 = fmul double %11, %sub86, !optimi !35
  %13 = load double, double* %dy.addr, align 8, !tbaa !6, !optimi !24
  %div88 = fdiv double %mul87, %13, !optimi !36
  %sub89 = fsub double %sub85, %div88, !optimi !38
  %14 = load double*, double** %etan.addr, align 8, !tbaa !2, !optimi !1
  store double %sub89, double* %14, align 8, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host(double %dt, double %dx, double %dy, double %g, double* %eta, double* %un, double* %u, double* %wet, double* %v, double* %vn, double* %h, double* %etan, i32 %BytesPerWord) local_unnamed_addr #0 {
entry:
  %du.addr.i = alloca double*, align 8, !optimi !23
  %dv.addr.i = alloca double*, align 8, !optimi !23
  %dt.addr.i = alloca double, align 8, !optimi !24
  %g.addr.i = alloca double, align 8, !optimi !25
  %eta_jCOLS_k_1.addr.i = alloca double, align 8, !optimi !1
  %eta_jCOLS_k.addr.i = alloca double, align 8, !optimi !1
  %eta_j1COLS_k.addr.i = alloca double, align 8, !optimi !1
  %dx.addr.i = alloca double, align 8, !optimi !24
  %dy.addr.i = alloca double, align 8, !optimi !24
  %dt.addr = alloca double, align 8, !optimi !24
  %dx.addr = alloca double, align 8, !optimi !24
  %dy.addr = alloca double, align 8, !optimi !24
  %g.addr = alloca double, align 8, !optimi !25
  %eta.addr = alloca double*, align 8, !optimi !1
  %un.addr = alloca double*, align 8, !optimi !10
  %u.addr = alloca double*, align 8, !optimi !10
  %wet.addr = alloca double*, align 8, !optimi !8
  %v.addr = alloca double*, align 8, !optimi !10
  %vn.addr = alloca double*, align 8, !optimi !10
  %h.addr = alloca double*, align 8, !optimi !1
  %etan.addr = alloca double*, align 8, !optimi !1
  %BytesPerWord.addr = alloca i32, align 4, !optimi !12
  %du = alloca double*, align 8, !optimi !23
  %dv = alloca double*, align 8, !optimi !23
  store double %dt, double* %dt.addr, align 8, !tbaa !6
  %dt.addr1 = bitcast double* %dt.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dt.addr1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 296)
  store double %dx, double* %dx.addr, align 8, !tbaa !6
  %dx.addr2 = bitcast double* %dx.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dx.addr2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 297)
  store double %dy, double* %dy.addr, align 8, !tbaa !6
  %dy.addr3 = bitcast double* %dy.addr to i8*, !optimi !24
  call void @llvm.var.annotation(i8* nonnull %dy.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 298)
  store double %g, double* %g.addr, align 8, !tbaa !6
  %g.addr4 = bitcast double* %g.addr to i8*, !optimi !25
  call void @llvm.var.annotation(i8* nonnull %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 299)
  store double* %eta, double** %eta.addr, align 8, !tbaa !2
  %eta.addr5 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 300)
  store double* %un, double** %un.addr, align 8, !tbaa !2
  %un.addr6 = bitcast double** %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 301)
  store double* %u, double** %u.addr, align 8, !tbaa !2
  %u.addr7 = bitcast double** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 302)
  store double* %wet, double** %wet.addr, align 8, !tbaa !2
  %wet.addr8 = bitcast double** %wet.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 303)
  store double* %v, double** %v.addr, align 8, !tbaa !2
  %v.addr9 = bitcast double** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 304)
  store double* %vn, double** %vn.addr, align 8, !tbaa !2
  %vn.addr10 = bitcast double** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr10, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 305)
  store double* %h, double** %h.addr, align 8, !tbaa !2
  %h.addr11 = bitcast double** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 306)
  store double* %etan, double** %etan.addr, align 8, !tbaa !2
  %etan.addr12 = bitcast double** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 307)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !14
  %BytesPerWord.addr13 = bitcast i32* %BytesPerWord.addr to i8*, !optimi !12
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 308)
  %0 = bitcast double** %du to i8*, !optimi !23
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #1
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 327)
  %1 = bitcast double** %dv to i8*, !optimi !23
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #1
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 328)
  %2 = bitcast double** %du to i8**, !optimi !23
  %3 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !14, !optimi !12
  %mul = shl nsw i32 %3, 18, !optimi !39
  %conv = sext i32 %mul to i64, !optimi !39
  %call = call i32 @posix_memalign(i8** nonnull %2, i64 64, i64 %conv) #1, !optimi !40
  %4 = bitcast double** %dv to i8**, !optimi !23
  %5 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !14, !optimi !12
  %mul16 = shl nsw i32 %5, 18, !optimi !39
  %conv17 = sext i32 %mul16 to i64, !optimi !39
  %call18 = call i32 @posix_memalign(i8** nonnull %4, i64 64, i64 %conv17) #1, !optimi !40
  %6 = bitcast double* %dt.addr to i64*, !optimi !24
  %7 = bitcast double* %g.addr to i64*, !optimi !25
  %8 = bitcast double* %dx.addr to i64*, !optimi !24
  %9 = bitcast double* %dy.addr to i64*, !optimi !24
  %10 = bitcast double** %du.addr.i to i8*, !optimi !23
  %11 = bitcast double** %dv.addr.i to i8*, !optimi !23
  %12 = bitcast double* %dt.addr.i to i8*, !optimi !24
  %13 = bitcast double* %g.addr.i to i8*, !optimi !25
  %14 = bitcast double* %eta_jCOLS_k_1.addr.i to i8*, !optimi !1
  %15 = bitcast double* %eta_jCOLS_k.addr.i to i8*, !optimi !1
  %16 = bitcast double* %eta_j1COLS_k.addr.i to i8*, !optimi !1
  %17 = bitcast double* %dx.addr.i to i8*, !optimi !24
  %18 = bitcast double* %dy.addr.i to i8*, !optimi !24
  %19 = bitcast double* %dt.addr.i to i64*, !optimi !24
  %20 = bitcast double* %g.addr.i to i64*, !optimi !25
  %21 = bitcast double* %eta_jCOLS_k_1.addr.i to i64*, !optimi !1
  %22 = bitcast double* %eta_jCOLS_k.addr.i to i64*, !optimi !1
  %23 = bitcast double* %eta_j1COLS_k.addr.i to i64*, !optimi !1
  %24 = bitcast double* %dx.addr.i to i64*, !optimi !24
  %25 = bitcast double* %dy.addr.i to i64*, !optimi !24
  br label %for.cond20.preheader

for.cond.loopexit:                                ; preds = %for.body23
  %exitcond252 = icmp eq i64 %indvars.iv.next249, 511, !optimi !8
  br i1 %exitcond252, label %for.cond50.preheader.preheader, label %for.cond20.preheader

for.cond50.preheader.preheader:                   ; preds = %for.cond.loopexit
  br label %for.cond50.preheader

for.cond20.preheader:                             ; preds = %for.cond.loopexit, %entry
  %indvars.iv248 = phi i64 [ 1, %entry ], [ %indvars.iv.next249, %for.cond.loopexit ], !optimi !41
  %indvars.iv.next249 = add nuw nsw i64 %indvars.iv248, 1, !optimi !41
  %26 = shl nsw i64 %indvars.iv248, 9, !optimi !42
  %27 = shl i64 %indvars.iv.next249, 9, !optimi !42
  br label %for.body23

for.body23:                                       ; preds = %for.body23, %for.cond20.preheader
  %indvars.iv242 = phi i64 [ 1, %for.cond20.preheader ], [ %indvars.iv.next243, %for.body23 ], !optimi !41
  %28 = load double*, double** %du, align 8, !tbaa !2, !optimi !23
  %29 = add nuw nsw i64 %indvars.iv242, %26, !optimi !43
  %arrayidx = getelementptr inbounds double, double* %28, i64 %29, !optimi !23
  %30 = load double*, double** %dv, align 8, !tbaa !2, !optimi !23
  %arrayidx28 = getelementptr inbounds double, double* %30, i64 %29, !optimi !23
  %31 = load i64, i64* %6, align 8, !tbaa !6, !optimi !24
  %32 = load i64, i64* %7, align 8, !tbaa !6, !optimi !25
  %33 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  %34 = add nuw nsw i64 %29, 1, !optimi !44
  %arrayidx33 = getelementptr inbounds double, double* %33, i64 %34, !optimi !1
  %35 = bitcast double* %arrayidx33 to i64*, !optimi !1
  %36 = load i64, i64* %35, align 8, !tbaa !6, !optimi !1
  %arrayidx37 = getelementptr inbounds double, double* %33, i64 %29, !optimi !1
  %37 = bitcast double* %arrayidx37 to i64*, !optimi !1
  %38 = load i64, i64* %37, align 8, !tbaa !6, !optimi !1
  %39 = add nuw nsw i64 %indvars.iv242, %27, !optimi !43
  %arrayidx42 = getelementptr inbounds double, double* %33, i64 %39, !optimi !1
  %40 = bitcast double* %arrayidx42 to i64*, !optimi !1
  %41 = load i64, i64* %40, align 8, !tbaa !6, !optimi !1
  %42 = load i64, i64* %8, align 8, !tbaa !6, !optimi !24
  %43 = load i64, i64* %9, align 8, !tbaa !6, !optimi !24
  call void @llvm.lifetime.start(i64 8, i8* nonnull %10)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %11)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %12)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %13)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %14)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %15)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %16)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %17)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %18)
  store double* %arrayidx, double** %du.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %10, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 151) #1
  store double* %arrayidx28, double** %dv.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %11, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 152) #1
  store i64 %31, i64* %19, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 153) #1
  store i64 %32, i64* %20, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 154) #1
  store i64 %36, i64* %21, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 155) #1
  store i64 %38, i64* %22, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 156) #1
  store i64 %41, i64* %23, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 157) #1
  store i64 %42, i64* %24, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 158) #1
  store i64 %43, i64* %25, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 159) #1
  %44 = load double, double* %dt.addr.i, align 8, !tbaa !6, !optimi !24
  %45 = load double, double* %g.addr.i, align 8, !tbaa !6, !optimi !25
  %46 = fmul double %44, %45, !optimi !26
  %47 = load double, double* %eta_jCOLS_k_1.addr.i, align 8, !tbaa !6, !optimi !1
  %48 = load double, double* %eta_jCOLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %sub10.i = fsub double %47, %48, !optimi !27
  %49 = fmul double %46, %sub10.i, !optimi !28
  %mul11.i = fsub double -0.000000e+00, %49, !optimi !28
  %50 = load double, double* %dx.addr.i, align 8, !tbaa !6, !optimi !24
  %div.i = fdiv double %mul11.i, %50, !optimi !23
  %51 = load double*, double** %du.addr.i, align 8, !tbaa !2, !optimi !23
  store double %div.i, double* %51, align 8, !tbaa !6
  %52 = load double, double* %dt.addr.i, align 8, !tbaa !6, !optimi !24
  %53 = load double, double* %g.addr.i, align 8, !tbaa !6, !optimi !25
  %54 = fmul double %52, %53, !optimi !26
  %55 = load double, double* %eta_j1COLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %56 = load double, double* %eta_jCOLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %sub14.i = fsub double %55, %56, !optimi !27
  %57 = fmul double %54, %sub14.i, !optimi !28
  %mul15.i = fsub double -0.000000e+00, %57, !optimi !28
  %58 = load double, double* %dy.addr.i, align 8, !tbaa !6, !optimi !24
  %div16.i = fdiv double %mul15.i, %58, !optimi !23
  %59 = load double*, double** %dv.addr.i, align 8, !tbaa !2, !optimi !23
  store double %div16.i, double* %59, align 8, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %10)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %11)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %12)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %13)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %14)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %15)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %16)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %17)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %18)
  %indvars.iv.next243 = add nuw nsw i64 %indvars.iv242, 1, !optimi !41
  %exitcond247 = icmp eq i64 %indvars.iv.next243, 511, !optimi !8
  br i1 %exitcond247, label %for.cond.loopexit, label %for.body23

for.cond50.preheader:                             ; preds = %for.cond50.preheader.preheader, %for.inc90
  %indvars.iv238 = phi i64 [ %indvars.iv.next239, %for.inc90 ], [ 1, %for.cond50.preheader.preheader ], !optimi !41
  %60 = shl nsw i64 %indvars.iv238, 9, !optimi !42
  br label %for.body53

for.body53:                                       ; preds = %for.body53, %for.cond50.preheader
  %indvars.iv233 = phi i64 [ 1, %for.cond50.preheader ], [ %indvars.iv.next234, %for.body53 ], !optimi !41
  %61 = load double*, double** %un.addr, align 8, !tbaa !2, !optimi !10
  %62 = add nuw nsw i64 %indvars.iv233, %60, !optimi !43
  %arrayidx57 = getelementptr inbounds double, double* %61, i64 %62, !optimi !10
  %63 = load double*, double** %u.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx61 = getelementptr inbounds double, double* %63, i64 %62, !optimi !10
  %64 = load double, double* %arrayidx61, align 8, !tbaa !6, !optimi !10
  %65 = load double*, double** %du, align 8, !tbaa !2, !optimi !23
  %arrayidx65 = getelementptr inbounds double, double* %65, i64 %62, !optimi !23
  %66 = load double, double* %arrayidx65, align 8, !tbaa !6, !optimi !23
  %67 = load double*, double** %wet.addr, align 8, !tbaa !2, !optimi !8
  %arrayidx69 = getelementptr inbounds double, double* %67, i64 %62, !optimi !8
  %68 = load double, double* %arrayidx69, align 8, !tbaa !6, !optimi !8
  %69 = add nuw nsw i64 %62, 1, !optimi !44
  %arrayidx74 = getelementptr inbounds double, double* %67, i64 %69, !optimi !8
  %70 = load double, double* %arrayidx74, align 8, !tbaa !6, !optimi !8
  %71 = load double*, double** %vn.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx78 = getelementptr inbounds double, double* %71, i64 %62, !optimi !10
  %72 = load double*, double** %v.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx82 = getelementptr inbounds double, double* %72, i64 %62, !optimi !10
  %73 = load double, double* %arrayidx82, align 8, !tbaa !6, !optimi !10
  %74 = load double*, double** %dv, align 8, !tbaa !2, !optimi !23
  %arrayidx86 = getelementptr inbounds double, double* %74, i64 %62, !optimi !23
  call void @sw2d_dyn_host_secondLoop(double* %arrayidx57, double %64, double %66, double %68, double %70, double* %arrayidx78, double %73, double* %arrayidx86)
  %indvars.iv.next234 = add nuw nsw i64 %indvars.iv233, 1, !optimi !41
  %exitcond237 = icmp eq i64 %indvars.iv.next234, 511, !optimi !8
  br i1 %exitcond237, label %for.inc90, label %for.body53

for.inc90:                                        ; preds = %for.body53
  %indvars.iv.next239 = add nuw nsw i64 %indvars.iv238, 1, !optimi !41
  %exitcond241 = icmp eq i64 %indvars.iv.next239, 511, !optimi !8
  br i1 %exitcond241, label %for.cond97.preheader.preheader, label %for.cond50.preheader

for.cond97.preheader.preheader:                   ; preds = %for.inc90
  br label %for.cond97.preheader

for.cond93.loopexit:                              ; preds = %for.body100
  %exitcond232 = icmp eq i64 %indvars.iv.next228, 511, !optimi !8
  br i1 %exitcond232, label %for.end155, label %for.cond97.preheader

for.cond97.preheader:                             ; preds = %for.cond97.preheader.preheader, %for.cond93.loopexit
  %indvars.iv227 = phi i64 [ %indvars.iv.next228, %for.cond93.loopexit ], [ 1, %for.cond97.preheader.preheader ], !optimi !41
  %indvars.iv.next228 = add nuw nsw i64 %indvars.iv227, 1, !optimi !41
  %75 = shl i64 %indvars.iv227, 9, !optimi !42
  %76 = add nsw i64 %75, -512, !optimi !45
  %77 = shl i64 %indvars.iv.next228, 9, !optimi !42
  br label %for.body100

for.body100:                                      ; preds = %for.body100, %for.cond97.preheader
  %indvars.iv = phi i64 [ 1, %for.cond97.preheader ], [ %indvars.iv.next, %for.body100 ], !optimi !41
  %78 = load double, double* %dx.addr, align 8, !tbaa !6, !optimi !24
  %79 = load double, double* %dy.addr, align 8, !tbaa !6, !optimi !24
  %80 = load double, double* %dt.addr, align 8, !tbaa !6, !optimi !24
  %81 = load double*, double** %un.addr, align 8, !tbaa !2, !optimi !10
  %82 = add nuw nsw i64 %indvars.iv, %75, !optimi !43
  %arrayidx104 = getelementptr inbounds double, double* %81, i64 %82, !optimi !10
  %83 = load double, double* %arrayidx104, align 8, !tbaa !6, !optimi !10
  %84 = add nsw i64 %82, -1, !optimi !46
  %arrayidx108 = getelementptr inbounds double, double* %81, i64 %84, !optimi !10
  %85 = load double, double* %arrayidx108, align 8, !tbaa !6, !optimi !10
  %86 = load double*, double** %vn.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx112 = getelementptr inbounds double, double* %86, i64 %82, !optimi !10
  %87 = load double, double* %arrayidx112, align 8, !tbaa !6, !optimi !10
  %88 = add nuw nsw i64 %76, %indvars.iv, !optimi !47
  %arrayidx117 = getelementptr inbounds double, double* %86, i64 %88, !optimi !10
  %89 = load double, double* %arrayidx117, align 8, !tbaa !6, !optimi !10
  %90 = load double*, double** %h.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx121 = getelementptr inbounds double, double* %90, i64 %82, !optimi !1
  %91 = load double, double* %arrayidx121, align 8, !tbaa !6, !optimi !1
  %92 = add nuw nsw i64 %82, 1, !optimi !44
  %arrayidx126 = getelementptr inbounds double, double* %90, i64 %92, !optimi !1
  %93 = load double, double* %arrayidx126, align 8, !tbaa !6, !optimi !1
  %arrayidx131 = getelementptr inbounds double, double* %90, i64 %84, !optimi !1
  %94 = load double, double* %arrayidx131, align 8, !tbaa !6, !optimi !1
  %95 = add nuw nsw i64 %indvars.iv, %77, !optimi !43
  %arrayidx136 = getelementptr inbounds double, double* %90, i64 %95, !optimi !1
  %96 = load double, double* %arrayidx136, align 8, !tbaa !6, !optimi !1
  %arrayidx141 = getelementptr inbounds double, double* %90, i64 %88, !optimi !1
  %97 = load double, double* %arrayidx141, align 8, !tbaa !6, !optimi !1
  %98 = load double*, double** %etan.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx145 = getelementptr inbounds double, double* %98, i64 %82, !optimi !1
  %99 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx149 = getelementptr inbounds double, double* %99, i64 %82, !optimi !1
  call void @sw2d_dyn_host_finalLoop(double %78, double %79, double %80, double %83, double %85, double %87, double %89, double %91, double %93, double %94, double %96, double %97, double* %arrayidx145, double* %arrayidx149)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !41
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
define void @sw2d_shapiro_host_terms(double %wet_jCOLS_k, double %wet_jCOLS_k_1, double %wet_jCOLS_k_neg1, double %wet_j1COLS_k, double %wet_jNeg1COLS_k, double %etan_jCOLS_k, double %etan_j1COLS_k, double %etan_jNeg1COLS_k, double %etan_jCOLS_k_1, double %etan_jCOLS_k_neg1, double %eps, double* %eta) local_unnamed_addr #0 {
entry:
  %wet_jCOLS_k.addr = alloca double, align 8, !optimi !8
  %wet_jCOLS_k_1.addr = alloca double, align 8, !optimi !8
  %wet_jCOLS_k_neg1.addr = alloca double, align 8, !optimi !8
  %wet_j1COLS_k.addr = alloca double, align 8, !optimi !8
  %wet_jNeg1COLS_k.addr = alloca double, align 8, !optimi !8
  %etan_jCOLS_k.addr = alloca double, align 8, !optimi !1
  %etan_j1COLS_k.addr = alloca double, align 8, !optimi !1
  %etan_jNeg1COLS_k.addr = alloca double, align 8, !optimi !1
  %etan_jCOLS_k_1.addr = alloca double, align 8, !optimi !1
  %etan_jCOLS_k_neg1.addr = alloca double, align 8, !optimi !1
  %eps.addr = alloca double, align 8, !optimi !48
  %eta.addr = alloca double*, align 8, !optimi !1
  store double %wet_jCOLS_k, double* %wet_jCOLS_k.addr, align 8, !tbaa !6
  %wet_jCOLS_k.addr1 = bitcast double* %wet_jCOLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k.addr1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 397)
  store double %wet_jCOLS_k_1, double* %wet_jCOLS_k_1.addr, align 8, !tbaa !6
  %wet_jCOLS_k_1.addr2 = bitcast double* %wet_jCOLS_k_1.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k_1.addr2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 398)
  store double %wet_jCOLS_k_neg1, double* %wet_jCOLS_k_neg1.addr, align 8, !tbaa !6
  %wet_jCOLS_k_neg1.addr3 = bitcast double* %wet_jCOLS_k_neg1.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k_neg1.addr3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 399)
  store double %wet_j1COLS_k, double* %wet_j1COLS_k.addr, align 8, !tbaa !6
  %wet_j1COLS_k.addr4 = bitcast double* %wet_j1COLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_j1COLS_k.addr4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 400)
  store double %wet_jNeg1COLS_k, double* %wet_jNeg1COLS_k.addr, align 8, !tbaa !6
  %wet_jNeg1COLS_k.addr5 = bitcast double* %wet_jNeg1COLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jNeg1COLS_k.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 401)
  store double %etan_jCOLS_k, double* %etan_jCOLS_k.addr, align 8, !tbaa !6
  %etan_jCOLS_k.addr6 = bitcast double* %etan_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_jCOLS_k.addr6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 402)
  store double %etan_j1COLS_k, double* %etan_j1COLS_k.addr, align 8, !tbaa !6
  %etan_j1COLS_k.addr7 = bitcast double* %etan_j1COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_j1COLS_k.addr7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 403)
  store double %etan_jNeg1COLS_k, double* %etan_jNeg1COLS_k.addr, align 8, !tbaa !6
  %etan_jNeg1COLS_k.addr8 = bitcast double* %etan_jNeg1COLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_jNeg1COLS_k.addr8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 404)
  store double %etan_jCOLS_k_1, double* %etan_jCOLS_k_1.addr, align 8, !tbaa !6
  %etan_jCOLS_k_1.addr9 = bitcast double* %etan_jCOLS_k_1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_jCOLS_k_1.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 405)
  store double %etan_jCOLS_k_neg1, double* %etan_jCOLS_k_neg1.addr, align 8, !tbaa !6
  %etan_jCOLS_k_neg1.addr10 = bitcast double* %etan_jCOLS_k_neg1.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan_jCOLS_k_neg1.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 406)
  store double %eps, double* %eps.addr, align 8, !tbaa !6
  %eps.addr11 = bitcast double* %eps.addr to i8*, !optimi !48
  call void @llvm.var.annotation(i8* nonnull %eps.addr11, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 407)
  store double* %eta, double** %eta.addr, align 8, !tbaa !2
  %eta.addr12 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 408)
  %0 = load double, double* %wet_jCOLS_k.addr, align 8, !tbaa !6, !optimi !8
  %cmp = fcmp oeq double %0, 1.000000e+00, !optimi !8
  %1 = load double, double* %etan_jNeg1COLS_k.addr, align 8, !tbaa !6, !optimi !1
  %2 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load double, double* %eps.addr, align 8, !tbaa !6, !optimi !48
  %mul = fmul double %3, 2.500000e-01, !optimi !49
  %4 = load double, double* %wet_jCOLS_k_1.addr, align 8, !tbaa !6, !optimi !8
  %5 = load double, double* %wet_jCOLS_k_neg1.addr, align 8, !tbaa !6, !optimi !8
  %add = fadd double %4, %5, !optimi !50
  %6 = load double, double* %wet_j1COLS_k.addr, align 8, !tbaa !6, !optimi !8
  %add13 = fadd double %add, %6, !optimi !51
  %7 = load double, double* %wet_jNeg1COLS_k.addr, align 8, !tbaa !6, !optimi !8
  %add14 = fadd double %add13, %7, !optimi !52
  %mul15 = fmul double %mul, %add14, !optimi !49
  %sub = fsub double 1.000000e+00, %mul15, !optimi !53
  %8 = load double, double* %etan_jCOLS_k.addr, align 8, !tbaa !6, !optimi !1
  %mul16 = fmul double %8, %sub, !optimi !54
  %9 = load double, double* %etan_jCOLS_k_1.addr, align 8, !tbaa !6, !optimi !1
  %mul18 = fmul double %4, %9, !optimi !1
  %10 = load double, double* %etan_jCOLS_k_neg1.addr, align 8, !tbaa !6, !optimi !1
  %mul19 = fmul double %5, %10, !optimi !1
  %add20 = fadd double %mul18, %mul19, !optimi !11
  %mul21 = fmul double %mul, %add20, !optimi !55
  %11 = load double, double* %etan_j1COLS_k.addr, align 8, !tbaa !6, !optimi !1
  %mul23 = fmul double %6, %11, !optimi !1
  %mul24 = fmul double %1, %7, !optimi !1
  %add25 = fadd double %mul24, %mul23, !optimi !11
  %mul26 = fmul double %mul, %add25, !optimi !55
  %add27 = fadd double %mul16, %mul21, !optimi !54
  %add28 = fadd double %add27, %mul26, !optimi !54
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %storemerge = phi double [ %add28, %if.then ], [ %1, %entry ], !optimi !54
  store double %storemerge, double* %2, align 8, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_shapiro_host(double* %wet, double* %etan, double %eps, double* %eta) local_unnamed_addr #0 {
entry:
  %wet_jCOLS_k.addr.i = alloca double, align 8, !optimi !8
  %wet_jCOLS_k_1.addr.i = alloca double, align 8, !optimi !8
  %wet_jCOLS_k_neg1.addr.i = alloca double, align 8, !optimi !8
  %wet_j1COLS_k.addr.i = alloca double, align 8, !optimi !8
  %wet_jNeg1COLS_k.addr.i = alloca double, align 8, !optimi !8
  %etan_jCOLS_k.addr.i = alloca double, align 8, !optimi !1
  %etan_j1COLS_k.addr.i = alloca double, align 8, !optimi !1
  %etan_jNeg1COLS_k.addr.i = alloca double, align 8, !optimi !1
  %etan_jCOLS_k_1.addr.i = alloca double, align 8, !optimi !1
  %etan_jCOLS_k_neg1.addr.i = alloca double, align 8, !optimi !1
  %eps.addr.i = alloca double, align 8, !optimi !48
  %eta.addr.i = alloca double*, align 8, !optimi !1
  %wet.addr = alloca double*, align 8, !optimi !8
  %etan.addr = alloca double*, align 8, !optimi !1
  %eps.addr = alloca double, align 8, !optimi !48
  %eta.addr = alloca double*, align 8, !optimi !1
  store double* %wet, double** %wet.addr, align 8, !tbaa !2
  %wet.addr1 = bitcast double** %wet.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet.addr1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 438)
  store double* %etan, double** %etan.addr, align 8, !tbaa !2
  %etan.addr2 = bitcast double** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %etan.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 439)
  store double %eps, double* %eps.addr, align 8, !tbaa !6
  %eps.addr3 = bitcast double* %eps.addr to i8*, !optimi !48
  call void @llvm.var.annotation(i8* nonnull %eps.addr3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 440)
  store double* %eta, double** %eta.addr, align 8, !tbaa !2
  %eta.addr4 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 441)
  %0 = bitcast double* %eps.addr to i64*, !optimi !48
  %1 = bitcast double* %wet_jCOLS_k.addr.i to i8*, !optimi !8
  %2 = bitcast double* %wet_jCOLS_k_1.addr.i to i8*, !optimi !8
  %3 = bitcast double* %wet_jCOLS_k_neg1.addr.i to i8*, !optimi !8
  %4 = bitcast double* %wet_j1COLS_k.addr.i to i8*, !optimi !8
  %5 = bitcast double* %wet_jNeg1COLS_k.addr.i to i8*, !optimi !8
  %6 = bitcast double* %etan_jCOLS_k.addr.i to i8*, !optimi !1
  %7 = bitcast double* %etan_j1COLS_k.addr.i to i8*, !optimi !1
  %8 = bitcast double* %etan_jNeg1COLS_k.addr.i to i8*, !optimi !1
  %9 = bitcast double* %etan_jCOLS_k_1.addr.i to i8*, !optimi !1
  %10 = bitcast double* %etan_jCOLS_k_neg1.addr.i to i8*, !optimi !1
  %11 = bitcast double* %eps.addr.i to i8*, !optimi !48
  %12 = bitcast double** %eta.addr.i to i8*, !optimi !1
  %13 = bitcast double* %wet_jCOLS_k.addr.i to i64*, !optimi !8
  %14 = bitcast double* %wet_jCOLS_k_1.addr.i to i64*, !optimi !8
  %15 = bitcast double* %wet_jCOLS_k_neg1.addr.i to i64*, !optimi !8
  %16 = bitcast double* %wet_j1COLS_k.addr.i to i64*, !optimi !8
  %17 = bitcast double* %wet_jNeg1COLS_k.addr.i to i64*, !optimi !8
  %18 = bitcast double* %etan_jCOLS_k.addr.i to i64*, !optimi !1
  %19 = bitcast double* %etan_j1COLS_k.addr.i to i64*, !optimi !1
  %20 = bitcast double* %etan_jNeg1COLS_k.addr.i to i64*, !optimi !1
  %21 = bitcast double* %etan_jCOLS_k_1.addr.i to i64*, !optimi !1
  %22 = bitcast double* %etan_jCOLS_k_neg1.addr.i to i64*, !optimi !1
  %23 = bitcast double* %eps.addr.i to i64*, !optimi !48
  br label %for.cond5.preheader

for.cond.loopexit:                                ; preds = %sw2d_shapiro_host_terms.exit
  %exitcond100 = icmp eq i64 %indvars.iv.next96, 511, !optimi !8
  br i1 %exitcond100, label %for.end58, label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond.loopexit, %entry
  %indvars.iv95 = phi i64 [ 1, %entry ], [ %indvars.iv.next96, %for.cond.loopexit ], !optimi !41
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1, !optimi !41
  %24 = shl i64 %indvars.iv95, 9, !optimi !42
  %25 = shl i64 %indvars.iv.next96, 9, !optimi !42
  %26 = add nsw i64 %24, -512, !optimi !45
  br label %for.body7

for.body7:                                        ; preds = %sw2d_shapiro_host_terms.exit, %for.cond5.preheader
  %indvars.iv = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %sw2d_shapiro_host_terms.exit ], !optimi !41
  %27 = load double*, double** %wet.addr, align 8, !tbaa !2, !optimi !8
  %28 = add nuw nsw i64 %indvars.iv, %24, !optimi !43
  %arrayidx = getelementptr inbounds double, double* %27, i64 %28, !optimi !8
  %29 = bitcast double* %arrayidx to i64*, !optimi !8
  %30 = load i64, i64* %29, align 8, !tbaa !6, !optimi !8
  %31 = add nuw nsw i64 %28, 1, !optimi !44
  %arrayidx12 = getelementptr inbounds double, double* %27, i64 %31, !optimi !8
  %32 = bitcast double* %arrayidx12 to i64*, !optimi !8
  %33 = load i64, i64* %32, align 8, !tbaa !6, !optimi !8
  %34 = add nsw i64 %28, -1, !optimi !46
  %arrayidx16 = getelementptr inbounds double, double* %27, i64 %34, !optimi !8
  %35 = bitcast double* %arrayidx16 to i64*, !optimi !8
  %36 = load i64, i64* %35, align 8, !tbaa !6, !optimi !8
  %37 = add nuw nsw i64 %indvars.iv, %25, !optimi !43
  %arrayidx21 = getelementptr inbounds double, double* %27, i64 %37, !optimi !8
  %38 = bitcast double* %arrayidx21 to i64*, !optimi !8
  %39 = load i64, i64* %38, align 8, !tbaa !6, !optimi !8
  %40 = add nuw nsw i64 %26, %indvars.iv, !optimi !47
  %arrayidx26 = getelementptr inbounds double, double* %27, i64 %40, !optimi !8
  %41 = bitcast double* %arrayidx26 to i64*, !optimi !8
  %42 = load i64, i64* %41, align 8, !tbaa !6, !optimi !8
  %43 = load double*, double** %etan.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx30 = getelementptr inbounds double, double* %43, i64 %28, !optimi !1
  %44 = bitcast double* %arrayidx30 to i64*, !optimi !1
  %45 = load i64, i64* %44, align 8, !tbaa !6, !optimi !1
  %arrayidx35 = getelementptr inbounds double, double* %43, i64 %37, !optimi !1
  %46 = bitcast double* %arrayidx35 to i64*, !optimi !1
  %47 = load i64, i64* %46, align 8, !tbaa !6, !optimi !1
  %arrayidx40 = getelementptr inbounds double, double* %43, i64 %40, !optimi !1
  %48 = bitcast double* %arrayidx40 to i64*, !optimi !1
  %49 = load i64, i64* %48, align 8, !tbaa !6, !optimi !1
  %arrayidx45 = getelementptr inbounds double, double* %43, i64 %31, !optimi !1
  %50 = bitcast double* %arrayidx45 to i64*, !optimi !1
  %51 = load i64, i64* %50, align 8, !tbaa !6, !optimi !1
  %arrayidx50 = getelementptr inbounds double, double* %43, i64 %34, !optimi !1
  %52 = bitcast double* %arrayidx50 to i64*, !optimi !1
  %53 = load i64, i64* %52, align 8, !tbaa !6, !optimi !1
  %54 = load i64, i64* %0, align 8, !tbaa !6, !optimi !48
  %55 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx55 = getelementptr inbounds double, double* %55, i64 %40, !optimi !1
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %3)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %6)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %7)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %8)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %9)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %10)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %11)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %12)
  store i64 %30, i64* %13, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 397) #1
  store i64 %33, i64* %14, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 398) #1
  store i64 %36, i64* %15, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 399) #1
  store i64 %39, i64* %16, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 400) #1
  store i64 %42, i64* %17, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 401) #1
  store i64 %45, i64* %18, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 402) #1
  store i64 %47, i64* %19, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 403) #1
  store i64 %49, i64* %20, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 404) #1
  store i64 %51, i64* %21, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 405) #1
  store i64 %53, i64* %22, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 406) #1
  store i64 %54, i64* %23, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %11, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 407) #1
  store double* %arrayidx55, double** %eta.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 408) #1
  %56 = load double, double* %wet_jCOLS_k.addr.i, align 8, !tbaa !6, !optimi !8
  %cmp.i = fcmp oeq double %56, 1.000000e+00, !optimi !8
  %57 = load double, double* %etan_jNeg1COLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %58 = load double*, double** %eta.addr.i, align 8, !tbaa !2, !optimi !1
  br i1 %cmp.i, label %if.then.i, label %sw2d_shapiro_host_terms.exit

if.then.i:                                        ; preds = %for.body7
  %59 = load double, double* %eps.addr.i, align 8, !tbaa !6, !optimi !48
  %mul.i = fmul double %59, 2.500000e-01, !optimi !49
  %60 = load double, double* %wet_jCOLS_k_1.addr.i, align 8, !tbaa !6, !optimi !8
  %61 = load double, double* %wet_jCOLS_k_neg1.addr.i, align 8, !tbaa !6, !optimi !8
  %add.i = fadd double %60, %61, !optimi !50
  %62 = load double, double* %wet_j1COLS_k.addr.i, align 8, !tbaa !6, !optimi !8
  %add13.i = fadd double %add.i, %62, !optimi !51
  %63 = load double, double* %wet_jNeg1COLS_k.addr.i, align 8, !tbaa !6, !optimi !8
  %add14.i = fadd double %add13.i, %63, !optimi !52
  %mul15.i = fmul double %mul.i, %add14.i, !optimi !49
  %sub.i = fsub double 1.000000e+00, %mul15.i, !optimi !53
  %64 = load double, double* %etan_jCOLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %mul16.i = fmul double %64, %sub.i, !optimi !54
  %65 = load double, double* %etan_jCOLS_k_1.addr.i, align 8, !tbaa !6, !optimi !1
  %mul18.i = fmul double %60, %65, !optimi !1
  %66 = load double, double* %etan_jCOLS_k_neg1.addr.i, align 8, !tbaa !6, !optimi !1
  %mul19.i = fmul double %61, %66, !optimi !1
  %add20.i = fadd double %mul18.i, %mul19.i, !optimi !11
  %mul21.i = fmul double %mul.i, %add20.i, !optimi !55
  %67 = load double, double* %etan_j1COLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %mul23.i = fmul double %62, %67, !optimi !1
  %mul24.i = fmul double %57, %63, !optimi !1
  %add25.i = fadd double %mul24.i, %mul23.i, !optimi !11
  %mul26.i = fmul double %mul.i, %add25.i, !optimi !55
  %add27.i = fadd double %mul16.i, %mul21.i, !optimi !54
  %add28.i = fadd double %add27.i, %mul26.i, !optimi !54
  br label %sw2d_shapiro_host_terms.exit

sw2d_shapiro_host_terms.exit:                     ; preds = %for.body7, %if.then.i
  %storemerge.i = phi double [ %add28.i, %if.then.i ], [ %57, %for.body7 ], !optimi !54
  store double %storemerge.i, double* %58, align 8, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %3)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %4)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %5)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %6)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %7)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %8)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %9)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %10)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %11)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %12)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !41
  %exitcond = icmp eq i64 %indvars.iv.next, 511, !optimi !8
  br i1 %exitcond, label %for.cond.loopexit, label %for.body7

for.end58:                                        ; preds = %for.cond.loopexit
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_updates_host_loop(double* %h_jCOLS_k, double %hzero_jCOLS_k, double %eta_jCOLS_k, double* %wet_jCOLS_k, double %hmin, double* %u, double* %v, double %un, double %vn) local_unnamed_addr #0 {
entry:
  %h_jCOLS_k.addr = alloca double*, align 8, !optimi !1
  %hzero_jCOLS_k.addr = alloca double, align 8, !optimi !1
  %eta_jCOLS_k.addr = alloca double, align 8, !optimi !1
  %wet_jCOLS_k.addr = alloca double*, align 8, !optimi !8
  %hmin.addr = alloca double, align 8, !optimi !1
  %u.addr = alloca double*, align 8, !optimi !10
  %v.addr = alloca double*, align 8, !optimi !10
  %un.addr = alloca double, align 8, !optimi !10
  %vn.addr = alloca double, align 8, !optimi !10
  store double* %h_jCOLS_k, double** %h_jCOLS_k.addr, align 8, !tbaa !2
  %h_jCOLS_k.addr1 = bitcast double** %h_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h_jCOLS_k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 474)
  store double %hzero_jCOLS_k, double* %hzero_jCOLS_k.addr, align 8, !tbaa !6
  %hzero_jCOLS_k.addr2 = bitcast double* %hzero_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero_jCOLS_k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 475)
  store double %eta_jCOLS_k, double* %eta_jCOLS_k.addr, align 8, !tbaa !6
  %eta_jCOLS_k.addr3 = bitcast double* %eta_jCOLS_k.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta_jCOLS_k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 476)
  store double* %wet_jCOLS_k, double** %wet_jCOLS_k.addr, align 8, !tbaa !2
  %wet_jCOLS_k.addr4 = bitcast double** %wet_jCOLS_k.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet_jCOLS_k.addr4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 477)
  store double %hmin, double* %hmin.addr, align 8, !tbaa !6
  %hmin.addr5 = bitcast double* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hmin.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 478)
  store double* %u, double** %u.addr, align 8, !tbaa !2
  %u.addr6 = bitcast double** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 479)
  store double* %v, double** %v.addr, align 8, !tbaa !2
  %v.addr7 = bitcast double** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 480)
  store double %un, double* %un.addr, align 8, !tbaa !6
  %un.addr8 = bitcast double* %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 481)
  store double %vn, double* %vn.addr, align 8, !tbaa !6
  %vn.addr9 = bitcast double* %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 482)
  %0 = load double, double* %hzero_jCOLS_k.addr, align 8, !tbaa !6, !optimi !1
  %1 = load double, double* %eta_jCOLS_k.addr, align 8, !tbaa !6, !optimi !1
  %add = fadd double %0, %1, !optimi !11
  %2 = load double*, double** %h_jCOLS_k.addr, align 8, !tbaa !2, !optimi !1
  store double %add, double* %2, align 8, !tbaa !6
  %3 = load double*, double** %wet_jCOLS_k.addr, align 8, !tbaa !2, !optimi !8
  store double 1.000000e+00, double* %3, align 8, !tbaa !6
  %4 = load double, double* %2, align 8, !tbaa !6, !optimi !1
  %5 = load double, double* %hmin.addr, align 8, !tbaa !6, !optimi !1
  %cmp = fcmp olt double %4, %5, !optimi !8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* %3, align 8, !tbaa !6
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = bitcast double* %un.addr to i64*, !optimi !10
  %7 = load i64, i64* %6, align 8, !tbaa !6, !optimi !10
  %8 = bitcast double** %u.addr to i64**, !optimi !10
  %9 = load i64*, i64** %8, align 8, !tbaa !2, !optimi !10
  store i64 %7, i64* %9, align 8, !tbaa !6
  %10 = bitcast double* %vn.addr to i64*, !optimi !10
  %11 = load i64, i64* %10, align 8, !tbaa !6, !optimi !10
  %12 = bitcast double** %v.addr to i64**, !optimi !10
  %13 = load i64*, i64** %12, align 8, !tbaa !2, !optimi !10
  store i64 %11, i64* %13, align 8, !tbaa !6
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_updates_host(double* %h, double* %hzero, double* %eta, double* %u, double* %un, double* %v, double* %vn, double* %wet, double %hmin) local_unnamed_addr #0 {
entry:
  %h_jCOLS_k.addr.i = alloca double*, align 8, !optimi !1
  %hzero_jCOLS_k.addr.i = alloca double, align 8, !optimi !1
  %eta_jCOLS_k.addr.i = alloca double, align 8, !optimi !1
  %wet_jCOLS_k.addr.i = alloca double*, align 8, !optimi !8
  %hmin.addr.i = alloca double, align 8, !optimi !1
  %u.addr.i = alloca double*, align 8, !optimi !10
  %v.addr.i = alloca double*, align 8, !optimi !10
  %un.addr.i = alloca double, align 8, !optimi !10
  %vn.addr.i = alloca double, align 8, !optimi !10
  %h.addr = alloca double*, align 8, !optimi !1
  %hzero.addr = alloca double*, align 8, !optimi !1
  %eta.addr = alloca double*, align 8, !optimi !1
  %u.addr = alloca double*, align 8, !optimi !10
  %un.addr = alloca double*, align 8, !optimi !10
  %v.addr = alloca double*, align 8, !optimi !10
  %vn.addr = alloca double*, align 8, !optimi !10
  %wet.addr = alloca double*, align 8, !optimi !8
  %hmin.addr = alloca double, align 8, !optimi !1
  store double* %h, double** %h.addr, align 8, !tbaa !2
  %h.addr1 = bitcast double** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %h.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 510)
  store double* %hzero, double** %hzero.addr, align 8, !tbaa !2
  %hzero.addr2 = bitcast double** %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hzero.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 511)
  store double* %eta, double** %eta.addr, align 8, !tbaa !2
  %eta.addr3 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %eta.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 512)
  store double* %u, double** %u.addr, align 8, !tbaa !2
  %u.addr4 = bitcast double** %u.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %u.addr4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 513)
  store double* %un, double** %un.addr, align 8, !tbaa !2
  %un.addr5 = bitcast double** %un.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %un.addr5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 514)
  store double* %v, double** %v.addr, align 8, !tbaa !2
  %v.addr6 = bitcast double** %v.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %v.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 515)
  store double* %vn, double** %vn.addr, align 8, !tbaa !2
  %vn.addr7 = bitcast double** %vn.addr to i8*, !optimi !10
  call void @llvm.var.annotation(i8* nonnull %vn.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 516)
  store double* %wet, double** %wet.addr, align 8, !tbaa !2
  %wet.addr8 = bitcast double** %wet.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 517)
  store double %hmin, double* %hmin.addr, align 8, !tbaa !6
  %hmin.addr9 = bitcast double* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* nonnull %hmin.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 518)
  %0 = bitcast double* %hmin.addr to i64*, !optimi !1
  %1 = bitcast double** %h_jCOLS_k.addr.i to i8*, !optimi !1
  %2 = bitcast double* %hzero_jCOLS_k.addr.i to i8*, !optimi !1
  %3 = bitcast double* %eta_jCOLS_k.addr.i to i8*, !optimi !1
  %4 = bitcast double** %wet_jCOLS_k.addr.i to i8*, !optimi !8
  %5 = bitcast double* %hmin.addr.i to i8*, !optimi !1
  %6 = bitcast double** %u.addr.i to i8*, !optimi !10
  %7 = bitcast double** %v.addr.i to i8*, !optimi !10
  %8 = bitcast double* %un.addr.i to i8*, !optimi !10
  %9 = bitcast double* %vn.addr.i to i8*, !optimi !10
  %10 = bitcast double* %hzero_jCOLS_k.addr.i to i64*, !optimi !1
  %11 = bitcast double* %eta_jCOLS_k.addr.i to i64*, !optimi !1
  %12 = bitcast double* %hmin.addr.i to i64*, !optimi !1
  %13 = bitcast double* %un.addr.i to i64*, !optimi !10
  %14 = bitcast double* %vn.addr.i to i64*, !optimi !10
  %15 = bitcast double** %u.addr.i to i64**, !optimi !10
  %16 = bitcast double** %v.addr.i to i64**, !optimi !10
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond.cleanup12, %entry
  %indvars.iv68 = phi i64 [ 0, %entry ], [ %indvars.iv.next69, %for.cond.cleanup12 ], !optimi !56
  %17 = shl i64 %indvars.iv68, 9, !optimi !43
  br label %for.body13

for.cond.cleanup:                                 ; preds = %for.cond.cleanup12
  ret void

for.cond.cleanup12:                               ; preds = %sw2d_updates_host_loop.exit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1, !optimi !56
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 512, !optimi !8
  br i1 %exitcond71, label %for.cond.cleanup, label %for.cond10.preheader

for.body13:                                       ; preds = %sw2d_updates_host_loop.exit, %for.cond10.preheader
  %indvars.iv = phi i64 [ 0, %for.cond10.preheader ], [ %indvars.iv.next, %sw2d_updates_host_loop.exit ], !optimi !56
  %18 = load double*, double** %h.addr, align 8, !tbaa !2, !optimi !1
  %19 = add nuw nsw i64 %indvars.iv, %17, !optimi !57
  %arrayidx = getelementptr inbounds double, double* %18, i64 %19, !optimi !1
  %20 = load double*, double** %hzero.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx17 = getelementptr inbounds double, double* %20, i64 %19, !optimi !1
  %21 = bitcast double* %arrayidx17 to i64*, !optimi !1
  %22 = load i64, i64* %21, align 8, !tbaa !6, !optimi !1
  %23 = load double*, double** %eta.addr, align 8, !tbaa !2, !optimi !1
  %arrayidx21 = getelementptr inbounds double, double* %23, i64 %19, !optimi !1
  %24 = bitcast double* %arrayidx21 to i64*, !optimi !1
  %25 = load i64, i64* %24, align 8, !tbaa !6, !optimi !1
  %26 = load double*, double** %wet.addr, align 8, !tbaa !2, !optimi !8
  %arrayidx25 = getelementptr inbounds double, double* %26, i64 %19, !optimi !8
  %27 = load i64, i64* %0, align 8, !tbaa !6, !optimi !1
  %28 = load double*, double** %u.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx29 = getelementptr inbounds double, double* %28, i64 %19, !optimi !10
  %29 = load double*, double** %v.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx33 = getelementptr inbounds double, double* %29, i64 %19, !optimi !10
  %30 = load double*, double** %un.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx37 = getelementptr inbounds double, double* %30, i64 %19, !optimi !10
  %31 = bitcast double* %arrayidx37 to i64*, !optimi !10
  %32 = load i64, i64* %31, align 8, !tbaa !6, !optimi !10
  %33 = load double*, double** %vn.addr, align 8, !tbaa !2, !optimi !10
  %arrayidx41 = getelementptr inbounds double, double* %33, i64 %19, !optimi !10
  %34 = bitcast double* %arrayidx41 to i64*, !optimi !10
  %35 = load i64, i64* %34, align 8, !tbaa !6, !optimi !10
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %3)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %6)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %7)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %8)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %9)
  store double* %arrayidx, double** %h_jCOLS_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 474) #1
  store i64 %22, i64* %10, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 475) #1
  store i64 %25, i64* %11, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 476) #1
  store double* %arrayidx25, double** %wet_jCOLS_k.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 477) #1
  store i64 %27, i64* %12, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 478) #1
  store double* %arrayidx29, double** %u.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 479) #1
  store double* %arrayidx33, double** %v.addr.i, align 8, !tbaa !2
  call void @llvm.var.annotation(i8* nonnull %7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 480) #1
  store i64 %32, i64* %13, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 481) #1
  store i64 %35, i64* %14, align 8, !tbaa !6
  call void @llvm.var.annotation(i8* nonnull %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 482) #1
  %36 = load double, double* %hzero_jCOLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %37 = load double, double* %eta_jCOLS_k.addr.i, align 8, !tbaa !6, !optimi !1
  %add.i = fadd double %36, %37, !optimi !11
  %38 = load double*, double** %h_jCOLS_k.addr.i, align 8, !tbaa !2, !optimi !1
  store double %add.i, double* %38, align 8, !tbaa !6
  %39 = load double*, double** %wet_jCOLS_k.addr.i, align 8, !tbaa !2, !optimi !8
  store double 1.000000e+00, double* %39, align 8, !tbaa !6
  %40 = load double, double* %38, align 8, !tbaa !6, !optimi !1
  %41 = load double, double* %hmin.addr.i, align 8, !tbaa !6, !optimi !1
  %cmp.i = fcmp olt double %40, %41, !optimi !8
  br i1 %cmp.i, label %if.then.i, label %sw2d_updates_host_loop.exit

if.then.i:                                        ; preds = %for.body13
  store double 0.000000e+00, double* %39, align 8, !tbaa !6
  br label %sw2d_updates_host_loop.exit

sw2d_updates_host_loop.exit:                      ; preds = %for.body13, %if.then.i
  %42 = load i64, i64* %13, align 8, !tbaa !6, !optimi !10
  %43 = load i64*, i64** %15, align 8, !tbaa !2, !optimi !10
  store i64 %42, i64* %43, align 8, !tbaa !6
  %44 = load i64, i64* %14, align 8, !tbaa !6, !optimi !10
  %45 = load i64*, i64** %16, align 8, !tbaa !2, !optimi !10
  store i64 %44, i64* %45, align 8, !tbaa !6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %3)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %4)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %5)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %6)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %7)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %8)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %9)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !56
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
!1 = !{!"(15, 0, 6)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"double", !4, i64 0}
!8 = !{!"(1, 0, 0)"}
!9 = !{!"(-0, -15, 6)"}
!10 = !{!"(10, -10, 6)"}
!11 = !{!"(30, 0, 6)"}
!12 = !{!"(10, 0, 0)"}
!13 = !{!"(514, 0, 0)"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !4, i64 0}
!16 = !{!"(515, 0, 0)"}
!17 = !{!"(263680, 0, 0)"}
!18 = !{!"(264195, 0, 0)"}
!19 = !{!"(515, 1, 0)"}
!20 = !{!"(262147, 261632, 0)"}
!21 = !{!"(264191, 511, 0)"}
!22 = !{!"(2.14748e+09, -2.14748e+09, 0)"}
!23 = !{!"(1.5e+06, -1.5e+06, 10)"}
!24 = !{!"(100, 0, 2)"}
!25 = !{!"(10, 9, 2)"}
!26 = !{!"(1000, 0, 4)"}
!27 = !{!"(15, -15, 6)"}
!28 = !{!"(15000, -15000, 10)"}
!29 = !{!"(1.50001e+06, -1.50001e+06, 10)"}
!30 = !{!"(20, -20, 6)"}
!31 = !{!"(10, -10, 7)"}
!32 = !{!"(150, -150, 13)"}
!33 = !{!"(300, -300, 13)"}
!34 = !{!"(600, -600, 13)"}
!35 = !{!"(60000, -60000, 15)"}
!36 = !{!"(6e+06, -6e+06, 15)"}
!37 = !{!"(6.00002e+06, -6e+06, 15)"}
!38 = !{!"(1.2e+07, -1.2e+07, 15)"}
!39 = !{!"(2.62144e+06, 0, 0)"}
!40 = !{!"(3546, 0, 0)"}
!41 = !{!"(512, 0, 0)"}
!42 = !{!"(262144, 0, 0)"}
!43 = !{!"(262656, 0, 0)"}
!44 = !{!"(262657, 1, 0)"}
!45 = !{!"(261632, -512, 0)"}
!46 = !{!"(262655, -1, 0)"}
!47 = !{!"(262144, -512, 0)"}
!48 = !{!"(0, 0, 2)"}
!49 = !{!"(0, 0, 4)"}
!50 = !{!"(2, 0, 0)"}
!51 = !{!"(3, 0, 0)"}
!52 = !{!"(4, 0, 0)"}
!53 = !{!"(1, 1, 4)"}
!54 = !{!"(15, 0, 10)"}
!55 = !{!"(0, 0, 10)"}
!56 = !{!"(513, 0, 0)"}
!57 = !{!"(263169, 0, 0)"}
