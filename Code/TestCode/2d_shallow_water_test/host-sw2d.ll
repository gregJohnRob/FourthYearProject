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

; Function Attrs: norecurse nounwind uwtable
define void @initHzero(double* nocapture %hzero) local_unnamed_addr #0 {
entry:
  store double 1.000000e+01, double* %hzero, align 8, !tbaa !1
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_init_data_host_loop2And3(double* nocapture %hzero_row0_k, double* nocapture %hzero_lastRow_k) local_unnamed_addr #0 {
entry:
  store double -1.000000e+01, double* %hzero_lastRow_k, align 8, !tbaa !1
  store double -1.000000e+01, double* %hzero_row0_k, align 8, !tbaa !1
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_init_data_host_eta_etan(double* nocapture %eta, double %hzero, double* nocapture %etan) local_unnamed_addr #0 {
entry:
  %cmp = fcmp ogt double %hzero, 0.000000e+00, !optimi !5
  %cond = select i1 %cmp, double 0.000000e+00, double %hzero, !optimi !6
  %sub = fsub double -0.000000e+00, %cond, !optimi !6
  store double %sub, double* %eta, align 8, !tbaa !1
  store double %sub, double* %etan, align 8, !tbaa !1
  ret void
}

; Function Attrs: norecurse nounwind uwtable
define void @sw2d_init_data_host_finalLoop(double* nocapture %h_j_COLS_k, double %hzero_j_COLS_k, double %eta_j_COLS_k, double* nocapture %wet_j_COLS_k, double %hmin, double* nocapture %u, double* nocapture %un, double* nocapture %v, double* nocapture %vn) local_unnamed_addr #0 {
entry:
  %add = fadd double %hzero_j_COLS_k, %eta_j_COLS_k, !optimi !6
  store double %add, double* %h_j_COLS_k, align 8, !tbaa !1
  store double 1.000000e+00, double* %wet_j_COLS_k, align 8, !tbaa !1
  %0 = load double, double* %h_j_COLS_k, align 8, !tbaa !1, !optimi !6
  %cmp = fcmp olt double %0, %hmin, !optimi !5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* %wet_j_COLS_k, align 8, !tbaa !1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store double 0.000000e+00, double* %vn, align 8, !tbaa !1
  store double 0.000000e+00, double* %v, align 8, !tbaa !1
  store double 0.000000e+00, double* %un, align 8, !tbaa !1
  store double 0.000000e+00, double* %u, align 8, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host(double* %hzero, double* %eta, double* %etan, double* %h, double* %wet, double* %u, double* %un, double* %v, double* %vn, double %hmin, i32 %BytesPerWord) local_unnamed_addr #1 {
entry:
  %hzero.addr = alloca double*, align 8, !optimi !7
  %eta.addr = alloca double*, align 8, !optimi !7
  %etan.addr = alloca double*, align 8, !optimi !7
  %h.addr = alloca double*, align 8, !optimi !7
  %wet.addr = alloca double*, align 8, !optimi !5
  %u.addr = alloca double*, align 8, !optimi !8
  %un.addr = alloca double*, align 8, !optimi !8
  %v.addr = alloca double*, align 8, !optimi !8
  %vn.addr = alloca double*, align 8, !optimi !8
  %hmin.addr = alloca double, align 8, !optimi !7
  %BytesPerWord.addr = alloca i32, align 4, !optimi !9
  %j = alloca i32, align 4, !optimi !10
  %k = alloca i32, align 4, !optimi !10
  store double* %hzero, double** %hzero.addr, align 8, !tbaa !11
  %hzero.addr1 = bitcast double** %hzero.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %hzero.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 77)
  store double* %eta, double** %eta.addr, align 8, !tbaa !11
  %eta.addr2 = bitcast double** %eta.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %eta.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 78)
  store double* %etan, double** %etan.addr, align 8, !tbaa !11
  %etan.addr3 = bitcast double** %etan.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %etan.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 79)
  store double* %h, double** %h.addr, align 8, !tbaa !11
  %h.addr4 = bitcast double** %h.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %h.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 80)
  store double* %wet, double** %wet.addr, align 8, !tbaa !11
  %wet.addr5 = bitcast double** %wet.addr to i8*, !optimi !5
  call void @llvm.var.annotation(i8* nonnull %wet.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 81)
  store double* %u, double** %u.addr, align 8, !tbaa !11
  %u.addr6 = bitcast double** %u.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 82)
  store double* %un, double** %un.addr, align 8, !tbaa !11
  %un.addr7 = bitcast double** %un.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %un.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 83)
  store double* %v, double** %v.addr, align 8, !tbaa !11
  %v.addr8 = bitcast double** %v.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %v.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 84)
  store double* %vn, double** %vn.addr, align 8, !tbaa !11
  %vn.addr9 = bitcast double** %vn.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 85)
  store double %hmin, double* %hmin.addr, align 8, !tbaa !1
  %hmin.addr10 = bitcast double* %hmin.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %hmin.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 86)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !13
  %BytesPerWord.addr11 = bitcast i32* %BytesPerWord.addr to i8*, !optimi !9
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 87)
  %0 = bitcast i32* %j to i8*, !optimi !10
  call void @llvm.lifetime.start(i64 4, i8* nonnull %0) #2
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 92)
  %1 = bitcast i32* %k to i8*, !optimi !10
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1) #2
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 92)
  store i32 0, i32* %j, align 4, !tbaa !13
  store i32 0, i32* %k, align 4, !tbaa !13
  %2 = load double*, double** %hzero.addr, align 8, !tbaa !11, !optimi !7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.inc17, %entry
  %indvars.iv168 = phi i64 [ 0, %entry ], [ %indvars.iv.next169, %for.inc17 ], !optimi !15
  %3 = shl i64 %indvars.iv168, 9, !optimi !16
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond14.preheader
  %index = phi i64 [ 0, %for.cond14.preheader ], [ %index.next.3, %vector.body ], !optimi !15
  %4 = add nuw nsw i64 %3, %index, !optimi !17
  %5 = getelementptr inbounds double, double* %2, i64 %4, !optimi !7
  %6 = bitcast double* %5 to <2 x double>*, !optimi !7
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %6, align 8, !tbaa !1
  %7 = getelementptr double, double* %5, i64 2, !optimi !7
  %8 = bitcast double* %7 to <2 x double>*, !optimi !7
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %8, align 8, !tbaa !1
  %index.next = or i64 %index, 4, !optimi !18
  %9 = add nuw nsw i64 %3, %index.next, !optimi !19
  %10 = getelementptr inbounds double, double* %2, i64 %9, !optimi !7
  %11 = bitcast double* %10 to <2 x double>*, !optimi !7
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %11, align 8, !tbaa !1
  %12 = getelementptr double, double* %10, i64 2, !optimi !7
  %13 = bitcast double* %12 to <2 x double>*, !optimi !7
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %13, align 8, !tbaa !1
  %index.next.1 = or i64 %index, 8, !optimi !20
  %14 = add nuw nsw i64 %3, %index.next.1, !optimi !21
  %15 = getelementptr inbounds double, double* %2, i64 %14, !optimi !7
  %16 = bitcast double* %15 to <2 x double>*, !optimi !7
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %16, align 8, !tbaa !1
  %17 = getelementptr double, double* %15, i64 2, !optimi !7
  %18 = bitcast double* %17 to <2 x double>*, !optimi !7
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %18, align 8, !tbaa !1
  %index.next.2 = or i64 %index, 12, !optimi !22
  %19 = add nuw nsw i64 %3, %index.next.2, !optimi !23
  %20 = getelementptr inbounds double, double* %2, i64 %19, !optimi !7
  %21 = bitcast double* %20 to <2 x double>*, !optimi !7
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %21, align 8, !tbaa !1
  %22 = getelementptr double, double* %20, i64 2, !optimi !7
  %23 = bitcast double* %22 to <2 x double>*, !optimi !7
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %23, align 8, !tbaa !1
  %index.next.3 = add nsw i64 %index, 16, !optimi !15
  %24 = icmp eq i64 %index.next.3, 512, !optimi !5
  br i1 %24, label %for.inc17, label %vector.body, !llvm.loop !24

for.cond20.preheader:                             ; preds = %for.inc17
  store i32 0, i32* %k, align 4, !tbaa !13
  store i32 512, i32* %j, align 4, !tbaa !13
  br label %vector.body173

vector.body173:                                   ; preds = %vector.body173, %for.cond20.preheader
  %index178 = phi i64 [ 0, %for.cond20.preheader ], [ %index.next179.3, %vector.body173 ], !optimi !15
  %25 = getelementptr inbounds double, double* %2, i64 %index178, !optimi !7
  %26 = add nuw nsw i64 %index178, 261632, !optimi !27
  %27 = getelementptr inbounds double, double* %2, i64 %26, !optimi !7
  %28 = bitcast double* %27 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %28, align 8, !tbaa !1
  %29 = getelementptr double, double* %27, i64 2, !optimi !7
  %30 = bitcast double* %29 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %30, align 8, !tbaa !1
  %31 = bitcast double* %25 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %31, align 8, !tbaa !1
  %32 = getelementptr double, double* %25, i64 2, !optimi !7
  %33 = bitcast double* %32 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %33, align 8, !tbaa !1
  %index.next179 = or i64 %index178, 4, !optimi !18
  %34 = getelementptr inbounds double, double* %2, i64 %index.next179, !optimi !7
  %35 = add nsw i64 %index178, 261636, !optimi !28
  %36 = getelementptr inbounds double, double* %2, i64 %35, !optimi !7
  %37 = bitcast double* %36 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %37, align 8, !tbaa !1
  %38 = getelementptr double, double* %36, i64 2, !optimi !7
  %39 = bitcast double* %38 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %39, align 8, !tbaa !1
  %40 = bitcast double* %34 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %40, align 8, !tbaa !1
  %41 = getelementptr double, double* %34, i64 2, !optimi !7
  %42 = bitcast double* %41 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %42, align 8, !tbaa !1
  %index.next179.1 = or i64 %index178, 8, !optimi !20
  %43 = getelementptr inbounds double, double* %2, i64 %index.next179.1, !optimi !7
  %44 = add nsw i64 %index178, 261640, !optimi !29
  %45 = getelementptr inbounds double, double* %2, i64 %44, !optimi !7
  %46 = bitcast double* %45 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %46, align 8, !tbaa !1
  %47 = getelementptr double, double* %45, i64 2, !optimi !7
  %48 = bitcast double* %47 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %48, align 8, !tbaa !1
  %49 = bitcast double* %43 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %49, align 8, !tbaa !1
  %50 = getelementptr double, double* %43, i64 2, !optimi !7
  %51 = bitcast double* %50 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %51, align 8, !tbaa !1
  %index.next179.2 = or i64 %index178, 12, !optimi !22
  %52 = getelementptr inbounds double, double* %2, i64 %index.next179.2, !optimi !7
  %53 = add nsw i64 %index178, 261644, !optimi !30
  %54 = getelementptr inbounds double, double* %2, i64 %53, !optimi !7
  %55 = bitcast double* %54 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %55, align 8, !tbaa !1
  %56 = getelementptr double, double* %54, i64 2, !optimi !7
  %57 = bitcast double* %56 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %57, align 8, !tbaa !1
  %58 = bitcast double* %52 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %58, align 8, !tbaa !1
  %59 = getelementptr double, double* %52, i64 2, !optimi !7
  %60 = bitcast double* %59 to <2 x double>*, !optimi !7
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %60, align 8, !tbaa !1
  %index.next179.3 = add nsw i64 %index178, 16, !optimi !15
  %61 = icmp eq i64 %index.next179.3, 512, !optimi !5
  br i1 %61, label %for.cond32.preheader, label %vector.body173, !llvm.loop !31

for.inc17:                                        ; preds = %vector.body
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1, !optimi !15
  %exitcond171 = icmp eq i64 %indvars.iv.next169, 512, !optimi !5
  br i1 %exitcond171, label %for.cond20.preheader, label %for.cond14.preheader

for.cond32.preheader:                             ; preds = %vector.body173
  store i32 512, i32* %k, align 4, !tbaa !13
  store i32 0, i32* %j, align 4, !tbaa !13
  br label %for.body34

for.cond46.preheader:                             ; preds = %for.body34
  store i32 0, i32* %j, align 4, !tbaa !13
  %62 = load double*, double** %eta.addr, align 8, !tbaa !11, !optimi !7
  %63 = load double*, double** %etan.addr, align 8, !tbaa !11, !optimi !7
  br label %for.cond49.preheader

for.body34:                                       ; preds = %for.body34, %for.cond32.preheader
  %indvars.iv155 = phi i64 [ 0, %for.cond32.preheader ], [ %indvars.iv.next156.3, %for.body34 ], !optimi !15
  %64 = shl nsw i64 %indvars.iv155, 9, !optimi !16
  %arrayidx38 = getelementptr inbounds double, double* %2, i64 %64, !optimi !7
  %65 = or i64 %64, 511, !optimi !32
  %arrayidx42 = getelementptr inbounds double, double* %2, i64 %65, !optimi !7
  store double -1.000000e+01, double* %arrayidx42, align 8, !tbaa !1
  store double -1.000000e+01, double* %arrayidx38, align 8, !tbaa !1
  %indvars.iv.next156 = shl i64 %indvars.iv155, 9, !optimi !16
  %66 = or i64 %indvars.iv.next156, 512, !optimi !33
  %arrayidx38.1 = getelementptr inbounds double, double* %2, i64 %66, !optimi !7
  %67 = or i64 %indvars.iv.next156, 1023, !optimi !34
  %arrayidx42.1 = getelementptr inbounds double, double* %2, i64 %67, !optimi !7
  store double -1.000000e+01, double* %arrayidx42.1, align 8, !tbaa !1
  store double -1.000000e+01, double* %arrayidx38.1, align 8, !tbaa !1
  %indvars.iv.next156.1 = shl i64 %indvars.iv155, 9, !optimi !16
  %68 = or i64 %indvars.iv.next156.1, 1024, !optimi !35
  %arrayidx38.2 = getelementptr inbounds double, double* %2, i64 %68, !optimi !7
  %69 = or i64 %indvars.iv.next156.1, 1535, !optimi !36
  %arrayidx42.2 = getelementptr inbounds double, double* %2, i64 %69, !optimi !7
  store double -1.000000e+01, double* %arrayidx42.2, align 8, !tbaa !1
  store double -1.000000e+01, double* %arrayidx38.2, align 8, !tbaa !1
  %indvars.iv.next156.2 = shl i64 %indvars.iv155, 9, !optimi !16
  %70 = or i64 %indvars.iv.next156.2, 1536, !optimi !37
  %arrayidx38.3 = getelementptr inbounds double, double* %2, i64 %70, !optimi !7
  %71 = or i64 %indvars.iv.next156.2, 2047, !optimi !38
  %arrayidx42.3 = getelementptr inbounds double, double* %2, i64 %71, !optimi !7
  store double -1.000000e+01, double* %arrayidx42.3, align 8, !tbaa !1
  store double -1.000000e+01, double* %arrayidx38.3, align 8, !tbaa !1
  %indvars.iv.next156.3 = add nsw i64 %indvars.iv155, 4, !optimi !15
  %exitcond159.3 = icmp eq i64 %indvars.iv.next156.3, 512, !optimi !5
  br i1 %exitcond159.3, label %for.cond46.preheader, label %for.body34

for.cond49.preheader:                             ; preds = %for.inc67, %for.cond46.preheader
  %indvars.iv151 = phi i64 [ 0, %for.cond46.preheader ], [ %indvars.iv.next152, %for.inc67 ], !optimi !15
  %72 = shl i64 %indvars.iv151, 9, !optimi !16
  %scevgep = getelementptr double, double* %62, i64 %72, !optimi !7
  %73 = add i64 %72, 512, !optimi !39
  %scevgep192 = getelementptr double, double* %62, i64 %73, !optimi !7
  %scevgep194 = getelementptr double, double* %63, i64 %72, !optimi !7
  %scevgep196 = getelementptr double, double* %63, i64 %73, !optimi !7
  %scevgep198 = getelementptr double, double* %2, i64 %72, !optimi !7
  %scevgep200 = getelementptr double, double* %2, i64 %73, !optimi !7
  %74 = shl i64 %indvars.iv151, 9, !optimi !16
  %bound0 = icmp ult double* %scevgep, %scevgep196, !optimi !5
  %bound1 = icmp ult double* %scevgep194, %scevgep192, !optimi !5
  %found.conflict = and i1 %bound0, %bound1, !optimi !5
  %bound0202 = icmp ult double* %scevgep, %scevgep200, !optimi !5
  %bound1203 = icmp ult double* %scevgep198, %scevgep192, !optimi !5
  %found.conflict204 = and i1 %bound0202, %bound1203, !optimi !5
  %conflict.rdx = or i1 %found.conflict, %found.conflict204, !optimi !5
  %bound0205 = icmp ult double* %scevgep194, %scevgep200, !optimi !5
  %bound1206 = icmp ult double* %scevgep198, %scevgep196, !optimi !5
  %found.conflict207 = and i1 %bound0205, %bound1206, !optimi !5
  %conflict.rdx208 = or i1 %conflict.rdx, %found.conflict207, !optimi !5
  br i1 %conflict.rdx208, label %for.body51.preheader, label %vector.body186.preheader

vector.body186.preheader:                         ; preds = %for.cond49.preheader
  br label %vector.body186

for.body51.preheader:                             ; preds = %for.cond49.preheader
  br label %for.body51

vector.body186:                                   ; preds = %vector.body186.preheader, %vector.body186
  %index210 = phi i64 [ %index.next211, %vector.body186 ], [ 0, %vector.body186.preheader ], !optimi !15
  %75 = add nuw nsw i64 %74, %index210, !optimi !17
  %76 = getelementptr inbounds double, double* %62, i64 %75, !optimi !7
  %77 = getelementptr inbounds double, double* %2, i64 %75, !optimi !7
  %78 = bitcast double* %77 to <2 x double>*, !optimi !7
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !tbaa !1, !alias.scope !40, !optimi !7
  %79 = getelementptr double, double* %77, i64 2, !optimi !7
  %80 = bitcast double* %79 to <2 x double>*, !optimi !7
  %wide.load218 = load <2 x double>, <2 x double>* %80, align 8, !tbaa !1, !alias.scope !40, !optimi !7
  %81 = getelementptr inbounds double, double* %63, i64 %75, !optimi !7
  %82 = fcmp ogt <2 x double> %wide.load, zeroinitializer, !optimi !5
  %83 = fcmp ogt <2 x double> %wide.load218, zeroinitializer, !optimi !5
  %84 = select <2 x i1> %82, <2 x double> zeroinitializer, <2 x double> %wide.load, !optimi !6
  %85 = select <2 x i1> %83, <2 x double> zeroinitializer, <2 x double> %wide.load218, !optimi !6
  %86 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %84, !optimi !7
  %87 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %85, !optimi !7
  %88 = bitcast double* %76 to <2 x double>*, !optimi !7
  store <2 x double> %86, <2 x double>* %88, align 8, !tbaa !1, !alias.scope !43, !noalias !45
  %89 = getelementptr double, double* %76, i64 2, !optimi !7
  %90 = bitcast double* %89 to <2 x double>*, !optimi !7
  store <2 x double> %87, <2 x double>* %90, align 8, !tbaa !1, !alias.scope !43, !noalias !45
  %91 = bitcast double* %81 to <2 x double>*, !optimi !7
  store <2 x double> %86, <2 x double>* %91, align 8, !tbaa !1, !alias.scope !47, !noalias !40
  %92 = getelementptr double, double* %81, i64 2, !optimi !7
  %93 = bitcast double* %92 to <2 x double>*, !optimi !7
  store <2 x double> %87, <2 x double>* %93, align 8, !tbaa !1, !alias.scope !47, !noalias !40
  %index.next211 = add i64 %index210, 4, !optimi !15
  %94 = icmp eq i64 %index.next211, 512, !optimi !5
  br i1 %94, label %for.inc67.loopexit219, label %vector.body186, !llvm.loop !48

for.cond70.preheader:                             ; preds = %for.inc67
  store i32 512, i32* %k, align 4, !tbaa !13
  store i32 0, i32* %j, align 4, !tbaa !13
  %95 = load double*, double** %h.addr, align 8, !tbaa !11, !optimi !7
  %96 = load double*, double** %wet.addr, align 8, !tbaa !11, !optimi !5
  %97 = load double*, double** %u.addr, align 8, !tbaa !11, !optimi !8
  %98 = load double*, double** %un.addr, align 8, !tbaa !11, !optimi !8
  %99 = load double*, double** %v.addr, align 8, !tbaa !11, !optimi !8
  %100 = load double*, double** %vn.addr, align 8, !tbaa !11, !optimi !8
  br label %for.cond73.preheader

for.body51:                                       ; preds = %for.body51, %for.body51.preheader
  %indvars.iv147 = phi i64 [ 0, %for.body51.preheader ], [ %indvars.iv.next148.1, %for.body51 ], !optimi !15
  %101 = add nuw nsw i64 %74, %indvars.iv147, !optimi !17
  %arrayidx55 = getelementptr inbounds double, double* %62, i64 %101, !optimi !7
  %arrayidx59 = getelementptr inbounds double, double* %2, i64 %101, !optimi !7
  %102 = load double, double* %arrayidx59, align 8, !tbaa !1, !optimi !7
  %arrayidx63 = getelementptr inbounds double, double* %63, i64 %101, !optimi !7
  %cmp.i121 = fcmp ogt double %102, 0.000000e+00, !optimi !5
  %cond.i = select i1 %cmp.i121, double 0.000000e+00, double %102, !optimi !7
  %sub.i = fsub double -0.000000e+00, %cond.i, !optimi !49
  store double %sub.i, double* %arrayidx55, align 8, !tbaa !1
  store double %sub.i, double* %arrayidx63, align 8, !tbaa !1
  %indvars.iv.next148 = or i64 %indvars.iv147, 1, !optimi !50
  %103 = add nuw nsw i64 %74, %indvars.iv.next148, !optimi !51
  %arrayidx55.1 = getelementptr inbounds double, double* %62, i64 %103, !optimi !7
  %arrayidx59.1 = getelementptr inbounds double, double* %2, i64 %103, !optimi !7
  %104 = load double, double* %arrayidx59.1, align 8, !tbaa !1, !optimi !7
  %arrayidx63.1 = getelementptr inbounds double, double* %63, i64 %103, !optimi !7
  %cmp.i121.1 = fcmp ogt double %104, 0.000000e+00, !optimi !5
  %cond.i.1 = select i1 %cmp.i121.1, double 0.000000e+00, double %104, !optimi !7
  %sub.i.1 = fsub double -0.000000e+00, %cond.i.1, !optimi !49
  store double %sub.i.1, double* %arrayidx55.1, align 8, !tbaa !1
  store double %sub.i.1, double* %arrayidx63.1, align 8, !tbaa !1
  %indvars.iv.next148.1 = add nsw i64 %indvars.iv147, 2, !optimi !15
  %exitcond150.1 = icmp eq i64 %indvars.iv.next148.1, 512, !optimi !5
  br i1 %exitcond150.1, label %for.inc67.loopexit, label %for.body51, !llvm.loop !52

for.inc67.loopexit:                               ; preds = %for.body51
  br label %for.inc67

for.inc67.loopexit219:                            ; preds = %vector.body186
  br label %for.inc67

for.inc67:                                        ; preds = %for.inc67.loopexit219, %for.inc67.loopexit
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1, !optimi !15
  %exitcond154 = icmp eq i64 %indvars.iv.next152, 512, !optimi !5
  br i1 %exitcond154, label %for.cond70.preheader, label %for.cond49.preheader

for.cond73.preheader:                             ; preds = %for.cond70.preheader, %for.inc111
  %indvars.iv145 = phi i64 [ 0, %for.cond70.preheader ], [ %indvars.iv.next146, %for.inc111 ], !optimi !6
  %105 = phi i32 [ 0, %for.cond70.preheader ], [ %inc112, %for.inc111 ], !optimi !10
  %106 = trunc i64 %indvars.iv145 to i32, !optimi !6
  %mul76 = shl i32 %106, 9, !optimi !6
  %107 = sext i32 %mul76 to i64, !optimi !6
  br label %for.body75

for.body75:                                       ; preds = %sw2d_init_data_host_finalLoop.exit, %for.cond73.preheader
  %indvars.iv = phi i64 [ 0, %for.cond73.preheader ], [ %indvars.iv.next, %sw2d_init_data_host_finalLoop.exit ], !optimi !15
  %108 = add nsw i64 %107, %indvars.iv
  %arrayidx79 = getelementptr inbounds double, double* %95, i64 %108, !optimi !7
  %arrayidx83 = getelementptr inbounds double, double* %2, i64 %108, !optimi !7
  %109 = load double, double* %arrayidx83, align 8, !tbaa !1, !optimi !7
  %arrayidx87 = getelementptr inbounds double, double* %62, i64 %108, !optimi !7
  %110 = load double, double* %arrayidx87, align 8, !tbaa !1, !optimi !7
  %arrayidx91 = getelementptr inbounds double, double* %96, i64 %108, !optimi !5
  %111 = load double, double* %hmin.addr, align 8, !tbaa !1, !optimi !7
  %arrayidx95 = getelementptr inbounds double, double* %97, i64 %108, !optimi !8
  %arrayidx99 = getelementptr inbounds double, double* %98, i64 %108, !optimi !8
  %arrayidx103 = getelementptr inbounds double, double* %99, i64 %108, !optimi !8
  %arrayidx107 = getelementptr inbounds double, double* %100, i64 %108, !optimi !8
  %add.i = fadd double %109, %110, !optimi !53
  store double %add.i, double* %arrayidx79, align 8, !tbaa !1
  store double 1.000000e+00, double* %arrayidx91, align 8, !tbaa !1
  %112 = load double, double* %arrayidx79, align 8, !tbaa !1, !optimi !7
  %cmp.i = fcmp olt double %112, %111, !optimi !5
  br i1 %cmp.i, label %if.then.i, label %sw2d_init_data_host_finalLoop.exit

if.then.i:                                        ; preds = %for.body75
  store double 0.000000e+00, double* %arrayidx91, align 8, !tbaa !1
  br label %sw2d_init_data_host_finalLoop.exit

sw2d_init_data_host_finalLoop.exit:               ; preds = %for.body75, %if.then.i
  store double 0.000000e+00, double* %arrayidx107, align 8, !tbaa !1
  store double 0.000000e+00, double* %arrayidx103, align 8, !tbaa !1
  store double 0.000000e+00, double* %arrayidx99, align 8, !tbaa !1
  store double 0.000000e+00, double* %arrayidx95, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !15
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !optimi !5
  br i1 %exitcond, label %for.inc111, label %for.body75

for.inc111:                                       ; preds = %sw2d_init_data_host_finalLoop.exit
  %inc112 = add nsw i32 %105, 1, !optimi !10
  %cmp71 = icmp slt i32 %inc112, 512, !optimi !5
  %indvars.iv.next146 = add nsw i64 %indvars.iv145, 1, !optimi !6
  br i1 %cmp71, label %for.cond73.preheader, label %for.end113

for.end113:                                       ; preds = %for.inc111
  store i32 512, i32* %k, align 4, !tbaa !13
  store i32 %inc112, i32* %j, align 4, !tbaa !13
  %puts = call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str, i64 0, i64 0)), !optimi !6
  %puts118 = call i32 @puts(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @str.12, i64 0, i64 0)), !optimi !6
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #2
  call void @llvm.lifetime.end(i64 4, i8* nonnull %0) #2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host_firstLoop(double* %du, double* %dv, double %dt, double %g, double %eta_jCOLS_k_1, double %eta_jCOLS_k, double %eta_j1COLS_k, double %dx, double %dy) local_unnamed_addr #1 {
entry:
  %du.addr = alloca double*, align 8, !optimi !54
  %dv.addr = alloca double*, align 8, !optimi !54
  %dt.addr = alloca double, align 8, !optimi !55
  %g.addr = alloca double, align 8, !optimi !56
  %eta_jCOLS_k_1.addr = alloca double, align 8, !optimi !7
  %eta_jCOLS_k.addr = alloca double, align 8, !optimi !7
  %eta_j1COLS_k.addr = alloca double, align 8, !optimi !7
  %dx.addr = alloca double, align 8, !optimi !55
  %dy.addr = alloca double, align 8, !optimi !55
  store double* %du, double** %du.addr, align 8, !tbaa !11
  %du.addr1 = bitcast double** %du.addr to i8*, !optimi !54
  call void @llvm.var.annotation(i8* nonnull %du.addr1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 142)
  store double* %dv, double** %dv.addr, align 8, !tbaa !11
  %dv.addr2 = bitcast double** %dv.addr to i8*, !optimi !54
  call void @llvm.var.annotation(i8* nonnull %dv.addr2, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 143)
  store double %dt, double* %dt.addr, align 8, !tbaa !1
  %dt.addr3 = bitcast double* %dt.addr to i8*, !optimi !55
  call void @llvm.var.annotation(i8* nonnull %dt.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 144)
  store double %g, double* %g.addr, align 8, !tbaa !1
  %g.addr4 = bitcast double* %g.addr to i8*, !optimi !56
  call void @llvm.var.annotation(i8* nonnull %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 145)
  store double %eta_jCOLS_k_1, double* %eta_jCOLS_k_1.addr, align 8, !tbaa !1
  %eta_jCOLS_k_1.addr5 = bitcast double* %eta_jCOLS_k_1.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %eta_jCOLS_k_1.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 146)
  store double %eta_jCOLS_k, double* %eta_jCOLS_k.addr, align 8, !tbaa !1
  %eta_jCOLS_k.addr6 = bitcast double* %eta_jCOLS_k.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %eta_jCOLS_k.addr6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 147)
  store double %eta_j1COLS_k, double* %eta_j1COLS_k.addr, align 8, !tbaa !1
  %eta_j1COLS_k.addr7 = bitcast double* %eta_j1COLS_k.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %eta_j1COLS_k.addr7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 148)
  store double %dx, double* %dx.addr, align 8, !tbaa !1
  %dx.addr8 = bitcast double* %dx.addr to i8*, !optimi !55
  call void @llvm.var.annotation(i8* nonnull %dx.addr8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 149)
  store double %dy, double* %dy.addr, align 8, !tbaa !1
  %dy.addr9 = bitcast double* %dy.addr to i8*, !optimi !55
  call void @llvm.var.annotation(i8* nonnull %dy.addr9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 150)
  %0 = load double, double* %dt.addr, align 8, !tbaa !1, !optimi !55
  %1 = load double, double* %g.addr, align 8, !tbaa !1, !optimi !56
  %2 = fmul double %0, %1, !optimi !57
  %3 = load double, double* %eta_jCOLS_k_1.addr, align 8, !tbaa !1, !optimi !7
  %4 = load double, double* %eta_jCOLS_k.addr, align 8, !tbaa !1, !optimi !7
  %sub10 = fsub double %3, %4, !optimi !58
  %5 = fmul double %2, %sub10, !optimi !59
  %mul11 = fsub double -0.000000e+00, %5, !optimi !59
  %6 = load double, double* %dx.addr, align 8, !tbaa !1, !optimi !55
  %div = fdiv double %mul11, %6, !optimi !54
  %7 = load double*, double** %du.addr, align 8, !tbaa !11, !optimi !54
  store double %div, double* %7, align 8, !tbaa !1
  %8 = load double, double* %dt.addr, align 8, !tbaa !1, !optimi !55
  %9 = load double, double* %g.addr, align 8, !tbaa !1, !optimi !56
  %10 = fmul double %8, %9, !optimi !57
  %11 = load double, double* %eta_j1COLS_k.addr, align 8, !tbaa !1, !optimi !7
  %12 = load double, double* %eta_jCOLS_k.addr, align 8, !tbaa !1, !optimi !7
  %sub14 = fsub double %11, %12, !optimi !58
  %13 = fmul double %10, %sub14, !optimi !59
  %mul15 = fsub double -0.000000e+00, %13, !optimi !59
  %14 = load double, double* %dy.addr, align 8, !tbaa !1, !optimi !55
  %div16 = fdiv double %mul15, %14, !optimi !54
  %15 = load double*, double** %dv.addr, align 8, !tbaa !11, !optimi !54
  store double %div16, double* %15, align 8, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host(double %dt, double %dx, double %dy, double %g, double* %eta, double* %un, double* %u, double* %wet, double* %v, double* %vn, double* %h, double* %etan, i32 %BytesPerWord) local_unnamed_addr #1 {
entry:
  %du.addr.i = alloca double*, align 8, !optimi !54
  %dv.addr.i = alloca double*, align 8, !optimi !54
  %dt.addr.i = alloca double, align 8, !optimi !55
  %g.addr.i = alloca double, align 8, !optimi !56
  %eta_jCOLS_k_1.addr.i = alloca double, align 8, !optimi !7
  %eta_jCOLS_k.addr.i = alloca double, align 8, !optimi !7
  %eta_j1COLS_k.addr.i = alloca double, align 8, !optimi !7
  %dx.addr.i = alloca double, align 8, !optimi !55
  %dy.addr.i = alloca double, align 8, !optimi !55
  %dt.addr = alloca double, align 8, !optimi !55
  %dx.addr = alloca double, align 8, !optimi !55
  %dy.addr = alloca double, align 8, !optimi !55
  %g.addr = alloca double, align 8, !optimi !56
  %eta.addr = alloca double*, align 8, !optimi !7
  %un.addr = alloca double*, align 8, !optimi !8
  %u.addr = alloca double*, align 8, !optimi !8
  %wet.addr = alloca double*, align 8, !optimi !5
  %v.addr = alloca double*, align 8, !optimi !8
  %vn.addr = alloca double*, align 8, !optimi !8
  %h.addr = alloca double*, align 8, !optimi !7
  %etan.addr = alloca double*, align 8, !optimi !7
  %BytesPerWord.addr = alloca i32, align 4, !optimi !9
  %du = alloca double*, align 8, !optimi !54
  %dv = alloca double*, align 8, !optimi !54
  store double %dt, double* %dt.addr, align 8, !tbaa !1
  %dt.addr1 = bitcast double* %dt.addr to i8*, !optimi !55
  call void @llvm.var.annotation(i8* nonnull %dt.addr1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 157)
  store double %dx, double* %dx.addr, align 8, !tbaa !1
  %dx.addr2 = bitcast double* %dx.addr to i8*, !optimi !55
  call void @llvm.var.annotation(i8* nonnull %dx.addr2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 158)
  store double %dy, double* %dy.addr, align 8, !tbaa !1
  %dy.addr3 = bitcast double* %dy.addr to i8*, !optimi !55
  call void @llvm.var.annotation(i8* nonnull %dy.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 159)
  store double %g, double* %g.addr, align 8, !tbaa !1
  %g.addr4 = bitcast double* %g.addr to i8*, !optimi !56
  call void @llvm.var.annotation(i8* nonnull %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 160)
  store double* %eta, double** %eta.addr, align 8, !tbaa !11
  %eta.addr5 = bitcast double** %eta.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %eta.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 161)
  store double* %un, double** %un.addr, align 8, !tbaa !11
  %un.addr6 = bitcast double** %un.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %un.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 162)
  store double* %u, double** %u.addr, align 8, !tbaa !11
  %u.addr7 = bitcast double** %u.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %u.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 163)
  store double* %wet, double** %wet.addr, align 8, !tbaa !11
  %wet.addr8 = bitcast double** %wet.addr to i8*, !optimi !5
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 164)
  store double* %v, double** %v.addr, align 8, !tbaa !11
  %v.addr9 = bitcast double** %v.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %v.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 165)
  store double* %vn, double** %vn.addr, align 8, !tbaa !11
  %vn.addr10 = bitcast double** %vn.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %vn.addr10, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 166)
  store double* %h, double** %h.addr, align 8, !tbaa !11
  %h.addr11 = bitcast double** %h.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %h.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 167)
  store double* %etan, double** %etan.addr, align 8, !tbaa !11
  %etan.addr12 = bitcast double** %etan.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %etan.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 168)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !13
  %BytesPerWord.addr13 = bitcast i32* %BytesPerWord.addr to i8*, !optimi !9
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 169)
  %0 = bitcast double** %du to i8*, !optimi !54
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #2
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 174)
  %1 = bitcast double** %dv to i8*, !optimi !54
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #2
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 175)
  %2 = bitcast double** %du to i8**, !optimi !54
  %3 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !13, !optimi !9
  %mul = shl nsw i32 %3, 18, !optimi !60
  %conv = sext i32 %mul to i64, !optimi !60
  %call = call i32 @posix_memalign(i8** nonnull %2, i64 64, i64 %conv) #2, !optimi !61
  %4 = bitcast double** %dv to i8**, !optimi !54
  %5 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !13, !optimi !9
  %mul16 = shl nsw i32 %5, 18, !optimi !60
  %conv17 = sext i32 %mul16 to i64, !optimi !60
  %call18 = call i32 @posix_memalign(i8** nonnull %4, i64 64, i64 %conv17) #2, !optimi !61
  %6 = bitcast double* %dt.addr to i64*, !optimi !55
  %7 = bitcast double* %g.addr to i64*, !optimi !56
  %8 = bitcast double* %dx.addr to i64*, !optimi !55
  %9 = bitcast double* %dy.addr to i64*, !optimi !55
  %10 = bitcast double** %du.addr.i to i8*, !optimi !54
  %11 = bitcast double** %dv.addr.i to i8*, !optimi !54
  %12 = bitcast double* %dt.addr.i to i8*, !optimi !55
  %13 = bitcast double* %g.addr.i to i8*, !optimi !56
  %14 = bitcast double* %eta_jCOLS_k_1.addr.i to i8*, !optimi !7
  %15 = bitcast double* %eta_jCOLS_k.addr.i to i8*, !optimi !7
  %16 = bitcast double* %eta_j1COLS_k.addr.i to i8*, !optimi !7
  %17 = bitcast double* %dx.addr.i to i8*, !optimi !55
  %18 = bitcast double* %dy.addr.i to i8*, !optimi !55
  %19 = bitcast double* %dt.addr.i to i64*, !optimi !55
  %20 = bitcast double* %g.addr.i to i64*, !optimi !56
  %21 = bitcast double* %eta_jCOLS_k_1.addr.i to i64*, !optimi !7
  %22 = bitcast double* %eta_jCOLS_k.addr.i to i64*, !optimi !7
  %23 = bitcast double* %eta_j1COLS_k.addr.i to i64*, !optimi !7
  %24 = bitcast double* %dx.addr.i to i64*, !optimi !55
  %25 = bitcast double* %dy.addr.i to i64*, !optimi !55
  br label %for.cond20.preheader

for.cond.loopexit:                                ; preds = %for.body23
  %exitcond634 = icmp eq i64 %indvars.iv.next631, 511, !optimi !5
  br i1 %exitcond634, label %for.cond46.preheader, label %for.cond20.preheader

for.cond20.preheader:                             ; preds = %for.cond.loopexit, %entry
  %indvars.iv630 = phi i64 [ 1, %entry ], [ %indvars.iv.next631, %for.cond.loopexit ], !optimi !62
  %indvars.iv.next631 = add nuw nsw i64 %indvars.iv630, 1, !optimi !62
  %26 = shl nsw i64 %indvars.iv630, 9, !optimi !63
  %27 = shl i64 %indvars.iv.next631, 9, !optimi !63
  br label %for.body23

for.cond46.preheader:                             ; preds = %for.cond.loopexit
  %28 = load double*, double** %un.addr, align 8, !tbaa !11, !optimi !8
  %29 = load double*, double** %u.addr, align 8, !tbaa !11, !optimi !8
  %30 = load double*, double** %du, align 8, !tbaa !11, !optimi !54
  %31 = load double*, double** %wet.addr, align 8, !tbaa !11, !optimi !5
  %32 = load double*, double** %vn.addr, align 8, !tbaa !11, !optimi !8
  %33 = load double*, double** %v.addr, align 8, !tbaa !11, !optimi !8
  %34 = load double*, double** %dv, align 8, !tbaa !11, !optimi !54
  br label %for.cond50.preheader

for.body23:                                       ; preds = %for.body23, %for.cond20.preheader
  %indvars.iv624 = phi i64 [ 1, %for.cond20.preheader ], [ %indvars.iv.next625, %for.body23 ], !optimi !62
  %35 = load double*, double** %du, align 8, !tbaa !11, !optimi !54
  %36 = add nuw nsw i64 %indvars.iv624, %26, !optimi !16
  %arrayidx = getelementptr inbounds double, double* %35, i64 %36, !optimi !54
  %37 = load double*, double** %dv, align 8, !tbaa !11, !optimi !54
  %arrayidx28 = getelementptr inbounds double, double* %37, i64 %36, !optimi !54
  %38 = load i64, i64* %6, align 8, !tbaa !1, !optimi !55
  %39 = load i64, i64* %7, align 8, !tbaa !1, !optimi !56
  %40 = load double*, double** %eta.addr, align 8, !tbaa !11, !optimi !7
  %41 = add nuw nsw i64 %36, 1, !optimi !64
  %arrayidx33 = getelementptr inbounds double, double* %40, i64 %41, !optimi !7
  %42 = bitcast double* %arrayidx33 to i64*, !optimi !7
  %43 = load i64, i64* %42, align 8, !tbaa !1, !optimi !7
  %arrayidx37 = getelementptr inbounds double, double* %40, i64 %36, !optimi !7
  %44 = bitcast double* %arrayidx37 to i64*, !optimi !7
  %45 = load i64, i64* %44, align 8, !tbaa !1, !optimi !7
  %46 = add nuw nsw i64 %indvars.iv624, %27, !optimi !16
  %arrayidx42 = getelementptr inbounds double, double* %40, i64 %46, !optimi !7
  %47 = bitcast double* %arrayidx42 to i64*, !optimi !7
  %48 = load i64, i64* %47, align 8, !tbaa !1, !optimi !7
  %49 = load i64, i64* %8, align 8, !tbaa !1, !optimi !55
  %50 = load i64, i64* %9, align 8, !tbaa !1, !optimi !55
  call void @llvm.lifetime.start(i64 8, i8* nonnull %10)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %11)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %12)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %13)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %14)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %15)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %16)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %17)
  call void @llvm.lifetime.start(i64 8, i8* nonnull %18)
  store double* %arrayidx, double** %du.addr.i, align 8, !tbaa !11
  call void @llvm.var.annotation(i8* nonnull %10, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 142) #2
  store double* %arrayidx28, double** %dv.addr.i, align 8, !tbaa !11
  call void @llvm.var.annotation(i8* nonnull %11, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 143) #2
  store i64 %38, i64* %19, align 8, !tbaa !1
  call void @llvm.var.annotation(i8* nonnull %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 144) #2
  store i64 %39, i64* %20, align 8, !tbaa !1
  call void @llvm.var.annotation(i8* nonnull %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 145) #2
  store i64 %43, i64* %21, align 8, !tbaa !1
  call void @llvm.var.annotation(i8* nonnull %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 146) #2
  store i64 %45, i64* %22, align 8, !tbaa !1
  call void @llvm.var.annotation(i8* nonnull %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 147) #2
  store i64 %48, i64* %23, align 8, !tbaa !1
  call void @llvm.var.annotation(i8* nonnull %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 148) #2
  store i64 %49, i64* %24, align 8, !tbaa !1
  call void @llvm.var.annotation(i8* nonnull %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 149) #2
  store i64 %50, i64* %25, align 8, !tbaa !1
  call void @llvm.var.annotation(i8* nonnull %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 150) #2
  %51 = load double, double* %dt.addr.i, align 8, !tbaa !1, !optimi !55
  %52 = load double, double* %g.addr.i, align 8, !tbaa !1, !optimi !56
  %53 = fmul double %51, %52, !optimi !57
  %54 = load double, double* %eta_jCOLS_k_1.addr.i, align 8, !tbaa !1, !optimi !7
  %55 = load double, double* %eta_jCOLS_k.addr.i, align 8, !tbaa !1, !optimi !7
  %sub10.i = fsub double %54, %55, !optimi !58
  %56 = fmul double %53, %sub10.i, !optimi !59
  %mul11.i = fsub double -0.000000e+00, %56, !optimi !59
  %57 = load double, double* %dx.addr.i, align 8, !tbaa !1, !optimi !55
  %div.i = fdiv double %mul11.i, %57, !optimi !54
  %58 = load double*, double** %du.addr.i, align 8, !tbaa !11, !optimi !54
  store double %div.i, double* %58, align 8, !tbaa !1
  %59 = load double, double* %dt.addr.i, align 8, !tbaa !1, !optimi !55
  %60 = load double, double* %g.addr.i, align 8, !tbaa !1, !optimi !56
  %61 = fmul double %59, %60, !optimi !57
  %62 = load double, double* %eta_j1COLS_k.addr.i, align 8, !tbaa !1, !optimi !7
  %63 = load double, double* %eta_jCOLS_k.addr.i, align 8, !tbaa !1, !optimi !7
  %sub14.i = fsub double %62, %63, !optimi !58
  %64 = fmul double %61, %sub14.i, !optimi !59
  %mul15.i = fsub double -0.000000e+00, %64, !optimi !59
  %65 = load double, double* %dy.addr.i, align 8, !tbaa !1, !optimi !55
  %div16.i = fdiv double %mul15.i, %65, !optimi !54
  %66 = load double*, double** %dv.addr.i, align 8, !tbaa !11, !optimi !54
  store double %div16.i, double* %66, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %10)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %11)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %12)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %13)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %14)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %15)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %16)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %17)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %18)
  %indvars.iv.next625 = add nuw nsw i64 %indvars.iv624, 1, !optimi !62
  %exitcond629 = icmp eq i64 %indvars.iv.next625, 511, !optimi !5
  br i1 %exitcond629, label %for.cond.loopexit, label %for.body23

for.cond50.preheader:                             ; preds = %for.inc162, %for.cond46.preheader
  %indvars.iv620 = phi i64 [ 1, %for.cond46.preheader ], [ %indvars.iv.next621, %for.inc162 ], !optimi !62
  %67 = shl nsw i64 %indvars.iv620, 9, !optimi !63
  br label %for.body53

for.cond165.preheader:                            ; preds = %for.inc162
  %68 = load double*, double** %h.addr, align 8, !tbaa !11, !optimi !7
  %69 = load double*, double** %eta.addr, align 8, !tbaa !11, !optimi !7
  %70 = load double*, double** %etan.addr, align 8, !tbaa !11, !optimi !7
  br label %for.cond169.preheader

for.body53:                                       ; preds = %for.inc159, %for.cond50.preheader
  %indvars.iv613 = phi i64 [ 1, %for.cond50.preheader ], [ %indvars.iv.next614, %for.inc159 ], !optimi !62
  %71 = add nuw nsw i64 %indvars.iv613, %67, !optimi !16
  %arrayidx57 = getelementptr inbounds double, double* %28, i64 %71, !optimi !8
  store double 0.000000e+00, double* %arrayidx57, align 8, !tbaa !1
  %arrayidx61 = getelementptr inbounds double, double* %29, i64 %71, !optimi !8
  %72 = load double, double* %arrayidx61, align 8, !tbaa !1, !optimi !8
  %arrayidx65 = getelementptr inbounds double, double* %30, i64 %71, !optimi !54
  %73 = load double, double* %arrayidx65, align 8, !tbaa !1, !optimi !54
  %arrayidx69 = getelementptr inbounds double, double* %31, i64 %71, !optimi !5
  %74 = load double, double* %arrayidx69, align 8, !tbaa !1, !optimi !5
  %cmp70 = fcmp oeq double %74, 1.000000e+00, !optimi !5
  %75 = add nuw nsw i64 %71, 1, !optimi !64
  %arrayidx76 = getelementptr inbounds double, double* %31, i64 %75, !optimi !5
  %76 = load double, double* %arrayidx76, align 8, !tbaa !1, !optimi !5
  %cmp77 = fcmp oeq double %76, 1.000000e+00, !optimi !5
  br i1 %cmp70, label %if.then, label %if.else

if.then:                                          ; preds = %for.body53
  %cmp79 = fcmp ogt double %73, 0.000000e+00, !optimi !5
  %or.cond = or i1 %cmp79, %cmp77, !optimi !5
  br i1 %or.cond, label %if.then81, label %if.end103

if.then81:                                        ; preds = %if.then
  %add82 = fadd double %72, %73, !optimi !65
  store double %add82, double* %arrayidx57, align 8, !tbaa !1
  br label %if.end103

if.else:                                          ; preds = %for.body53
  %cmp94 = fcmp olt double %73, 0.000000e+00, !optimi !5
  %or.cond453 = and i1 %cmp94, %cmp77, !optimi !5
  br i1 %or.cond453, label %if.then96, label %if.end103

if.then96:                                        ; preds = %if.else
  %add97 = fadd double %72, %73, !optimi !65
  store double %add97, double* %arrayidx57, align 8, !tbaa !1
  br label %if.end103

if.end103:                                        ; preds = %if.else, %if.then96, %if.then81, %if.then
  %arrayidx107 = getelementptr inbounds double, double* %32, i64 %71, !optimi !8
  store double 0.000000e+00, double* %arrayidx107, align 8, !tbaa !1
  %arrayidx111 = getelementptr inbounds double, double* %33, i64 %71, !optimi !8
  %77 = load double, double* %arrayidx111, align 8, !tbaa !1, !optimi !8
  %arrayidx115 = getelementptr inbounds double, double* %34, i64 %71, !optimi !54
  %78 = load double, double* %arrayidx115, align 8, !tbaa !1, !optimi !54
  %79 = load double, double* %arrayidx69, align 8, !tbaa !1, !optimi !5
  %cmp120 = fcmp oeq double %79, 1.000000e+00, !optimi !5
  %80 = load double, double* %arrayidx76, align 8, !tbaa !1, !optimi !5
  %cmp128 = fcmp oeq double %80, 1.000000e+00, !optimi !5
  br i1 %cmp120, label %if.then122, label %if.else140

if.then122:                                       ; preds = %if.end103
  %cmp131 = fcmp ogt double %78, 0.000000e+00, !optimi !5
  %or.cond454 = or i1 %cmp131, %cmp128, !optimi !5
  br i1 %or.cond454, label %if.then133, label %for.inc159

if.then133:                                       ; preds = %if.then122
  %add134 = fadd double %77, %78, !optimi !65
  store double %add134, double* %arrayidx107, align 8, !tbaa !1
  br label %for.inc159

if.else140:                                       ; preds = %if.end103
  %cmp149 = fcmp olt double %78, 0.000000e+00, !optimi !5
  %or.cond455 = and i1 %cmp149, %cmp128, !optimi !5
  br i1 %or.cond455, label %if.then151, label %for.inc159

if.then151:                                       ; preds = %if.else140
  %add152 = fadd double %77, %78, !optimi !65
  store double %add152, double* %arrayidx107, align 8, !tbaa !1
  br label %for.inc159

for.inc159:                                       ; preds = %if.then122, %if.then133, %if.then151, %if.else140
  %indvars.iv.next614 = add nuw nsw i64 %indvars.iv613, 1, !optimi !62
  %exitcond617 = icmp eq i64 %indvars.iv.next614, 511, !optimi !5
  br i1 %exitcond617, label %for.inc162, label %for.body53

for.inc162:                                       ; preds = %for.inc159
  %indvars.iv.next621 = add nuw nsw i64 %indvars.iv620, 1, !optimi !62
  %exitcond623 = icmp eq i64 %indvars.iv.next621, 511, !optimi !5
  br i1 %exitcond623, label %for.cond165.preheader, label %for.cond50.preheader

for.cond165.loopexit.loopexit:                    ; preds = %for.body172
  br label %for.cond165.loopexit

for.cond165.loopexit.loopexit691:                 ; preds = %vector.body
  br label %for.cond165.loopexit

for.cond165.loopexit:                             ; preds = %for.cond165.loopexit.loopexit691, %for.cond165.loopexit.loopexit
  %exitcond612 = icmp eq i64 %indvars.iv.next608, 511, !optimi !5
  %indvar.next = add i64 %indvar, 1, !optimi !6
  br i1 %exitcond612, label %for.end452, label %for.cond169.preheader

for.cond169.preheader:                            ; preds = %for.cond165.loopexit, %for.cond165.preheader
  %indvar = phi i64 [ %indvar.next, %for.cond165.loopexit ], [ 0, %for.cond165.preheader ], !optimi !6
  %indvars.iv607 = phi i64 [ %indvars.iv.next608, %for.cond165.loopexit ], [ 1, %for.cond165.preheader ], !optimi !62
  %81 = shl i64 %indvar, 9, !optimi !6
  %82 = add i64 %81, 513
  %scevgep = getelementptr double, double* %70, i64 %82, !optimi !7
  %83 = add i64 %81, 1023
  %scevgep636 = getelementptr double, double* %70, i64 %83, !optimi !7
  %84 = add i64 %81, 512
  %scevgep638 = getelementptr double, double* %28, i64 %84, !optimi !8
  %scevgep640 = getelementptr double, double* %28, i64 %83, !optimi !8
  %85 = or i64 %81, 1
  %scevgep642 = getelementptr double, double* %68, i64 %85, !optimi !7
  %86 = add i64 %81, 1535
  %scevgep644 = getelementptr double, double* %68, i64 %86, !optimi !7
  %scevgep646 = getelementptr double, double* %32, i64 %85, !optimi !8
  %scevgep648 = getelementptr double, double* %32, i64 %83, !optimi !8
  %scevgep650 = getelementptr double, double* %69, i64 %82, !optimi !7
  %scevgep652 = getelementptr double, double* %69, i64 %83, !optimi !7
  %indvars.iv.next608 = add nuw nsw i64 %indvars.iv607, 1, !optimi !62
  %87 = shl i64 %indvars.iv607, 9, !optimi !63
  %88 = shl i64 %indvars.iv.next608, 9, !optimi !63
  %89 = add nsw i64 %87, -512, !optimi !66
  %bound0 = icmp ult double* %scevgep, %scevgep640, !optimi !5
  %bound1 = icmp ult double* %scevgep638, %scevgep636, !optimi !5
  %found.conflict = and i1 %bound0, %bound1, !optimi !5
  %bound0654 = icmp ult double* %scevgep, %scevgep644, !optimi !5
  %bound1655 = icmp ult double* %scevgep642, %scevgep636, !optimi !5
  %found.conflict656 = and i1 %bound0654, %bound1655, !optimi !5
  %conflict.rdx = or i1 %found.conflict, %found.conflict656, !optimi !5
  %bound0657 = icmp ult double* %scevgep, %scevgep648, !optimi !5
  %bound1658 = icmp ult double* %scevgep646, %scevgep636, !optimi !5
  %found.conflict659 = and i1 %bound0657, %bound1658, !optimi !5
  %conflict.rdx660 = or i1 %conflict.rdx, %found.conflict659, !optimi !5
  %bound0661 = icmp ult double* %scevgep, %scevgep652, !optimi !5
  %bound1662 = icmp ult double* %scevgep650, %scevgep636, !optimi !5
  %found.conflict663 = and i1 %bound0661, %bound1662, !optimi !5
  %conflict.rdx664 = or i1 %conflict.rdx660, %found.conflict663, !optimi !5
  %bound0666 = icmp ult double* %scevgep, %dt.addr, !optimi !5
  %bound1667 = icmp ult double* %dt.addr, %scevgep636, !optimi !5
  %found.conflict668 = and i1 %bound0666, %bound1667, !optimi !5
  %conflict.rdx669 = or i1 %conflict.rdx664, %found.conflict668, !optimi !5
  %bound0672 = icmp ult double* %scevgep, %dx.addr, !optimi !5
  %bound1673 = icmp ult double* %dx.addr, %scevgep636, !optimi !5
  %found.conflict674 = and i1 %bound0672, %bound1673, !optimi !5
  %conflict.rdx675 = or i1 %conflict.rdx669, %found.conflict674, !optimi !5
  %bound0678 = icmp ult double* %scevgep, %dy.addr, !optimi !5
  %bound1679 = icmp ult double* %dy.addr, %scevgep636, !optimi !5
  %found.conflict680 = and i1 %bound0678, %bound1679, !optimi !5
  %conflict.rdx681 = or i1 %conflict.rdx675, %found.conflict680, !optimi !5
  br i1 %conflict.rdx681, label %for.body172.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond169.preheader
  %90 = load double, double* %dt.addr, align 8, !tbaa !1, !alias.scope !67, !optimi !55
  %91 = insertelement <2 x double> undef, double %90, i32 0
  %92 = insertelement <2 x double> %91, double %90, i32 1, !optimi !6
  %93 = load double, double* %dx.addr, align 8, !tbaa !1, !alias.scope !70, !optimi !55
  %94 = insertelement <2 x double> undef, double %93, i32 0
  %95 = insertelement <2 x double> %94, double %93, i32 1, !optimi !6
  %96 = load double, double* %dy.addr, align 8, !tbaa !1, !alias.scope !72, !optimi !55
  %97 = insertelement <2 x double> undef, double %96, i32 0
  %98 = insertelement <2 x double> %97, double %96, i32 1, !optimi !6
  br label %vector.body

for.body172.preheader:                            ; preds = %for.cond169.preheader
  br label %for.body172

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ], !optimi !74
  %offset.idx = or i64 %index, 1, !optimi !75
  %99 = add nuw nsw i64 %offset.idx, %87, !optimi !76
  %100 = getelementptr inbounds double, double* %28, i64 %99, !optimi !8
  %101 = bitcast double* %100 to <2 x double>*, !optimi !8
  %wide.load = load <2 x double>, <2 x double>* %101, align 8, !tbaa !1, !alias.scope !77, !optimi !8
  %102 = fcmp oge <2 x double> %wide.load, zeroinitializer, !optimi !5
  %103 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %wide.load, !optimi !6
  %104 = select <2 x i1> %102, <2 x double> %wide.load, <2 x double> %103, !optimi !6
  %105 = fadd <2 x double> %wide.load, %104, !optimi !6
  %106 = fmul <2 x double> %105, <double 5.000000e-01, double 5.000000e-01>, !optimi !6
  %107 = getelementptr inbounds double, double* %68, i64 %99, !optimi !7
  %108 = bitcast double* %107 to <2 x double>*, !optimi !7
  %wide.load682 = load <2 x double>, <2 x double>* %108, align 8, !tbaa !1, !alias.scope !79, !optimi !7
  %109 = fmul <2 x double> %wide.load682, %106, !optimi !6
  %110 = fsub <2 x double> %wide.load, %104, !optimi !6
  %111 = fmul <2 x double> %110, <double 5.000000e-01, double 5.000000e-01>, !optimi !6
  %112 = add nuw nsw i64 %99, 1, !optimi !81
  %113 = getelementptr inbounds double, double* %68, i64 %112, !optimi !7
  %114 = bitcast double* %113 to <2 x double>*, !optimi !7
  %wide.load683 = load <2 x double>, <2 x double>* %114, align 8, !tbaa !1, !alias.scope !79, !optimi !7
  %115 = fmul <2 x double> %wide.load683, %111, !optimi !6
  %116 = fadd <2 x double> %109, %115, !optimi !6
  %117 = add nsw i64 %99, -1, !optimi !82
  %118 = getelementptr inbounds double, double* %28, i64 %117, !optimi !8
  %119 = bitcast double* %118 to <2 x double>*, !optimi !8
  %wide.load684 = load <2 x double>, <2 x double>* %119, align 8, !tbaa !1, !alias.scope !77, !optimi !8
  %120 = fcmp oge <2 x double> %wide.load684, zeroinitializer, !optimi !5
  %121 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %wide.load684, !optimi !6
  %122 = select <2 x i1> %120, <2 x double> %wide.load684, <2 x double> %121, !optimi !6
  %123 = fadd <2 x double> %wide.load684, %122, !optimi !6
  %124 = fmul <2 x double> %123, <double 5.000000e-01, double 5.000000e-01>, !optimi !6
  %125 = getelementptr inbounds double, double* %68, i64 %117, !optimi !7
  %126 = bitcast double* %125 to <2 x double>*, !optimi !7
  %wide.load685 = load <2 x double>, <2 x double>* %126, align 8, !tbaa !1, !alias.scope !79, !optimi !7
  %127 = fmul <2 x double> %wide.load685, %124, !optimi !6
  %128 = fsub <2 x double> %wide.load684, %122, !optimi !6
  %129 = fmul <2 x double> %128, <double 5.000000e-01, double 5.000000e-01>, !optimi !6
  %130 = fmul <2 x double> %wide.load682, %129, !optimi !6
  %131 = fadd <2 x double> %127, %130, !optimi !6
  %132 = getelementptr inbounds double, double* %32, i64 %99, !optimi !8
  %133 = bitcast double* %132 to <2 x double>*, !optimi !8
  %wide.load686 = load <2 x double>, <2 x double>* %133, align 8, !tbaa !1, !alias.scope !83, !optimi !8
  %134 = fcmp oge <2 x double> %wide.load686, zeroinitializer, !optimi !5
  %135 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %wide.load686, !optimi !6
  %136 = select <2 x i1> %134, <2 x double> %wide.load686, <2 x double> %135, !optimi !6
  %137 = fadd <2 x double> %wide.load686, %136, !optimi !6
  %138 = fmul <2 x double> %137, <double 5.000000e-01, double 5.000000e-01>, !optimi !6
  %139 = fmul <2 x double> %wide.load682, %138, !optimi !6
  %140 = fsub <2 x double> %wide.load686, %136, !optimi !6
  %141 = fmul <2 x double> %140, <double 5.000000e-01, double 5.000000e-01>, !optimi !6
  %142 = add nuw nsw i64 %offset.idx, %88, !optimi !76
  %143 = getelementptr inbounds double, double* %68, i64 %142, !optimi !7
  %144 = bitcast double* %143 to <2 x double>*, !optimi !7
  %wide.load687 = load <2 x double>, <2 x double>* %144, align 8, !tbaa !1, !alias.scope !79, !optimi !7
  %145 = fmul <2 x double> %wide.load687, %141, !optimi !6
  %146 = fadd <2 x double> %139, %145, !optimi !6
  %147 = add nuw nsw i64 %89, %offset.idx, !optimi !85
  %148 = getelementptr inbounds double, double* %32, i64 %147, !optimi !8
  %149 = bitcast double* %148 to <2 x double>*, !optimi !8
  %wide.load688 = load <2 x double>, <2 x double>* %149, align 8, !tbaa !1, !alias.scope !83, !optimi !8
  %150 = fcmp oge <2 x double> %wide.load688, zeroinitializer, !optimi !5
  %151 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %wide.load688, !optimi !6
  %152 = select <2 x i1> %150, <2 x double> %wide.load688, <2 x double> %151, !optimi !6
  %153 = fadd <2 x double> %wide.load688, %152, !optimi !6
  %154 = fmul <2 x double> %153, <double 5.000000e-01, double 5.000000e-01>, !optimi !6
  %155 = getelementptr inbounds double, double* %68, i64 %147, !optimi !7
  %156 = bitcast double* %155 to <2 x double>*, !optimi !7
  %wide.load689 = load <2 x double>, <2 x double>* %156, align 8, !tbaa !1, !alias.scope !79, !optimi !7
  %157 = fmul <2 x double> %wide.load689, %154, !optimi !6
  %158 = fsub <2 x double> %wide.load688, %152, !optimi !6
  %159 = fmul <2 x double> %158, <double 5.000000e-01, double 5.000000e-01>, !optimi !6
  %160 = fmul <2 x double> %wide.load682, %159, !optimi !6
  %161 = fadd <2 x double> %157, %160, !optimi !6
  %162 = getelementptr inbounds double, double* %69, i64 %99, !optimi !7
  %163 = bitcast double* %162 to <2 x double>*, !optimi !7
  %wide.load690 = load <2 x double>, <2 x double>* %163, align 8, !tbaa !1, !alias.scope !86, !optimi !7
  %164 = fsub <2 x double> %116, %131, !optimi !6
  %165 = fmul <2 x double> %164, %92, !optimi !6
  %166 = fdiv <2 x double> %165, %95, !optimi !6
  %167 = fsub <2 x double> %wide.load690, %166, !optimi !6
  %168 = fsub <2 x double> %146, %161, !optimi !6
  %169 = fmul <2 x double> %92, %168, !optimi !6
  %170 = fdiv <2 x double> %169, %98, !optimi !6
  %171 = fsub <2 x double> %167, %170, !optimi !7
  %172 = getelementptr inbounds double, double* %70, i64 %99, !optimi !7
  %173 = bitcast double* %172 to <2 x double>*, !optimi !7
  store <2 x double> %171, <2 x double>* %173, align 8, !tbaa !1, !alias.scope !88, !noalias !90
  %index.next = add i64 %index, 2, !optimi !74
  %174 = icmp eq i64 %index.next, 510, !optimi !5
  br i1 %174, label %for.cond165.loopexit.loopexit691, label %vector.body, !llvm.loop !91

for.body172:                                      ; preds = %for.body172.preheader, %for.body172
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body172 ], [ 1, %for.body172.preheader ], !optimi !62
  %175 = add nuw nsw i64 %indvars.iv, %87, !optimi !16
  %arrayidx176 = getelementptr inbounds double, double* %28, i64 %175, !optimi !8
  %176 = load double, double* %arrayidx176, align 8, !tbaa !1, !optimi !8
  %cmp181 = fcmp oge double %176, 0.000000e+00, !optimi !5
  %sub = fsub double -0.000000e+00, %176, !optimi !8
  %cond = select i1 %cmp181, double %176, double %sub, !optimi !8
  %add191 = fadd double %176, %cond, !optimi !92
  %mul192 = fmul double %add191, 5.000000e-01, !optimi !93
  %arrayidx196 = getelementptr inbounds double, double* %68, i64 %175, !optimi !7
  %177 = load double, double* %arrayidx196, align 8, !tbaa !1, !optimi !7
  %mul197 = fmul double %177, %mul192, !optimi !94
  %sub221 = fsub double %176, %cond, !optimi !92
  %mul222 = fmul double %sub221, 5.000000e-01, !optimi !93
  %178 = add nuw nsw i64 %175, 1, !optimi !64
  %arrayidx227 = getelementptr inbounds double, double* %68, i64 %178, !optimi !7
  %179 = load double, double* %arrayidx227, align 8, !tbaa !1, !optimi !7
  %mul228 = fmul double %179, %mul222, !optimi !94
  %add229 = fadd double %mul197, %mul228, !optimi !95
  %180 = add nsw i64 %175, -1, !optimi !96
  %arrayidx234 = getelementptr inbounds double, double* %28, i64 %180, !optimi !8
  %181 = load double, double* %arrayidx234, align 8, !tbaa !1, !optimi !8
  %cmp240 = fcmp oge double %181, 0.000000e+00, !optimi !5
  %sub254 = fsub double -0.000000e+00, %181, !optimi !8
  %cond256 = select i1 %cmp240, double %181, double %sub254, !optimi !8
  %add257 = fadd double %181, %cond256, !optimi !92
  %mul258 = fmul double %add257, 5.000000e-01, !optimi !93
  %arrayidx263 = getelementptr inbounds double, double* %68, i64 %180, !optimi !7
  %182 = load double, double* %arrayidx263, align 8, !tbaa !1, !optimi !7
  %mul264 = fmul double %182, %mul258, !optimi !94
  %sub292 = fsub double %181, %cond256, !optimi !92
  %mul293 = fmul double %sub292, 5.000000e-01, !optimi !93
  %mul298 = fmul double %177, %mul293, !optimi !94
  %add299 = fadd double %mul264, %mul298, !optimi !95
  %arrayidx303 = getelementptr inbounds double, double* %32, i64 %175, !optimi !8
  %183 = load double, double* %arrayidx303, align 8, !tbaa !1, !optimi !8
  %cmp308 = fcmp oge double %183, 0.000000e+00, !optimi !5
  %sub320 = fsub double -0.000000e+00, %183, !optimi !8
  %cond322 = select i1 %cmp308, double %183, double %sub320, !optimi !8
  %add323 = fadd double %183, %cond322, !optimi !92
  %mul324 = fmul double %add323, 5.000000e-01, !optimi !93
  %mul329 = fmul double %177, %mul324, !optimi !94
  %sub353 = fsub double %183, %cond322, !optimi !92
  %mul354 = fmul double %sub353, 5.000000e-01, !optimi !93
  %184 = add nuw nsw i64 %indvars.iv, %88, !optimi !16
  %arrayidx359 = getelementptr inbounds double, double* %68, i64 %184, !optimi !7
  %185 = load double, double* %arrayidx359, align 8, !tbaa !1, !optimi !7
  %mul360 = fmul double %185, %mul354, !optimi !94
  %add361 = fadd double %mul329, %mul360, !optimi !95
  %186 = add nuw nsw i64 %89, %indvars.iv, !optimi !97
  %arrayidx366 = getelementptr inbounds double, double* %32, i64 %186, !optimi !8
  %187 = load double, double* %arrayidx366, align 8, !tbaa !1, !optimi !8
  %cmp372 = fcmp oge double %187, 0.000000e+00, !optimi !5
  %sub386 = fsub double -0.000000e+00, %187, !optimi !8
  %cond388 = select i1 %cmp372, double %187, double %sub386, !optimi !8
  %add389 = fadd double %187, %cond388, !optimi !92
  %mul390 = fmul double %add389, 5.000000e-01, !optimi !93
  %arrayidx395 = getelementptr inbounds double, double* %68, i64 %186, !optimi !7
  %188 = load double, double* %arrayidx395, align 8, !tbaa !1, !optimi !7
  %mul396 = fmul double %188, %mul390, !optimi !94
  %sub424 = fsub double %187, %cond388, !optimi !92
  %mul425 = fmul double %sub424, 5.000000e-01, !optimi !93
  %mul430 = fmul double %177, %mul425, !optimi !94
  %add431 = fadd double %mul396, %mul430, !optimi !95
  %arrayidx435 = getelementptr inbounds double, double* %69, i64 %175, !optimi !7
  %189 = load double, double* %arrayidx435, align 8, !tbaa !1, !optimi !7
  %190 = load double, double* %dt.addr, align 8, !tbaa !1, !optimi !55
  %sub436 = fsub double %add229, %add299, !optimi !98
  %mul437 = fmul double %sub436, %190, !optimi !99
  %191 = load double, double* %dx.addr, align 8, !tbaa !1, !optimi !55
  %div = fdiv double %mul437, %191, !optimi !100
  %sub438 = fsub double %189, %div, !optimi !101
  %sub439 = fsub double %add361, %add431, !optimi !98
  %mul440 = fmul double %190, %sub439, !optimi !99
  %192 = load double, double* %dy.addr, align 8, !tbaa !1, !optimi !55
  %div441 = fdiv double %mul440, %192, !optimi !100
  %sub442 = fsub double %sub438, %div441, !optimi !102
  %arrayidx446 = getelementptr inbounds double, double* %70, i64 %175, !optimi !7
  store double %sub442, double* %arrayidx446, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !62
  %exitcond = icmp eq i64 %indvars.iv.next, 511, !optimi !5
  br i1 %exitcond, label %for.cond165.loopexit.loopexit, label %for.body172, !llvm.loop !103

for.end452:                                       ; preds = %for.cond165.loopexit
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #2
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #2
  ret void
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @sw2d_shapiro_host(double* %wet, double* %etan, double %eps, double* %eta) local_unnamed_addr #1 {
entry:
  %wet.addr = alloca double*, align 8, !optimi !5
  %etan.addr = alloca double*, align 8, !optimi !7
  %eps.addr = alloca double, align 8, !optimi !104
  %eta.addr = alloca double*, align 8, !optimi !7
  store double* %wet, double** %wet.addr, align 8, !tbaa !11
  %wet.addr1 = bitcast double** %wet.addr to i8*, !optimi !5
  call void @llvm.var.annotation(i8* nonnull %wet.addr1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 280)
  store double* %etan, double** %etan.addr, align 8, !tbaa !11
  %etan.addr2 = bitcast double** %etan.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %etan.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 281)
  store double %eps, double* %eps.addr, align 8, !tbaa !1
  %eps.addr3 = bitcast double* %eps.addr to i8*, !optimi !104
  call void @llvm.var.annotation(i8* nonnull %eps.addr3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 282)
  store double* %eta, double** %eta.addr, align 8, !tbaa !11
  %eta.addr4 = bitcast double** %eta.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %eta.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 283)
  %0 = load double*, double** %wet.addr, align 8, !tbaa !11, !optimi !5
  %1 = load double*, double** %eta.addr, align 8, !tbaa !11, !optimi !7
  %2 = load double*, double** %etan.addr, align 8, !tbaa !11, !optimi !7
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc106, %entry
  %indvars.iv158 = phi i64 [ 1, %entry ], [ %indvars.iv.next159, %for.inc106 ], !optimi !62
  %3 = shl i64 %indvars.iv158, 9, !optimi !63
  %4 = add nsw i64 %3, -512, !optimi !66
  %5 = add nuw nsw i64 %3, 512, !optimi !33
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ], !optimi !62
  %6 = add nuw nsw i64 %indvars.iv, %3, !optimi !16
  %arrayidx = getelementptr inbounds double, double* %0, i64 %6, !optimi !5
  %7 = load double, double* %arrayidx, align 8, !tbaa !1, !optimi !5
  %cmp8 = fcmp oeq double %7, 1.000000e+00, !optimi !5
  %8 = add nuw nsw i64 %4, %indvars.iv, !optimi !97
  %9 = getelementptr inbounds double, double* %2, i64 %8, !optimi !7
  %10 = load double, double* %9, align 8, !tbaa !1, !optimi !7
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %11 = load double, double* %eps.addr, align 8, !tbaa !1, !optimi !104
  %mul9 = fmul double %11, 2.500000e-01, !optimi !105
  %12 = add nuw nsw i64 %6, 1, !optimi !64
  %arrayidx14 = getelementptr inbounds double, double* %0, i64 %12, !optimi !5
  %13 = load double, double* %arrayidx14, align 8, !tbaa !1, !optimi !5
  %14 = add nsw i64 %6, -1, !optimi !96
  %arrayidx18 = getelementptr inbounds double, double* %0, i64 %14, !optimi !5
  %15 = load double, double* %arrayidx18, align 8, !tbaa !1, !optimi !5
  %add19 = fadd double %13, %15, !optimi !106
  %16 = add nuw nsw i64 %5, %indvars.iv, !optimi !39
  %arrayidx24 = getelementptr inbounds double, double* %0, i64 %16, !optimi !5
  %17 = load double, double* %arrayidx24, align 8, !tbaa !1, !optimi !5
  %add25 = fadd double %add19, %17, !optimi !107
  %arrayidx30 = getelementptr inbounds double, double* %0, i64 %8, !optimi !5
  %18 = load double, double* %arrayidx30, align 8, !tbaa !1, !optimi !5
  %add31 = fadd double %add25, %18, !optimi !108
  %mul32 = fmul double %mul9, %add31, !optimi !105
  %sub33 = fsub double 1.000000e+00, %mul32, !optimi !109
  %arrayidx37 = getelementptr inbounds double, double* %2, i64 %6, !optimi !7
  %19 = load double, double* %arrayidx37, align 8, !tbaa !1, !optimi !7
  %mul38 = fmul double %19, %sub33, !optimi !110
  %arrayidx49 = getelementptr inbounds double, double* %2, i64 %12, !optimi !7
  %20 = load double, double* %arrayidx49, align 8, !tbaa !1, !optimi !7
  %mul50 = fmul double %13, %20, !optimi !7
  %arrayidx60 = getelementptr inbounds double, double* %2, i64 %14, !optimi !7
  %21 = load double, double* %arrayidx60, align 8, !tbaa !1, !optimi !7
  %mul61 = fmul double %15, %21, !optimi !7
  %add62 = fadd double %mul50, %mul61, !optimi !53
  %mul63 = fmul double %mul9, %add62, !optimi !111
  %arrayidx74 = getelementptr inbounds double, double* %2, i64 %16, !optimi !7
  %22 = load double, double* %arrayidx74, align 8, !tbaa !1, !optimi !7
  %mul75 = fmul double %17, %22, !optimi !7
  %mul86 = fmul double %10, %18, !optimi !7
  %add87 = fadd double %mul86, %mul75, !optimi !53
  %mul88 = fmul double %mul9, %add87, !optimi !111
  %add89 = fadd double %mul38, %mul63, !optimi !110
  %add90 = fadd double %add89, %mul88, !optimi !110
  br label %if.end

if.end:                                           ; preds = %for.body7, %if.then
  %.sink = phi double [ %add90, %if.then ], [ %10, %for.body7 ], !optimi !110
  %arrayidx105 = getelementptr inbounds double, double* %1, i64 %8, !optimi !7
  store double %.sink, double* %arrayidx105, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !62
  %exitcond = icmp eq i64 %indvars.iv.next, 511, !optimi !5
  br i1 %exitcond, label %for.inc106, label %for.body7

for.inc106:                                       ; preds = %if.end
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1, !optimi !62
  %exitcond163 = icmp eq i64 %indvars.iv.next159, 511, !optimi !5
  br i1 %exitcond163, label %for.end108, label %for.cond5.preheader

for.end108:                                       ; preds = %for.inc106
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_updates_host(double* %h, double* %hzero, double* %eta, double* %u, double* %un, double* %v, double* %vn, double* %wet, double %hmin) local_unnamed_addr #1 {
entry:
  %h.addr = alloca double*, align 8, !optimi !7
  %hzero.addr = alloca double*, align 8, !optimi !7
  %eta.addr = alloca double*, align 8, !optimi !7
  %u.addr = alloca double*, align 8, !optimi !8
  %un.addr = alloca double*, align 8, !optimi !8
  %v.addr = alloca double*, align 8, !optimi !8
  %vn.addr = alloca double*, align 8, !optimi !8
  %wet.addr = alloca double*, align 8, !optimi !5
  %hmin.addr = alloca double, align 8, !optimi !7
  store double* %h, double** %h.addr, align 8, !tbaa !11
  %h.addr1 = bitcast double** %h.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %h.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 327)
  store double* %hzero, double** %hzero.addr, align 8, !tbaa !11
  %hzero.addr2 = bitcast double** %hzero.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %hzero.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 328)
  store double* %eta, double** %eta.addr, align 8, !tbaa !11
  %eta.addr3 = bitcast double** %eta.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %eta.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 329)
  store double* %u, double** %u.addr, align 8, !tbaa !11
  %u.addr4 = bitcast double** %u.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %u.addr4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 330)
  store double* %un, double** %un.addr, align 8, !tbaa !11
  %un.addr5 = bitcast double** %un.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %un.addr5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 331)
  store double* %v, double** %v.addr, align 8, !tbaa !11
  %v.addr6 = bitcast double** %v.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %v.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 332)
  store double* %vn, double** %vn.addr, align 8, !tbaa !11
  %vn.addr7 = bitcast double** %vn.addr to i8*, !optimi !8
  call void @llvm.var.annotation(i8* nonnull %vn.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 333)
  store double* %wet, double** %wet.addr, align 8, !tbaa !11
  %wet.addr8 = bitcast double** %wet.addr to i8*, !optimi !5
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 334)
  store double %hmin, double* %hmin.addr, align 8, !tbaa !1
  %hmin.addr9 = bitcast double* %hmin.addr to i8*, !optimi !7
  call void @llvm.var.annotation(i8* nonnull %hmin.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 335)
  %0 = load double*, double** %hzero.addr, align 8, !tbaa !11, !optimi !7
  %1 = load double*, double** %eta.addr, align 8, !tbaa !11, !optimi !7
  %2 = load double*, double** %h.addr, align 8, !tbaa !11, !optimi !7
  %3 = load double*, double** %wet.addr, align 8, !tbaa !11, !optimi !5
  %4 = load double*, double** %un.addr, align 8, !tbaa !11, !optimi !8
  %5 = load double*, double** %u.addr, align 8, !tbaa !11, !optimi !8
  %6 = load double*, double** %vn.addr, align 8, !tbaa !11, !optimi !8
  %7 = load double*, double** %v.addr, align 8, !tbaa !11, !optimi !8
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond.cleanup12, %entry
  %indvars.iv84 = phi i64 [ 0, %entry ], [ %indvars.iv.next85, %for.cond.cleanup12 ], !optimi !15
  %8 = shl i64 %indvars.iv84, 9, !optimi !16
  br label %for.body13

for.cond.cleanup:                                 ; preds = %for.cond.cleanup12
  ret void

for.cond.cleanup12:                               ; preds = %if.end
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1, !optimi !15
  %exitcond87 = icmp eq i64 %indvars.iv.next85, 512, !optimi !5
  br i1 %exitcond87, label %for.cond.cleanup, label %for.cond10.preheader

for.body13:                                       ; preds = %if.end, %for.cond10.preheader
  %indvars.iv = phi i64 [ 0, %for.cond10.preheader ], [ %indvars.iv.next, %if.end ], !optimi !15
  %9 = add nuw nsw i64 %indvars.iv, %8, !optimi !17
  %arrayidx = getelementptr inbounds double, double* %0, i64 %9, !optimi !7
  %10 = load double, double* %arrayidx, align 8, !tbaa !1, !optimi !7
  %arrayidx17 = getelementptr inbounds double, double* %1, i64 %9, !optimi !7
  %11 = load double, double* %arrayidx17, align 8, !tbaa !1, !optimi !7
  %add18 = fadd double %10, %11, !optimi !53
  %arrayidx22 = getelementptr inbounds double, double* %2, i64 %9, !optimi !7
  store double %add18, double* %arrayidx22, align 8, !tbaa !1
  %arrayidx26 = getelementptr inbounds double, double* %3, i64 %9, !optimi !5
  store double 1.000000e+00, double* %arrayidx26, align 8, !tbaa !1
  %12 = load double, double* %arrayidx22, align 8, !tbaa !1, !optimi !7
  %13 = load double, double* %hmin.addr, align 8, !tbaa !1, !optimi !7
  %cmp31 = fcmp olt double %12, %13, !optimi !5
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %for.body13
  store double 0.000000e+00, double* %arrayidx26, align 8, !tbaa !1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body13
  %arrayidx39 = getelementptr inbounds double, double* %4, i64 %9, !optimi !8
  %14 = bitcast double* %arrayidx39 to i64*, !optimi !8
  %15 = load i64, i64* %14, align 8, !tbaa !1, !optimi !8
  %arrayidx43 = getelementptr inbounds double, double* %5, i64 %9, !optimi !8
  %16 = bitcast double* %arrayidx43 to i64*, !optimi !8
  store i64 %15, i64* %16, align 8, !tbaa !1
  %arrayidx47 = getelementptr inbounds double, double* %6, i64 %9, !optimi !8
  %17 = bitcast double* %arrayidx47 to i64*, !optimi !8
  %18 = load i64, i64* %17, align 8, !tbaa !1, !optimi !8
  %arrayidx51 = getelementptr inbounds double, double* %7, i64 %9, !optimi !8
  %19 = bitcast double* %arrayidx51 to i64*, !optimi !8
  store i64 %18, i64* %19, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !optimi !15
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !optimi !5
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
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!"(1, 0, 0)"}
!6 = !{!"(2.14748e+09, -2.14748e+09, 0)"}
!7 = !{!"(15, 0, 6)"}
!8 = !{!"(10, -10, 6)"}
!9 = !{!"(10, 0, 0)"}
!10 = !{!"(514, 0, 0)"}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !3, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !3, i64 0}
!15 = !{!"(513, 0, 0)"}
!16 = !{!"(262656, 0, 0)"}
!17 = !{!"(263169, 0, 0)"}
!18 = !{!"(517, 4, 0)"}
!19 = !{!"(263173, 4, 0)"}
!20 = !{!"(521, 8, 0)"}
!21 = !{!"(263177, 8, 0)"}
!22 = !{!"(525, 12, 0)"}
!23 = !{!"(263181, 12, 0)"}
!24 = distinct !{!24, !25, !26}
!25 = !{!"llvm.loop.vectorize.width", i32 1}
!26 = !{!"llvm.loop.interleave.count", i32 1}
!27 = !{!"(262145, 261632, 0)"}
!28 = !{!"(262149, 261636, 0)"}
!29 = !{!"(262153, 261640, 0)"}
!30 = !{!"(262157, 261644, 0)"}
!31 = distinct !{!31, !25, !26}
!32 = !{!"(263167, 511, 0)"}
!33 = !{!"(262656, 512, 0)"}
!34 = !{!"(263167, 1023, 0)"}
!35 = !{!"(263680, 1024, 0)"}
!36 = !{!"(264191, 1535, 0)"}
!37 = !{!"(263680, 1536, 0)"}
!38 = !{!"(264191, 2047, 0)"}
!39 = !{!"(263168, 512, 0)"}
!40 = !{!41}
!41 = distinct !{!41, !42}
!42 = distinct !{!42, !"LVerDomain"}
!43 = !{!44}
!44 = distinct !{!44, !42}
!45 = !{!46, !41}
!46 = distinct !{!46, !42}
!47 = !{!46}
!48 = distinct !{!48, !25, !26}
!49 = !{!"(-0, -15, 6)"}
!50 = !{!"(513, 1, 0)"}
!51 = !{!"(263169, 1, 0)"}
!52 = distinct !{!52, !25, !26}
!53 = !{!"(30, 0, 6)"}
!54 = !{!"(1.5e+06, -1.5e+06, 10)"}
!55 = !{!"(100, 0, 2)"}
!56 = !{!"(10, 9, 2)"}
!57 = !{!"(1000, 0, 4)"}
!58 = !{!"(15, -15, 6)"}
!59 = !{!"(15000, -15000, 10)"}
!60 = !{!"(2.62144e+06, 0, 0)"}
!61 = !{!"(3546, 0, 0)"}
!62 = !{!"(512, 0, 0)"}
!63 = !{!"(262144, 0, 0)"}
!64 = !{!"(262657, 1, 0)"}
!65 = !{!"(1.50001e+06, -1.50001e+06, 10)"}
!66 = !{!"(261632, -512, 0)"}
!67 = !{!68}
!68 = distinct !{!68, !69}
!69 = distinct !{!69, !"LVerDomain"}
!70 = !{!71}
!71 = distinct !{!71, !69}
!72 = !{!73}
!73 = distinct !{!73, !69}
!74 = !{!"(511, 0, 0)"}
!75 = !{!"(511, 1, 0)"}
!76 = !{!"(262655, 1, 0)"}
!77 = !{!78}
!78 = distinct !{!78, !69}
!79 = !{!80}
!80 = distinct !{!80, !69}
!81 = !{!"(262656, 2, 0)"}
!82 = !{!"(262654, 0, 0)"}
!83 = !{!84}
!84 = distinct !{!84, !69}
!85 = !{!"(262143, -511, 0)"}
!86 = !{!87}
!87 = distinct !{!87, !69}
!88 = !{!89}
!89 = distinct !{!89, !69}
!90 = !{!78, !80, !84, !87, !68, !71, !73}
!91 = distinct !{!91, !25, !26}
!92 = !{!"(20, -20, 6)"}
!93 = !{!"(10, -10, 7)"}
!94 = !{!"(150, -150, 13)"}
!95 = !{!"(300, -300, 13)"}
!96 = !{!"(262655, -1, 0)"}
!97 = !{!"(262144, -512, 0)"}
!98 = !{!"(600, -600, 13)"}
!99 = !{!"(60000, -60000, 15)"}
!100 = !{!"(6e+06, -6e+06, 15)"}
!101 = !{!"(6.00002e+06, -6e+06, 15)"}
!102 = !{!"(1.2e+07, -1.2e+07, 15)"}
!103 = distinct !{!103, !25, !26}
!104 = !{!"(0, 0, 2)"}
!105 = !{!"(0, 0, 4)"}
!106 = !{!"(2, 0, 0)"}
!107 = !{!"(3, 0, 0)"}
!108 = !{!"(4, 0, 0)"}
!109 = !{!"(1, 1, 4)"}
!110 = !{!"(15, 0, 10)"}
!111 = !{!"(0, 0, 10)"}
