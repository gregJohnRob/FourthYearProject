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
@.str.8 = private unnamed_addr constant [8 x i8] c"100 0 2\00", section "llvm.metadata"
@.str.9 = private unnamed_addr constant [7 x i8] c"10 9 2\00", section "llvm.metadata"
@.str.10 = private unnamed_addr constant [15 x i8] c"15000 -15000 6\00", section "llvm.metadata"
@.str.11 = private unnamed_addr constant [6 x i8] c"0 0 2\00", section "llvm.metadata"
@str = private unnamed_addr constant [25 x i8] c"Host arrays initialized.\00"
@str.12 = private unnamed_addr constant [62 x i8] c"-------------------------------------------------------------\00"

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host(double* %hzero, double* %eta, double* %etan, double* %h, double* %wet, double* %u, double* %un, double* %v, double* %vn, double %hmin, i32 %BytesPerWord) local_unnamed_addr #0 {
entry:
  %hzero.addr = alloca double*, align 8
  %eta.addr = alloca double*, align 8
  %etan.addr = alloca double*, align 8
  %h.addr = alloca double*, align 8
  %wet.addr = alloca double*, align 8
  %u.addr = alloca double*, align 8
  %un.addr = alloca double*, align 8
  %v.addr = alloca double*, align 8
  %vn.addr = alloca double*, align 8
  %hmin.addr = alloca double, align 8
  %BytesPerWord.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store double* %hzero, double** %hzero.addr, align 8, !tbaa !1
  %hzero.addr1 = bitcast double** %hzero.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %hzero.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 14)
  store double* %eta, double** %eta.addr, align 8, !tbaa !1
  %eta.addr2 = bitcast double** %eta.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eta.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 15)
  store double* %etan, double** %etan.addr, align 8, !tbaa !1
  %etan.addr3 = bitcast double** %etan.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %etan.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 16)
  store double* %h, double** %h.addr, align 8, !tbaa !1
  %h.addr4 = bitcast double** %h.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %h.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 17)
  store double* %wet, double** %wet.addr, align 8, !tbaa !1
  %wet.addr5 = bitcast double** %wet.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %wet.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 18)
  store double* %u, double** %u.addr, align 8, !tbaa !1
  %u.addr6 = bitcast double** %u.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 19)
  store double* %un, double** %un.addr, align 8, !tbaa !1
  %un.addr7 = bitcast double** %un.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %un.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 20)
  store double* %v, double** %v.addr, align 8, !tbaa !1
  %v.addr8 = bitcast double** %v.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %v.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 21)
  store double* %vn, double** %vn.addr, align 8, !tbaa !1
  %vn.addr9 = bitcast double** %vn.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 22)
  store double %hmin, double* %hmin.addr, align 8, !tbaa !5
  %hmin.addr10 = bitcast double* %hmin.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %hmin.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 23)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !7
  %BytesPerWord.addr11 = bitcast i32* %BytesPerWord.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 24)
  %0 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %0) #1
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 29)
  %1 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1) #1
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 29)
  store i32 0, i32* %j, align 4, !tbaa !7
  store i32 0, i32* %k, align 4, !tbaa !7
  %2 = load double*, double** %hzero.addr, align 8, !tbaa !1
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.inc17, %entry
  %indvars.iv177 = phi i64 [ 0, %entry ], [ %indvars.iv.next178, %for.inc17 ]
  %3 = shl i64 %indvars.iv177, 9
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond14.preheader
  %index = phi i64 [ 0, %for.cond14.preheader ], [ %index.next.3, %vector.body ]
  %4 = add nuw nsw i64 %index, %3
  %5 = getelementptr inbounds double, double* %2, i64 %4
  %6 = bitcast double* %5 to <2 x double>*
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %6, align 8, !tbaa !5
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %8, align 8, !tbaa !5
  %index.next = or i64 %index, 4
  %9 = add nuw nsw i64 %index.next, %3
  %10 = getelementptr inbounds double, double* %2, i64 %9
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %11, align 8, !tbaa !5
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %13, align 8, !tbaa !5
  %index.next.1 = or i64 %index, 8
  %14 = add nuw nsw i64 %index.next.1, %3
  %15 = getelementptr inbounds double, double* %2, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %16, align 8, !tbaa !5
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %18, align 8, !tbaa !5
  %index.next.2 = or i64 %index, 12
  %19 = add nuw nsw i64 %index.next.2, %3
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %21, align 8, !tbaa !5
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double>* %23, align 8, !tbaa !5
  %index.next.3 = add nsw i64 %index, 16
  %24 = icmp eq i64 %index.next.3, 512
  br i1 %24, label %for.inc17, label %vector.body, !llvm.loop !9

for.cond20.preheader:                             ; preds = %for.inc17
  store i32 0, i32* %k, align 4, !tbaa !7
  store i32 512, i32* %j, align 4, !tbaa !7
  br label %vector.body182

vector.body182:                                   ; preds = %vector.body182, %for.cond20.preheader
  %index187 = phi i64 [ 0, %for.cond20.preheader ], [ %index.next188.3, %vector.body182 ]
  %25 = getelementptr inbounds double, double* %2, i64 %index187
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %26, align 8, !tbaa !5
  %27 = add nuw nsw i64 %index187, 261632
  %28 = getelementptr inbounds double, double* %2, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %29, align 8, !tbaa !5
  %index.next188 = or i64 %index187, 2
  %30 = getelementptr inbounds double, double* %2, i64 %index.next188
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %31, align 8, !tbaa !5
  %32 = add nsw i64 %index187, 261634
  %33 = getelementptr inbounds double, double* %2, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %34, align 8, !tbaa !5
  %index.next188.1 = or i64 %index187, 4
  %35 = getelementptr inbounds double, double* %2, i64 %index.next188.1
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %36, align 8, !tbaa !5
  %37 = add nsw i64 %index187, 261636
  %38 = getelementptr inbounds double, double* %2, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %39, align 8, !tbaa !5
  %index.next188.2 = or i64 %index187, 6
  %40 = getelementptr inbounds double, double* %2, i64 %index.next188.2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %41, align 8, !tbaa !5
  %42 = add nsw i64 %index187, 261638
  %43 = getelementptr inbounds double, double* %2, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double>* %44, align 8, !tbaa !5
  %index.next188.3 = add nsw i64 %index187, 8
  %45 = icmp eq i64 %index.next188.3, 512
  br i1 %45, label %for.cond32.preheader, label %vector.body182, !llvm.loop !12

for.inc17:                                        ; preds = %vector.body
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next178, 512
  br i1 %exitcond180, label %for.cond20.preheader, label %for.cond14.preheader

for.cond32.preheader:                             ; preds = %vector.body182
  store i32 512, i32* %k, align 4, !tbaa !7
  store i32 0, i32* %j, align 4, !tbaa !7
  br label %for.body34

for.cond46.preheader:                             ; preds = %for.body34
  store i32 0, i32* %j, align 4, !tbaa !7
  %46 = load double*, double** %eta.addr, align 8, !tbaa !1
  %47 = load double*, double** %etan.addr, align 8, !tbaa !1
  br label %for.cond49.preheader

for.body34:                                       ; preds = %for.body34, %for.cond32.preheader
  %indvars.iv164 = phi i64 [ 0, %for.cond32.preheader ], [ %indvars.iv.next165.3, %for.body34 ]
  %48 = shl nsw i64 %indvars.iv164, 9
  %arrayidx38 = getelementptr inbounds double, double* %2, i64 %48
  store double -1.000000e+01, double* %arrayidx38, align 8, !tbaa !5
  %49 = or i64 %48, 511
  %arrayidx42 = getelementptr inbounds double, double* %2, i64 %49
  store double -1.000000e+01, double* %arrayidx42, align 8, !tbaa !5
  %indvars.iv.next165 = shl i64 %indvars.iv164, 9
  %50 = or i64 %indvars.iv.next165, 512
  %arrayidx38.1 = getelementptr inbounds double, double* %2, i64 %50
  store double -1.000000e+01, double* %arrayidx38.1, align 8, !tbaa !5
  %51 = or i64 %indvars.iv.next165, 1023
  %arrayidx42.1 = getelementptr inbounds double, double* %2, i64 %51
  store double -1.000000e+01, double* %arrayidx42.1, align 8, !tbaa !5
  %indvars.iv.next165.1 = shl i64 %indvars.iv164, 9
  %52 = or i64 %indvars.iv.next165.1, 1024
  %arrayidx38.2 = getelementptr inbounds double, double* %2, i64 %52
  store double -1.000000e+01, double* %arrayidx38.2, align 8, !tbaa !5
  %53 = or i64 %indvars.iv.next165.1, 1535
  %arrayidx42.2 = getelementptr inbounds double, double* %2, i64 %53
  store double -1.000000e+01, double* %arrayidx42.2, align 8, !tbaa !5
  %indvars.iv.next165.2 = shl i64 %indvars.iv164, 9
  %54 = or i64 %indvars.iv.next165.2, 1536
  %arrayidx38.3 = getelementptr inbounds double, double* %2, i64 %54
  store double -1.000000e+01, double* %arrayidx38.3, align 8, !tbaa !5
  %55 = or i64 %indvars.iv.next165.2, 2047
  %arrayidx42.3 = getelementptr inbounds double, double* %2, i64 %55
  store double -1.000000e+01, double* %arrayidx42.3, align 8, !tbaa !5
  %indvars.iv.next165.3 = add nsw i64 %indvars.iv164, 4
  %exitcond168.3 = icmp eq i64 %indvars.iv.next165.3, 512
  br i1 %exitcond168.3, label %for.cond46.preheader, label %for.body34

for.cond49.preheader:                             ; preds = %for.inc77, %for.cond46.preheader
  %indvars.iv160 = phi i64 [ 0, %for.cond46.preheader ], [ %indvars.iv.next161, %for.inc77 ]
  %56 = shl i64 %indvars.iv160, 9
  %scevgep = getelementptr double, double* %46, i64 %56
  %57 = add i64 %56, 512
  %scevgep200 = getelementptr double, double* %46, i64 %57
  %scevgep202 = getelementptr double, double* %47, i64 %56
  %scevgep204 = getelementptr double, double* %47, i64 %57
  %scevgep206 = getelementptr double, double* %2, i64 %56
  %scevgep208 = getelementptr double, double* %2, i64 %57
  %58 = shl i64 %indvars.iv160, 9
  %bound0 = icmp ult double* %scevgep, %scevgep204
  %bound1 = icmp ult double* %scevgep202, %scevgep200
  %found.conflict = and i1 %bound0, %bound1
  %bound0210 = icmp ult double* %scevgep, %scevgep208
  %bound1211 = icmp ult double* %scevgep206, %scevgep200
  %found.conflict212 = and i1 %bound0210, %bound1211
  %conflict.rdx = or i1 %found.conflict, %found.conflict212
  %bound0213 = icmp ult double* %scevgep202, %scevgep208
  %bound1214 = icmp ult double* %scevgep206, %scevgep204
  %found.conflict215 = and i1 %bound0213, %bound1214
  %conflict.rdx216 = or i1 %conflict.rdx, %found.conflict215
  br i1 %conflict.rdx216, label %for.body51.preheader, label %vector.body194.preheader

vector.body194.preheader:                         ; preds = %for.cond49.preheader
  br label %vector.body194

for.body51.preheader:                             ; preds = %for.cond49.preheader
  br label %for.body51

vector.body194:                                   ; preds = %vector.body194.preheader, %vector.body194
  %index218 = phi i64 [ %index.next219, %vector.body194 ], [ 0, %vector.body194.preheader ]
  %59 = add nuw nsw i64 %58, %index218
  %60 = getelementptr inbounds double, double* %2, i64 %59
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !tbaa !5, !alias.scope !13
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load226 = load <2 x double>, <2 x double>* %63, align 8, !tbaa !5, !alias.scope !13
  %64 = fcmp ogt <2 x double> %wide.load, zeroinitializer
  %65 = fcmp ogt <2 x double> %wide.load226, zeroinitializer
  %66 = select <2 x i1> %64, <2 x double> zeroinitializer, <2 x double> %wide.load
  %67 = select <2 x i1> %65, <2 x double> zeroinitializer, <2 x double> %wide.load226
  %68 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %66
  %69 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %67
  %70 = getelementptr inbounds double, double* %46, i64 %59
  %71 = bitcast double* %70 to <2 x double>*
  store <2 x double> %68, <2 x double>* %71, align 8, !tbaa !5, !alias.scope !16, !noalias !18
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  store <2 x double> %69, <2 x double>* %73, align 8, !tbaa !5, !alias.scope !16, !noalias !18
  %74 = getelementptr inbounds double, double* %47, i64 %59
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> %68, <2 x double>* %75, align 8, !tbaa !5, !alias.scope !20, !noalias !13
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> %69, <2 x double>* %77, align 8, !tbaa !5, !alias.scope !20, !noalias !13
  %index.next219 = add i64 %index218, 4
  %78 = icmp eq i64 %index.next219, 512
  br i1 %78, label %for.inc77.loopexit227, label %vector.body194, !llvm.loop !21

for.cond80.preheader:                             ; preds = %for.inc77
  store i32 512, i32* %k, align 4, !tbaa !7
  store i32 0, i32* %j, align 4, !tbaa !7
  %79 = load double*, double** %h.addr, align 8, !tbaa !1
  %80 = load double*, double** %wet.addr, align 8, !tbaa !1
  %81 = load double*, double** %u.addr, align 8, !tbaa !1
  %82 = load double*, double** %un.addr, align 8, !tbaa !1
  %83 = load double*, double** %v.addr, align 8, !tbaa !1
  %84 = load double*, double** %vn.addr, align 8, !tbaa !1
  br label %for.cond83.preheader

for.body51:                                       ; preds = %for.body51, %for.body51.preheader
  %indvars.iv156 = phi i64 [ 0, %for.body51.preheader ], [ %indvars.iv.next157.1, %for.body51 ]
  %85 = add nuw nsw i64 %58, %indvars.iv156
  %arrayidx55 = getelementptr inbounds double, double* %2, i64 %85
  %86 = load double, double* %arrayidx55, align 8, !tbaa !5
  %cmp56 = fcmp ogt double %86, 0.000000e+00
  %cond = select i1 %cmp56, double 0.000000e+00, double %86
  %sub61 = fsub double -0.000000e+00, %cond
  %arrayidx65 = getelementptr inbounds double, double* %46, i64 %85
  store double %sub61, double* %arrayidx65, align 8, !tbaa !5
  %arrayidx73 = getelementptr inbounds double, double* %47, i64 %85
  store double %sub61, double* %arrayidx73, align 8, !tbaa !5
  %indvars.iv.next157 = or i64 %indvars.iv156, 1
  %87 = add nuw nsw i64 %58, %indvars.iv.next157
  %arrayidx55.1 = getelementptr inbounds double, double* %2, i64 %87
  %88 = load double, double* %arrayidx55.1, align 8, !tbaa !5
  %cmp56.1 = fcmp ogt double %88, 0.000000e+00
  %cond.1 = select i1 %cmp56.1, double 0.000000e+00, double %88
  %sub61.1 = fsub double -0.000000e+00, %cond.1
  %arrayidx65.1 = getelementptr inbounds double, double* %46, i64 %87
  store double %sub61.1, double* %arrayidx65.1, align 8, !tbaa !5
  %arrayidx73.1 = getelementptr inbounds double, double* %47, i64 %87
  store double %sub61.1, double* %arrayidx73.1, align 8, !tbaa !5
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %exitcond159.1 = icmp eq i64 %indvars.iv.next157.1, 512
  br i1 %exitcond159.1, label %for.inc77.loopexit, label %for.body51, !llvm.loop !22

for.inc77.loopexit:                               ; preds = %for.body51
  br label %for.inc77

for.inc77.loopexit227:                            ; preds = %vector.body194
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.loopexit227, %for.inc77.loopexit
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next161, 512
  br i1 %exitcond163, label %for.cond80.preheader, label %for.cond49.preheader

for.cond83.preheader:                             ; preds = %for.cond80.preheader, %for.inc131
  %indvars.iv154 = phi i64 [ 0, %for.cond80.preheader ], [ %indvars.iv.next155, %for.inc131 ]
  %89 = phi i32 [ 0, %for.cond80.preheader ], [ %inc132, %for.inc131 ]
  %90 = trunc i64 %indvars.iv154 to i32
  %mul86 = shl i32 %90, 9
  %91 = sext i32 %mul86 to i64
  br label %for.body85

for.body85:                                       ; preds = %if.end, %for.cond83.preheader
  %indvars.iv = phi i64 [ 0, %for.cond83.preheader ], [ %indvars.iv.next, %if.end ]
  %92 = add nsw i64 %91, %indvars.iv
  %arrayidx89 = getelementptr inbounds double, double* %2, i64 %92
  %93 = load double, double* %arrayidx89, align 8, !tbaa !5
  %arrayidx93 = getelementptr inbounds double, double* %46, i64 %92
  %94 = load double, double* %arrayidx93, align 8, !tbaa !5
  %add94 = fadd double %93, %94
  %arrayidx98 = getelementptr inbounds double, double* %79, i64 %92
  store double %add94, double* %arrayidx98, align 8, !tbaa !5
  %arrayidx102 = getelementptr inbounds double, double* %80, i64 %92
  store double 1.000000e+00, double* %arrayidx102, align 8, !tbaa !5
  %95 = load double, double* %arrayidx98, align 8, !tbaa !5
  %96 = load double, double* %hmin.addr, align 8, !tbaa !5
  %cmp107 = fcmp olt double %95, %96
  br i1 %cmp107, label %if.then, label %if.end

if.then:                                          ; preds = %for.body85
  store double 0.000000e+00, double* %arrayidx102, align 8, !tbaa !5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body85
  %arrayidx115 = getelementptr inbounds double, double* %81, i64 %92
  store double 0.000000e+00, double* %arrayidx115, align 8, !tbaa !5
  %arrayidx119 = getelementptr inbounds double, double* %82, i64 %92
  store double 0.000000e+00, double* %arrayidx119, align 8, !tbaa !5
  %arrayidx123 = getelementptr inbounds double, double* %83, i64 %92
  store double 0.000000e+00, double* %arrayidx123, align 8, !tbaa !5
  %arrayidx127 = getelementptr inbounds double, double* %84, i64 %92
  store double 0.000000e+00, double* %arrayidx127, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond, label %for.inc131, label %for.body85

for.inc131:                                       ; preds = %if.end
  %inc132 = add nsw i32 %89, 1
  %cmp81 = icmp slt i32 %inc132, 512
  %indvars.iv.next155 = add nsw i64 %indvars.iv154, 1
  br i1 %cmp81, label %for.cond83.preheader, label %for.end133

for.end133:                                       ; preds = %for.inc131
  store i32 512, i32* %k, align 4, !tbaa !7
  store i32 %inc132, i32* %j, align 4, !tbaa !7
  %puts = call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str, i64 0, i64 0))
  %puts138 = call i32 @puts(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @str.12, i64 0, i64 0))
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #1
  call void @llvm.lifetime.end(i64 4, i8* nonnull %0) #1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: norecurse nounwind uwtable
define void @temp(double %dt, double %eta_jk, double %eta_jk1, double %eta_j1k, double %g, double %dx, double %dy, double* nocapture %dv, double* nocapture %du) local_unnamed_addr #3 {
entry:
  %0 = fmul double %dt, %g
  %mul = fsub double -0.000000e+00, %0
  %sub1 = fsub double %eta_jk1, %eta_jk
  %mul2 = fmul double %sub1, %mul
  %div = fdiv double %mul2, %dx
  store double %div, double* %du, align 8, !tbaa !5
  %sub5 = fsub double %eta_j1k, %eta_jk
  %mul6 = fmul double %sub5, %mul
  %div7 = fdiv double %mul6, %dy
  store double %div7, double* %dv, align 8, !tbaa !5
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host(double %dt, double %dx, double %dy, double %g, double* %eta, double* %un, double* %u, double* %wet, double* %v, double* %vn, double* %h, double* %etan, i32 %BytesPerWord) local_unnamed_addr #0 {
entry:
  %dt.addr = alloca double, align 8
  %dx.addr = alloca double, align 8
  %dy.addr = alloca double, align 8
  %g.addr = alloca double, align 8
  %eta.addr = alloca double*, align 8
  %un.addr = alloca double*, align 8
  %u.addr = alloca double*, align 8
  %wet.addr = alloca double*, align 8
  %v.addr = alloca double*, align 8
  %vn.addr = alloca double*, align 8
  %h.addr = alloca double*, align 8
  %etan.addr = alloca double*, align 8
  %BytesPerWord.addr = alloca i32, align 4
  %du = alloca double*, align 8
  %dv = alloca double*, align 8
  store double %dt, double* %dt.addr, align 8, !tbaa !5
  %dt.addr1 = bitcast double* %dt.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %dt.addr1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 119)
  store double %dx, double* %dx.addr, align 8, !tbaa !5
  %dx.addr2 = bitcast double* %dx.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %dx.addr2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 120)
  store double %dy, double* %dy.addr, align 8, !tbaa !5
  %dy.addr3 = bitcast double* %dy.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %dy.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 121)
  store double %g, double* %g.addr, align 8, !tbaa !5
  %g.addr4 = bitcast double* %g.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 122)
  store double* %eta, double** %eta.addr, align 8, !tbaa !1
  %eta.addr5 = bitcast double** %eta.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eta.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 123)
  store double* %un, double** %un.addr, align 8, !tbaa !1
  %un.addr6 = bitcast double** %un.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %un.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 124)
  store double* %u, double** %u.addr, align 8, !tbaa !1
  %u.addr7 = bitcast double** %u.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %u.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 125)
  store double* %wet, double** %wet.addr, align 8, !tbaa !1
  %wet.addr8 = bitcast double** %wet.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 126)
  store double* %v, double** %v.addr, align 8, !tbaa !1
  %v.addr9 = bitcast double** %v.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %v.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 127)
  store double* %vn, double** %vn.addr, align 8, !tbaa !1
  %vn.addr10 = bitcast double** %vn.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %vn.addr10, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 128)
  store double* %h, double** %h.addr, align 8, !tbaa !1
  %h.addr11 = bitcast double** %h.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %h.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 129)
  store double* %etan, double** %etan.addr, align 8, !tbaa !1
  %etan.addr12 = bitcast double** %etan.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %etan.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 130)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4, !tbaa !7
  %BytesPerWord.addr13 = bitcast i32* %BytesPerWord.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %BytesPerWord.addr13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 131)
  %0 = bitcast double** %du to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #1
  call void @llvm.var.annotation(i8* nonnull %0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 136)
  %1 = bitcast double** %dv to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #1
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 137)
  %2 = bitcast double** %du to i8**
  %3 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !7
  %mul = shl nsw i32 %3, 18
  %conv = sext i32 %mul to i64
  %call = call i32 @posix_memalign(i8** nonnull %2, i64 64, i64 %conv) #1
  %4 = bitcast double** %dv to i8**
  %5 = load i32, i32* %BytesPerWord.addr, align 4, !tbaa !7
  %mul16 = shl nsw i32 %5, 18
  %conv17 = sext i32 %mul16 to i64
  %call18 = call i32 @posix_memalign(i8** nonnull %4, i64 64, i64 %conv17) #1
  %6 = load double*, double** %eta.addr, align 8, !tbaa !1
  %7 = load double*, double** %dv, align 8, !tbaa !1
  %8 = load double*, double** %du, align 8, !tbaa !1
  br label %for.cond20.preheader

for.cond.loopexit:                                ; preds = %for.body23
  %exitcond634 = icmp eq i64 %indvars.iv.next631, 511
  br i1 %exitcond634, label %for.cond46.preheader, label %for.cond20.preheader

for.cond20.preheader:                             ; preds = %for.cond.loopexit, %entry
  %indvars.iv630 = phi i64 [ 1, %entry ], [ %indvars.iv.next631, %for.cond.loopexit ]
  %indvars.iv.next631 = add nuw nsw i64 %indvars.iv630, 1
  %9 = shl nsw i64 %indvars.iv630, 9
  %10 = shl i64 %indvars.iv.next631, 9
  br label %for.body23

for.cond46.preheader:                             ; preds = %for.cond.loopexit
  %11 = load double*, double** %un.addr, align 8, !tbaa !1
  %12 = load double*, double** %u.addr, align 8, !tbaa !1
  %13 = load double*, double** %wet.addr, align 8, !tbaa !1
  %14 = load double*, double** %vn.addr, align 8, !tbaa !1
  %15 = load double*, double** %v.addr, align 8, !tbaa !1
  br label %for.cond50.preheader

for.body23:                                       ; preds = %for.body23, %for.cond20.preheader
  %indvars.iv624 = phi i64 [ 1, %for.cond20.preheader ], [ %indvars.iv.next625, %for.body23 ]
  %16 = load double, double* %dt.addr, align 8, !tbaa !5
  %17 = add nuw nsw i64 %indvars.iv624, %9
  %arrayidx = getelementptr inbounds double, double* %6, i64 %17
  %18 = load double, double* %arrayidx, align 8, !tbaa !5
  %19 = add nuw nsw i64 %17, 1
  %arrayidx29 = getelementptr inbounds double, double* %6, i64 %19
  %20 = load double, double* %arrayidx29, align 8, !tbaa !5
  %21 = add nuw nsw i64 %indvars.iv624, %10
  %arrayidx34 = getelementptr inbounds double, double* %6, i64 %21
  %22 = load double, double* %arrayidx34, align 8, !tbaa !5
  %23 = load double, double* %g.addr, align 8, !tbaa !5
  %24 = load double, double* %dx.addr, align 8, !tbaa !5
  %25 = load double, double* %dy.addr, align 8, !tbaa !5
  %arrayidx38 = getelementptr inbounds double, double* %7, i64 %17
  %arrayidx42 = getelementptr inbounds double, double* %8, i64 %17
  %26 = fmul double %16, %23
  %mul.i = fsub double -0.000000e+00, %26
  %sub1.i = fsub double %20, %18
  %mul2.i = fmul double %sub1.i, %mul.i
  %div.i = fdiv double %mul2.i, %24
  store double %div.i, double* %arrayidx42, align 8, !tbaa !5
  %sub5.i = fsub double %22, %18
  %mul6.i = fmul double %sub5.i, %mul.i
  %div7.i = fdiv double %mul6.i, %25
  store double %div7.i, double* %arrayidx38, align 8, !tbaa !5
  %indvars.iv.next625 = add nuw nsw i64 %indvars.iv624, 1
  %exitcond629 = icmp eq i64 %indvars.iv.next625, 511
  br i1 %exitcond629, label %for.cond.loopexit, label %for.body23

for.cond50.preheader:                             ; preds = %for.inc162, %for.cond46.preheader
  %indvars.iv620 = phi i64 [ 1, %for.cond46.preheader ], [ %indvars.iv.next621, %for.inc162 ]
  %27 = shl nsw i64 %indvars.iv620, 9
  br label %for.body53

for.cond165.preheader:                            ; preds = %for.inc162
  %28 = load double*, double** %h.addr, align 8, !tbaa !1
  %29 = load double*, double** %etan.addr, align 8, !tbaa !1
  br label %for.cond169.preheader

for.body53:                                       ; preds = %for.inc159, %for.cond50.preheader
  %indvars.iv613 = phi i64 [ 1, %for.cond50.preheader ], [ %indvars.iv.next614, %for.inc159 ]
  %30 = add nuw nsw i64 %indvars.iv613, %27
  %arrayidx57 = getelementptr inbounds double, double* %11, i64 %30
  store double 0.000000e+00, double* %arrayidx57, align 8, !tbaa !5
  %arrayidx61 = getelementptr inbounds double, double* %12, i64 %30
  %31 = load double, double* %arrayidx61, align 8, !tbaa !5
  %arrayidx65 = getelementptr inbounds double, double* %8, i64 %30
  %32 = load double, double* %arrayidx65, align 8, !tbaa !5
  %arrayidx69 = getelementptr inbounds double, double* %13, i64 %30
  %33 = load double, double* %arrayidx69, align 8, !tbaa !5
  %cmp70 = fcmp oeq double %33, 1.000000e+00
  %34 = add nuw nsw i64 %30, 1
  %arrayidx76 = getelementptr inbounds double, double* %13, i64 %34
  %35 = load double, double* %arrayidx76, align 8, !tbaa !5
  %cmp77 = fcmp oeq double %35, 1.000000e+00
  br i1 %cmp70, label %if.then, label %if.else

if.then:                                          ; preds = %for.body53
  %cmp79 = fcmp ogt double %32, 0.000000e+00
  %or.cond = or i1 %cmp79, %cmp77
  br i1 %or.cond, label %if.then81, label %if.end103

if.then81:                                        ; preds = %if.then
  %add82 = fadd double %31, %32
  store double %add82, double* %arrayidx57, align 8, !tbaa !5
  br label %if.end103

if.else:                                          ; preds = %for.body53
  %cmp94 = fcmp olt double %32, 0.000000e+00
  %or.cond453 = and i1 %cmp94, %cmp77
  br i1 %or.cond453, label %if.then96, label %if.end103

if.then96:                                        ; preds = %if.else
  %add97 = fadd double %31, %32
  store double %add97, double* %arrayidx57, align 8, !tbaa !5
  br label %if.end103

if.end103:                                        ; preds = %if.else, %if.then96, %if.then81, %if.then
  %arrayidx107 = getelementptr inbounds double, double* %14, i64 %30
  store double 0.000000e+00, double* %arrayidx107, align 8, !tbaa !5
  %arrayidx111 = getelementptr inbounds double, double* %15, i64 %30
  %36 = load double, double* %arrayidx111, align 8, !tbaa !5
  %arrayidx115 = getelementptr inbounds double, double* %7, i64 %30
  %37 = load double, double* %arrayidx115, align 8, !tbaa !5
  %38 = load double, double* %arrayidx69, align 8, !tbaa !5
  %cmp120 = fcmp oeq double %38, 1.000000e+00
  %39 = load double, double* %arrayidx76, align 8, !tbaa !5
  %cmp128 = fcmp oeq double %39, 1.000000e+00
  br i1 %cmp120, label %if.then122, label %if.else140

if.then122:                                       ; preds = %if.end103
  %cmp131 = fcmp ogt double %37, 0.000000e+00
  %or.cond454 = or i1 %cmp131, %cmp128
  br i1 %or.cond454, label %if.then133, label %for.inc159

if.then133:                                       ; preds = %if.then122
  %add134 = fadd double %36, %37
  store double %add134, double* %arrayidx107, align 8, !tbaa !5
  br label %for.inc159

if.else140:                                       ; preds = %if.end103
  %cmp149 = fcmp olt double %37, 0.000000e+00
  %or.cond455 = and i1 %cmp149, %cmp128
  br i1 %or.cond455, label %if.then151, label %for.inc159

if.then151:                                       ; preds = %if.else140
  %add152 = fadd double %36, %37
  store double %add152, double* %arrayidx107, align 8, !tbaa !5
  br label %for.inc159

for.inc159:                                       ; preds = %if.then122, %if.then133, %if.then151, %if.else140
  %indvars.iv.next614 = add nuw nsw i64 %indvars.iv613, 1
  %exitcond617 = icmp eq i64 %indvars.iv.next614, 511
  br i1 %exitcond617, label %for.inc162, label %for.body53

for.inc162:                                       ; preds = %for.inc159
  %indvars.iv.next621 = add nuw nsw i64 %indvars.iv620, 1
  %exitcond623 = icmp eq i64 %indvars.iv.next621, 511
  br i1 %exitcond623, label %for.cond165.preheader, label %for.cond50.preheader

for.cond165.loopexit.loopexit:                    ; preds = %for.body172
  br label %for.cond165.loopexit

for.cond165.loopexit.loopexit691:                 ; preds = %vector.body
  br label %for.cond165.loopexit

for.cond165.loopexit:                             ; preds = %for.cond165.loopexit.loopexit691, %for.cond165.loopexit.loopexit
  %exitcond612 = icmp eq i64 %indvars.iv.next608, 511
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond612, label %for.end452, label %for.cond169.preheader

for.cond169.preheader:                            ; preds = %for.cond165.loopexit, %for.cond165.preheader
  %indvar = phi i64 [ %indvar.next, %for.cond165.loopexit ], [ 0, %for.cond165.preheader ]
  %indvars.iv607 = phi i64 [ %indvars.iv.next608, %for.cond165.loopexit ], [ 1, %for.cond165.preheader ]
  %40 = shl i64 %indvar, 9
  %41 = add i64 %40, 513
  %scevgep = getelementptr double, double* %29, i64 %41
  %42 = add i64 %40, 1023
  %scevgep636 = getelementptr double, double* %29, i64 %42
  %43 = add i64 %40, 512
  %scevgep638 = getelementptr double, double* %11, i64 %43
  %scevgep640 = getelementptr double, double* %11, i64 %42
  %44 = or i64 %40, 1
  %scevgep642 = getelementptr double, double* %28, i64 %44
  %45 = add i64 %40, 1535
  %scevgep644 = getelementptr double, double* %28, i64 %45
  %scevgep646 = getelementptr double, double* %14, i64 %44
  %scevgep648 = getelementptr double, double* %14, i64 %42
  %scevgep650 = getelementptr double, double* %6, i64 %41
  %scevgep652 = getelementptr double, double* %6, i64 %42
  %indvars.iv.next608 = add nuw nsw i64 %indvars.iv607, 1
  %46 = shl i64 %indvars.iv607, 9
  %47 = shl i64 %indvars.iv.next608, 9
  %48 = add nsw i64 %46, -512
  %bound0 = icmp ult double* %scevgep, %scevgep640
  %bound1 = icmp ult double* %scevgep638, %scevgep636
  %found.conflict = and i1 %bound0, %bound1
  %bound0654 = icmp ult double* %scevgep, %scevgep644
  %bound1655 = icmp ult double* %scevgep642, %scevgep636
  %found.conflict656 = and i1 %bound0654, %bound1655
  %conflict.rdx = or i1 %found.conflict, %found.conflict656
  %bound0657 = icmp ult double* %scevgep, %scevgep648
  %bound1658 = icmp ult double* %scevgep646, %scevgep636
  %found.conflict659 = and i1 %bound0657, %bound1658
  %conflict.rdx660 = or i1 %conflict.rdx, %found.conflict659
  %bound0661 = icmp ult double* %scevgep, %scevgep652
  %bound1662 = icmp ult double* %scevgep650, %scevgep636
  %found.conflict663 = and i1 %bound0661, %bound1662
  %conflict.rdx664 = or i1 %conflict.rdx660, %found.conflict663
  %bound0666 = icmp ult double* %scevgep, %dt.addr
  %bound1667 = icmp ult double* %dt.addr, %scevgep636
  %found.conflict668 = and i1 %bound0666, %bound1667
  %conflict.rdx669 = or i1 %conflict.rdx664, %found.conflict668
  %bound0672 = icmp ult double* %scevgep, %dx.addr
  %bound1673 = icmp ult double* %dx.addr, %scevgep636
  %found.conflict674 = and i1 %bound0672, %bound1673
  %conflict.rdx675 = or i1 %conflict.rdx669, %found.conflict674
  %bound0678 = icmp ult double* %scevgep, %dy.addr
  %bound1679 = icmp ult double* %dy.addr, %scevgep636
  %found.conflict680 = and i1 %bound0678, %bound1679
  %conflict.rdx681 = or i1 %conflict.rdx675, %found.conflict680
  br i1 %conflict.rdx681, label %for.body172.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond169.preheader
  %49 = load double, double* %dt.addr, align 8, !tbaa !5, !alias.scope !23
  %50 = insertelement <2 x double> undef, double %49, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = load double, double* %dx.addr, align 8, !tbaa !5, !alias.scope !26
  %53 = insertelement <2 x double> undef, double %52, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = load double, double* %dy.addr, align 8, !tbaa !5, !alias.scope !28
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  br label %vector.body

for.body172.preheader:                            ; preds = %for.cond169.preheader
  br label %for.body172

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %58 = add nuw nsw i64 %offset.idx, %46
  %59 = getelementptr inbounds double, double* %11, i64 %58
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8, !tbaa !5, !alias.scope !30
  %61 = fcmp oge <2 x double> %wide.load, zeroinitializer
  %62 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %wide.load
  %63 = select <2 x i1> %61, <2 x double> %wide.load, <2 x double> %62
  %64 = fadd <2 x double> %wide.load, %63
  %65 = fmul <2 x double> %64, <double 5.000000e-01, double 5.000000e-01>
  %66 = getelementptr inbounds double, double* %28, i64 %58
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load682 = load <2 x double>, <2 x double>* %67, align 8, !tbaa !5, !alias.scope !32
  %68 = fmul <2 x double> %wide.load682, %65
  %69 = fsub <2 x double> %wide.load, %63
  %70 = fmul <2 x double> %69, <double 5.000000e-01, double 5.000000e-01>
  %71 = add nuw nsw i64 %58, 1
  %72 = getelementptr inbounds double, double* %28, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load683 = load <2 x double>, <2 x double>* %73, align 8, !tbaa !5, !alias.scope !32
  %74 = fmul <2 x double> %wide.load683, %70
  %75 = fadd <2 x double> %68, %74
  %76 = add nsw i64 %58, -1
  %77 = getelementptr inbounds double, double* %11, i64 %76
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load684 = load <2 x double>, <2 x double>* %78, align 8, !tbaa !5, !alias.scope !30
  %79 = fcmp oge <2 x double> %wide.load684, zeroinitializer
  %80 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %wide.load684
  %81 = select <2 x i1> %79, <2 x double> %wide.load684, <2 x double> %80
  %82 = fadd <2 x double> %wide.load684, %81
  %83 = fmul <2 x double> %82, <double 5.000000e-01, double 5.000000e-01>
  %84 = getelementptr inbounds double, double* %28, i64 %76
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load685 = load <2 x double>, <2 x double>* %85, align 8, !tbaa !5, !alias.scope !32
  %86 = fmul <2 x double> %wide.load685, %83
  %87 = fsub <2 x double> %wide.load684, %81
  %88 = fmul <2 x double> %87, <double 5.000000e-01, double 5.000000e-01>
  %89 = fmul <2 x double> %wide.load682, %88
  %90 = fadd <2 x double> %86, %89
  %91 = getelementptr inbounds double, double* %14, i64 %58
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load686 = load <2 x double>, <2 x double>* %92, align 8, !tbaa !5, !alias.scope !34
  %93 = fcmp oge <2 x double> %wide.load686, zeroinitializer
  %94 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %wide.load686
  %95 = select <2 x i1> %93, <2 x double> %wide.load686, <2 x double> %94
  %96 = fadd <2 x double> %wide.load686, %95
  %97 = fmul <2 x double> %96, <double 5.000000e-01, double 5.000000e-01>
  %98 = fmul <2 x double> %wide.load682, %97
  %99 = fsub <2 x double> %wide.load686, %95
  %100 = fmul <2 x double> %99, <double 5.000000e-01, double 5.000000e-01>
  %101 = add nuw nsw i64 %offset.idx, %47
  %102 = getelementptr inbounds double, double* %28, i64 %101
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load687 = load <2 x double>, <2 x double>* %103, align 8, !tbaa !5, !alias.scope !32
  %104 = fmul <2 x double> %wide.load687, %100
  %105 = fadd <2 x double> %98, %104
  %106 = add nuw nsw i64 %48, %offset.idx
  %107 = getelementptr inbounds double, double* %14, i64 %106
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load688 = load <2 x double>, <2 x double>* %108, align 8, !tbaa !5, !alias.scope !34
  %109 = fcmp oge <2 x double> %wide.load688, zeroinitializer
  %110 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %wide.load688
  %111 = select <2 x i1> %109, <2 x double> %wide.load688, <2 x double> %110
  %112 = fadd <2 x double> %wide.load688, %111
  %113 = fmul <2 x double> %112, <double 5.000000e-01, double 5.000000e-01>
  %114 = getelementptr inbounds double, double* %28, i64 %106
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load689 = load <2 x double>, <2 x double>* %115, align 8, !tbaa !5, !alias.scope !32
  %116 = fmul <2 x double> %wide.load689, %113
  %117 = fsub <2 x double> %wide.load688, %111
  %118 = fmul <2 x double> %117, <double 5.000000e-01, double 5.000000e-01>
  %119 = fmul <2 x double> %wide.load682, %118
  %120 = fadd <2 x double> %116, %119
  %121 = getelementptr inbounds double, double* %6, i64 %58
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load690 = load <2 x double>, <2 x double>* %122, align 8, !tbaa !5, !alias.scope !36
  %123 = fsub <2 x double> %75, %90
  %124 = fmul <2 x double> %123, %51
  %125 = fdiv <2 x double> %124, %54
  %126 = fsub <2 x double> %wide.load690, %125
  %127 = fsub <2 x double> %105, %120
  %128 = fmul <2 x double> %51, %127
  %129 = fdiv <2 x double> %128, %57
  %130 = fsub <2 x double> %126, %129
  %131 = getelementptr inbounds double, double* %29, i64 %58
  %132 = bitcast double* %131 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !tbaa !5, !alias.scope !38, !noalias !40
  %index.next = add i64 %index, 2
  %133 = icmp eq i64 %index.next, 510
  br i1 %133, label %for.cond165.loopexit.loopexit691, label %vector.body, !llvm.loop !41

for.body172:                                      ; preds = %for.body172.preheader, %for.body172
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body172 ], [ 1, %for.body172.preheader ]
  %134 = add nuw nsw i64 %indvars.iv, %46
  %arrayidx176 = getelementptr inbounds double, double* %11, i64 %134
  %135 = load double, double* %arrayidx176, align 8, !tbaa !5
  %cmp181 = fcmp oge double %135, 0.000000e+00
  %sub = fsub double -0.000000e+00, %135
  %cond = select i1 %cmp181, double %135, double %sub
  %add191 = fadd double %135, %cond
  %mul192 = fmul double %add191, 5.000000e-01
  %arrayidx196 = getelementptr inbounds double, double* %28, i64 %134
  %136 = load double, double* %arrayidx196, align 8, !tbaa !5
  %mul197 = fmul double %136, %mul192
  %sub221 = fsub double %135, %cond
  %mul222 = fmul double %sub221, 5.000000e-01
  %137 = add nuw nsw i64 %134, 1
  %arrayidx227 = getelementptr inbounds double, double* %28, i64 %137
  %138 = load double, double* %arrayidx227, align 8, !tbaa !5
  %mul228 = fmul double %138, %mul222
  %add229 = fadd double %mul197, %mul228
  %139 = add nsw i64 %134, -1
  %arrayidx234 = getelementptr inbounds double, double* %11, i64 %139
  %140 = load double, double* %arrayidx234, align 8, !tbaa !5
  %cmp240 = fcmp oge double %140, 0.000000e+00
  %sub254 = fsub double -0.000000e+00, %140
  %cond256 = select i1 %cmp240, double %140, double %sub254
  %add257 = fadd double %140, %cond256
  %mul258 = fmul double %add257, 5.000000e-01
  %arrayidx263 = getelementptr inbounds double, double* %28, i64 %139
  %141 = load double, double* %arrayidx263, align 8, !tbaa !5
  %mul264 = fmul double %141, %mul258
  %sub292 = fsub double %140, %cond256
  %mul293 = fmul double %sub292, 5.000000e-01
  %mul298 = fmul double %136, %mul293
  %add299 = fadd double %mul264, %mul298
  %arrayidx303 = getelementptr inbounds double, double* %14, i64 %134
  %142 = load double, double* %arrayidx303, align 8, !tbaa !5
  %cmp308 = fcmp oge double %142, 0.000000e+00
  %sub320 = fsub double -0.000000e+00, %142
  %cond322 = select i1 %cmp308, double %142, double %sub320
  %add323 = fadd double %142, %cond322
  %mul324 = fmul double %add323, 5.000000e-01
  %mul329 = fmul double %136, %mul324
  %sub353 = fsub double %142, %cond322
  %mul354 = fmul double %sub353, 5.000000e-01
  %143 = add nuw nsw i64 %indvars.iv, %47
  %arrayidx359 = getelementptr inbounds double, double* %28, i64 %143
  %144 = load double, double* %arrayidx359, align 8, !tbaa !5
  %mul360 = fmul double %144, %mul354
  %add361 = fadd double %mul329, %mul360
  %145 = add nuw nsw i64 %48, %indvars.iv
  %arrayidx366 = getelementptr inbounds double, double* %14, i64 %145
  %146 = load double, double* %arrayidx366, align 8, !tbaa !5
  %cmp372 = fcmp oge double %146, 0.000000e+00
  %sub386 = fsub double -0.000000e+00, %146
  %cond388 = select i1 %cmp372, double %146, double %sub386
  %add389 = fadd double %146, %cond388
  %mul390 = fmul double %add389, 5.000000e-01
  %arrayidx395 = getelementptr inbounds double, double* %28, i64 %145
  %147 = load double, double* %arrayidx395, align 8, !tbaa !5
  %mul396 = fmul double %147, %mul390
  %sub424 = fsub double %146, %cond388
  %mul425 = fmul double %sub424, 5.000000e-01
  %mul430 = fmul double %136, %mul425
  %add431 = fadd double %mul396, %mul430
  %arrayidx435 = getelementptr inbounds double, double* %6, i64 %134
  %148 = load double, double* %arrayidx435, align 8, !tbaa !5
  %149 = load double, double* %dt.addr, align 8, !tbaa !5
  %sub436 = fsub double %add229, %add299
  %mul437 = fmul double %sub436, %149
  %150 = load double, double* %dx.addr, align 8, !tbaa !5
  %div = fdiv double %mul437, %150
  %sub438 = fsub double %148, %div
  %sub439 = fsub double %add361, %add431
  %mul440 = fmul double %149, %sub439
  %151 = load double, double* %dy.addr, align 8, !tbaa !5
  %div441 = fdiv double %mul440, %151
  %sub442 = fsub double %sub438, %div441
  %arrayidx446 = getelementptr inbounds double, double* %29, i64 %134
  store double %sub442, double* %arrayidx446, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 511
  br i1 %exitcond, label %for.cond165.loopexit.loopexit, label %for.body172, !llvm.loop !42

for.end452:                                       ; preds = %for.cond165.loopexit
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #1
  ret void
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @sw2d_shapiro_host(double* %wet, double* %etan, double %eps, double* %eta) local_unnamed_addr #0 {
entry:
  %wet.addr = alloca double*, align 8
  %etan.addr = alloca double*, align 8
  %eps.addr = alloca double, align 8
  %eta.addr = alloca double*, align 8
  store double* %wet, double** %wet.addr, align 8, !tbaa !1
  %wet.addr1 = bitcast double** %wet.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %wet.addr1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 245)
  store double* %etan, double** %etan.addr, align 8, !tbaa !1
  %etan.addr2 = bitcast double** %etan.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %etan.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 246)
  store double %eps, double* %eps.addr, align 8, !tbaa !5
  %eps.addr3 = bitcast double* %eps.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eps.addr3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 247)
  store double* %eta, double** %eta.addr, align 8, !tbaa !1
  %eta.addr4 = bitcast double** %eta.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eta.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 248)
  %0 = load double*, double** %wet.addr, align 8, !tbaa !1
  %1 = load double*, double** %eta.addr, align 8, !tbaa !1
  %2 = load double*, double** %etan.addr, align 8, !tbaa !1
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc106, %entry
  %indvars.iv158 = phi i64 [ 1, %entry ], [ %indvars.iv.next159, %for.inc106 ]
  %3 = shl i64 %indvars.iv158, 9
  %4 = add nsw i64 %3, -512
  %5 = add nuw nsw i64 %3, 512
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %6 = add nuw nsw i64 %indvars.iv, %3
  %arrayidx = getelementptr inbounds double, double* %0, i64 %6
  %7 = load double, double* %arrayidx, align 8, !tbaa !5
  %cmp8 = fcmp oeq double %7, 1.000000e+00
  %8 = add nuw nsw i64 %4, %indvars.iv
  %9 = getelementptr inbounds double, double* %2, i64 %8
  %10 = load double, double* %9, align 8, !tbaa !5
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %11 = load double, double* %eps.addr, align 8, !tbaa !5
  %mul9 = fmul double %11, 2.500000e-01
  %12 = add nuw nsw i64 %6, 1
  %arrayidx14 = getelementptr inbounds double, double* %0, i64 %12
  %13 = load double, double* %arrayidx14, align 8, !tbaa !5
  %14 = add nsw i64 %6, -1
  %arrayidx18 = getelementptr inbounds double, double* %0, i64 %14
  %15 = load double, double* %arrayidx18, align 8, !tbaa !5
  %add19 = fadd double %13, %15
  %16 = add nuw nsw i64 %5, %indvars.iv
  %arrayidx24 = getelementptr inbounds double, double* %0, i64 %16
  %17 = load double, double* %arrayidx24, align 8, !tbaa !5
  %add25 = fadd double %add19, %17
  %arrayidx30 = getelementptr inbounds double, double* %0, i64 %8
  %18 = load double, double* %arrayidx30, align 8, !tbaa !5
  %add31 = fadd double %add25, %18
  %mul32 = fmul double %mul9, %add31
  %sub33 = fsub double 1.000000e+00, %mul32
  %arrayidx37 = getelementptr inbounds double, double* %2, i64 %6
  %19 = load double, double* %arrayidx37, align 8, !tbaa !5
  %mul38 = fmul double %19, %sub33
  %arrayidx49 = getelementptr inbounds double, double* %2, i64 %12
  %20 = load double, double* %arrayidx49, align 8, !tbaa !5
  %mul50 = fmul double %13, %20
  %arrayidx60 = getelementptr inbounds double, double* %2, i64 %14
  %21 = load double, double* %arrayidx60, align 8, !tbaa !5
  %mul61 = fmul double %15, %21
  %add62 = fadd double %mul50, %mul61
  %mul63 = fmul double %mul9, %add62
  %arrayidx74 = getelementptr inbounds double, double* %2, i64 %16
  %22 = load double, double* %arrayidx74, align 8, !tbaa !5
  %mul75 = fmul double %17, %22
  %mul86 = fmul double %10, %18
  %add87 = fadd double %mul86, %mul75
  %mul88 = fmul double %mul9, %add87
  %add89 = fadd double %mul38, %mul63
  %add90 = fadd double %add89, %mul88
  br label %if.end

if.end:                                           ; preds = %for.body7, %if.then
  %.sink = phi double [ %add90, %if.then ], [ %10, %for.body7 ]
  %arrayidx105 = getelementptr inbounds double, double* %1, i64 %8
  store double %.sink, double* %arrayidx105, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 511
  br i1 %exitcond, label %for.inc106, label %for.body7

for.inc106:                                       ; preds = %if.end
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next159, 511
  br i1 %exitcond163, label %for.end108, label %for.cond5.preheader

for.end108:                                       ; preds = %for.inc106
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_updates_host(double* %h, double* %hzero, double* %eta, double* %u, double* %un, double* %v, double* %vn, double* %wet, double %hmin) local_unnamed_addr #0 {
entry:
  %h.addr = alloca double*, align 8
  %hzero.addr = alloca double*, align 8
  %eta.addr = alloca double*, align 8
  %u.addr = alloca double*, align 8
  %un.addr = alloca double*, align 8
  %v.addr = alloca double*, align 8
  %vn.addr = alloca double*, align 8
  %wet.addr = alloca double*, align 8
  %hmin.addr = alloca double, align 8
  store double* %h, double** %h.addr, align 8, !tbaa !1
  %h.addr1 = bitcast double** %h.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %h.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 292)
  store double* %hzero, double** %hzero.addr, align 8, !tbaa !1
  %hzero.addr2 = bitcast double** %hzero.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %hzero.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 293)
  store double* %eta, double** %eta.addr, align 8, !tbaa !1
  %eta.addr3 = bitcast double** %eta.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %eta.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 294)
  store double* %u, double** %u.addr, align 8, !tbaa !1
  %u.addr4 = bitcast double** %u.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %u.addr4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 295)
  store double* %un, double** %un.addr, align 8, !tbaa !1
  %un.addr5 = bitcast double** %un.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %un.addr5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 296)
  store double* %v, double** %v.addr, align 8, !tbaa !1
  %v.addr6 = bitcast double** %v.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %v.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 297)
  store double* %vn, double** %vn.addr, align 8, !tbaa !1
  %vn.addr7 = bitcast double** %vn.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %vn.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 298)
  store double* %wet, double** %wet.addr, align 8, !tbaa !1
  %wet.addr8 = bitcast double** %wet.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 299)
  store double %hmin, double* %hmin.addr, align 8, !tbaa !5
  %hmin.addr9 = bitcast double* %hmin.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %hmin.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 300)
  %0 = load double*, double** %hzero.addr, align 8, !tbaa !1
  %1 = load double*, double** %eta.addr, align 8, !tbaa !1
  %2 = load double*, double** %h.addr, align 8, !tbaa !1
  %3 = load double*, double** %wet.addr, align 8, !tbaa !1
  %4 = load double*, double** %un.addr, align 8, !tbaa !1
  %5 = load double*, double** %u.addr, align 8, !tbaa !1
  %6 = load double*, double** %vn.addr, align 8, !tbaa !1
  %7 = load double*, double** %v.addr, align 8, !tbaa !1
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond.cleanup12, %entry
  %indvars.iv84 = phi i64 [ 0, %entry ], [ %indvars.iv.next85, %for.cond.cleanup12 ]
  %8 = shl i64 %indvars.iv84, 9
  br label %for.body13

for.cond.cleanup:                                 ; preds = %for.cond.cleanup12
  ret void

for.cond.cleanup12:                               ; preds = %if.end
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, 512
  br i1 %exitcond87, label %for.cond.cleanup, label %for.cond10.preheader

for.body13:                                       ; preds = %if.end, %for.cond10.preheader
  %indvars.iv = phi i64 [ 0, %for.cond10.preheader ], [ %indvars.iv.next, %if.end ]
  %9 = add nuw nsw i64 %indvars.iv, %8
  %arrayidx = getelementptr inbounds double, double* %0, i64 %9
  %10 = load double, double* %arrayidx, align 8, !tbaa !5
  %arrayidx17 = getelementptr inbounds double, double* %1, i64 %9
  %11 = load double, double* %arrayidx17, align 8, !tbaa !5
  %add18 = fadd double %10, %11
  %arrayidx22 = getelementptr inbounds double, double* %2, i64 %9
  store double %add18, double* %arrayidx22, align 8, !tbaa !5
  %arrayidx26 = getelementptr inbounds double, double* %3, i64 %9
  store double 1.000000e+00, double* %arrayidx26, align 8, !tbaa !5
  %12 = load double, double* %arrayidx22, align 8, !tbaa !5
  %13 = load double, double* %hmin.addr, align 8, !tbaa !5
  %cmp31 = fcmp olt double %12, %13
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %for.body13
  store double 0.000000e+00, double* %arrayidx26, align 8, !tbaa !5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body13
  %arrayidx39 = getelementptr inbounds double, double* %4, i64 %9
  %14 = bitcast double* %arrayidx39 to i64*
  %15 = load i64, i64* %14, align 8, !tbaa !5
  %arrayidx43 = getelementptr inbounds double, double* %5, i64 %9
  %16 = bitcast double* %arrayidx43 to i64*
  store i64 %15, i64* %16, align 8, !tbaa !5
  %arrayidx47 = getelementptr inbounds double, double* %6, i64 %9
  %17 = bitcast double* %arrayidx47 to i64*
  %18 = load i64, i64* %17, align 8, !tbaa !5
  %arrayidx51 = getelementptr inbounds double, double* %7, i64 %9
  %19 = bitcast double* %arrayidx51 to i64*
  store i64 %18, i64* %19, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond, label %for.cond.cleanup12, label %for.body13
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nounwind }
attributes #3 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 284936)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !3, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !3, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = !{!19, !14}
!19 = distinct !{!19, !15}
!20 = !{!19}
!21 = distinct !{!21, !10, !11}
!22 = distinct !{!22, !10, !11}
!23 = !{!24}
!24 = distinct !{!24, !25}
!25 = distinct !{!25, !"LVerDomain"}
!26 = !{!27}
!27 = distinct !{!27, !25}
!28 = !{!29}
!29 = distinct !{!29, !25}
!30 = !{!31}
!31 = distinct !{!31, !25}
!32 = !{!33}
!33 = distinct !{!33, !25}
!34 = !{!35}
!35 = distinct !{!35, !25}
!36 = !{!37}
!37 = distinct !{!37, !25}
!38 = !{!39}
!39 = distinct !{!39, !25}
!40 = !{!31, !33, !35, !37, !24, !27, !29}
!41 = distinct !{!41, !10, !11}
!42 = distinct !{!42, !10, !11}
