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
@.str.6 = private unnamed_addr constant [26 x i8] c"Host arrays initialized.\0A\00", align 1
@.str.7 = private unnamed_addr constant [63 x i8] c"-------------------------------------------------------------\0A\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"100 0 2\00", section "llvm.metadata"
@.str.9 = private unnamed_addr constant [7 x i8] c"10 9 2\00", section "llvm.metadata"
@.str.10 = private unnamed_addr constant [6 x i8] c"0 0 2\00", section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @sw2d_init_data_host(double* %hzero, double* %eta, double* %etan, double* %h, double* %wet, double* %u, double* %un, double* %v, double* %vn, double %hmin, i32 %BytesPerWord) #0 {
entry:
  %hzero.addr = alloca double*, align 8, !optimi !1
  %eta.addr = alloca double*, align 8, !optimi !1
  %etan.addr = alloca double*, align 8, !optimi !1
  %h.addr = alloca double*, align 8, !optimi !1
  %wet.addr = alloca double*, align 8, !optimi !2
  %u.addr = alloca double*, align 8, !optimi !3
  %un.addr = alloca double*, align 8, !optimi !3
  %v.addr = alloca double*, align 8, !optimi !3
  %vn.addr = alloca double*, align 8, !optimi !3
  %hmin.addr = alloca double, align 8, !optimi !1
  %BytesPerWord.addr = alloca i32, align 4, !optimi !4
  %j = alloca i32, align 4, !optimi !5
  %k = alloca i32, align 4, !optimi !5
  store double* %hzero, double** %hzero.addr, align 8
  %hzero.addr1 = bitcast double** %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %hzero.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 14)
  store double* %eta, double** %eta.addr, align 8
  %eta.addr2 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %eta.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 15)
  store double* %etan, double** %etan.addr, align 8
  %etan.addr3 = bitcast double** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %etan.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 16)
  store double* %h, double** %h.addr, align 8
  %h.addr4 = bitcast double** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %h.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 17)
  store double* %wet, double** %wet.addr, align 8
  %wet.addr5 = bitcast double** %wet.addr to i8*, !optimi !2
  call void @llvm.var.annotation(i8* %wet.addr5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 18)
  store double* %u, double** %u.addr, align 8
  %u.addr6 = bitcast double** %u.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %u.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 19)
  store double* %un, double** %un.addr, align 8
  %un.addr7 = bitcast double** %un.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %un.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 20)
  store double* %v, double** %v.addr, align 8
  %v.addr8 = bitcast double** %v.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %v.addr8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 21)
  store double* %vn, double** %vn.addr, align 8
  %vn.addr9 = bitcast double** %vn.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %vn.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 22)
  store double %hmin, double* %hmin.addr, align 8
  %hmin.addr10 = bitcast double* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %hmin.addr10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 23)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4
  %BytesPerWord.addr11 = bitcast i32* %BytesPerWord.addr to i8*, !optimi !4
  call void @llvm.var.annotation(i8* %BytesPerWord.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 24)
  %j12 = bitcast i32* %j to i8*, !optimi !5
  call void @llvm.var.annotation(i8* %j12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 29)
  %k13 = bitcast i32* %k to i8*, !optimi !5
  call void @llvm.var.annotation(i8* %k13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 29)
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, i32* %j, align 4, !optimi !5
  %cmp = icmp sle i32 %0, 511, !optimi !2
  br i1 %cmp, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %k, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc, %for.body
  %1 = load i32, i32* %k, align 4, !optimi !5
  %cmp15 = icmp sle i32 %1, 511, !optimi !2
  br i1 %cmp15, label %for.body16, label %for.end

for.body16:                                       ; preds = %for.cond14
  %2 = load double*, double** %hzero.addr, align 8, !optimi !1
  %3 = load i32, i32* %j, align 4, !optimi !5
  %mul = mul nsw i32 %3, 512, !optimi !6
  %4 = load i32, i32* %k, align 4, !optimi !5
  %add = add nsw i32 %mul, %4, !optimi !7
  %idxprom = sext i32 %add to i64, !optimi !7
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom, !optimi !1
  store double 1.000000e+01, double* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body16
  %5 = load i32, i32* %k, align 4, !optimi !5
  %inc = add nsw i32 %5, 1, !optimi !8
  store i32 %inc, i32* %k, align 4
  br label %for.cond14

for.end:                                          ; preds = %for.cond14
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %6 = load i32, i32* %j, align 4, !optimi !5
  %inc18 = add nsw i32 %6, 1, !optimi !8
  store i32 %inc18, i32* %j, align 4
  br label %for.cond

for.end19:                                        ; preds = %for.cond
  store i32 0, i32* %k, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc29, %for.end19
  %7 = load i32, i32* %k, align 4, !optimi !5
  %cmp21 = icmp sle i32 %7, 511, !optimi !2
  br i1 %cmp21, label %for.body22, label %for.end31

for.body22:                                       ; preds = %for.cond20
  %8 = load double*, double** %hzero.addr, align 8, !optimi !1
  %9 = load i32, i32* %k, align 4, !optimi !5
  %add23 = add nsw i32 0, %9, !optimi !5
  %idxprom24 = sext i32 %add23 to i64, !optimi !5
  %arrayidx25 = getelementptr inbounds double, double* %8, i64 %idxprom24, !optimi !1
  store double -1.000000e+01, double* %arrayidx25, align 8
  %10 = load double*, double** %hzero.addr, align 8, !optimi !1
  %11 = load i32, i32* %k, align 4, !optimi !5
  %add26 = add nsw i32 261632, %11, !optimi !9
  %idxprom27 = sext i32 %add26 to i64, !optimi !9
  %arrayidx28 = getelementptr inbounds double, double* %10, i64 %idxprom27, !optimi !1
  store double -1.000000e+01, double* %arrayidx28, align 8
  br label %for.inc29

for.inc29:                                        ; preds = %for.body22
  %12 = load i32, i32* %k, align 4, !optimi !5
  %inc30 = add nsw i32 %12, 1, !optimi !8
  store i32 %inc30, i32* %k, align 4
  br label %for.cond20

for.end31:                                        ; preds = %for.cond20
  store i32 0, i32* %j, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc43, %for.end31
  %13 = load i32, i32* %j, align 4, !optimi !5
  %cmp33 = icmp sle i32 %13, 511, !optimi !2
  br i1 %cmp33, label %for.body34, label %for.end45

for.body34:                                       ; preds = %for.cond32
  %14 = load double*, double** %hzero.addr, align 8, !optimi !1
  %15 = load i32, i32* %j, align 4, !optimi !5
  %mul35 = mul nsw i32 %15, 512, !optimi !6
  %add36 = add nsw i32 %mul35, 0, !optimi !6
  %idxprom37 = sext i32 %add36 to i64, !optimi !6
  %arrayidx38 = getelementptr inbounds double, double* %14, i64 %idxprom37, !optimi !1
  store double -1.000000e+01, double* %arrayidx38, align 8
  %16 = load double*, double** %hzero.addr, align 8, !optimi !1
  %17 = load i32, i32* %j, align 4, !optimi !5
  %mul39 = mul nsw i32 %17, 512, !optimi !6
  %add40 = add nsw i32 %mul39, 512, !optimi !10
  %sub = sub nsw i32 %add40, 1, !optimi !11
  %idxprom41 = sext i32 %sub to i64, !optimi !11
  %arrayidx42 = getelementptr inbounds double, double* %16, i64 %idxprom41, !optimi !1
  store double -1.000000e+01, double* %arrayidx42, align 8
  br label %for.inc43

for.inc43:                                        ; preds = %for.body34
  %18 = load i32, i32* %j, align 4, !optimi !5
  %inc44 = add nsw i32 %18, 1, !optimi !8
  store i32 %inc44, i32* %j, align 4
  br label %for.cond32

for.end45:                                        ; preds = %for.cond32
  store i32 0, i32* %j, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc77, %for.end45
  %19 = load i32, i32* %j, align 4, !optimi !5
  %cmp47 = icmp sle i32 %19, 511, !optimi !2
  br i1 %cmp47, label %for.body48, label %for.end79

for.body48:                                       ; preds = %for.cond46
  store i32 0, i32* %k, align 4
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc74, %for.body48
  %20 = load i32, i32* %k, align 4, !optimi !5
  %cmp50 = icmp sle i32 %20, 511, !optimi !2
  br i1 %cmp50, label %for.body51, label %for.end76

for.body51:                                       ; preds = %for.cond49
  %21 = load double*, double** %hzero.addr, align 8, !optimi !1
  %22 = load i32, i32* %j, align 4, !optimi !5
  %mul52 = mul nsw i32 %22, 512, !optimi !6
  %23 = load i32, i32* %k, align 4, !optimi !5
  %add53 = add nsw i32 %mul52, %23, !optimi !7
  %idxprom54 = sext i32 %add53 to i64, !optimi !7
  %arrayidx55 = getelementptr inbounds double, double* %21, i64 %idxprom54, !optimi !1
  %24 = load double, double* %arrayidx55, align 8, !optimi !1
  %cmp56 = fcmp olt double 0.000000e+00, %24, !optimi !2
  br i1 %cmp56, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body51
  br label %cond.end

cond.false:                                       ; preds = %for.body51
  %25 = load double*, double** %hzero.addr, align 8, !optimi !1
  %26 = load i32, i32* %j, align 4, !optimi !5
  %mul57 = mul nsw i32 %26, 512, !optimi !6
  %27 = load i32, i32* %k, align 4, !optimi !5
  %add58 = add nsw i32 %mul57, %27, !optimi !7
  %idxprom59 = sext i32 %add58 to i64, !optimi !7
  %arrayidx60 = getelementptr inbounds double, double* %25, i64 %idxprom59, !optimi !1
  %28 = load double, double* %arrayidx60, align 8, !optimi !1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 0.000000e+00, %cond.true ], [ %28, %cond.false ], !optimi !1
  %sub61 = fsub double -0.000000e+00, %cond, !optimi !12
  %29 = load double*, double** %eta.addr, align 8, !optimi !1
  %30 = load i32, i32* %j, align 4, !optimi !5
  %mul62 = mul nsw i32 %30, 512, !optimi !6
  %31 = load i32, i32* %k, align 4, !optimi !5
  %add63 = add nsw i32 %mul62, %31, !optimi !7
  %idxprom64 = sext i32 %add63 to i64, !optimi !7
  %arrayidx65 = getelementptr inbounds double, double* %29, i64 %idxprom64, !optimi !1
  store double %sub61, double* %arrayidx65, align 8
  %32 = load double*, double** %eta.addr, align 8, !optimi !1
  %33 = load i32, i32* %j, align 4, !optimi !5
  %mul66 = mul nsw i32 %33, 512, !optimi !6
  %34 = load i32, i32* %k, align 4, !optimi !5
  %add67 = add nsw i32 %mul66, %34, !optimi !7
  %idxprom68 = sext i32 %add67 to i64, !optimi !7
  %arrayidx69 = getelementptr inbounds double, double* %32, i64 %idxprom68, !optimi !1
  %35 = load double, double* %arrayidx69, align 8, !optimi !1
  %36 = load double*, double** %etan.addr, align 8, !optimi !1
  %37 = load i32, i32* %j, align 4, !optimi !5
  %mul70 = mul nsw i32 %37, 512, !optimi !6
  %38 = load i32, i32* %k, align 4, !optimi !5
  %add71 = add nsw i32 %mul70, %38, !optimi !7
  %idxprom72 = sext i32 %add71 to i64, !optimi !7
  %arrayidx73 = getelementptr inbounds double, double* %36, i64 %idxprom72, !optimi !1
  store double %35, double* %arrayidx73, align 8
  br label %for.inc74

for.inc74:                                        ; preds = %cond.end
  %39 = load i32, i32* %k, align 4, !optimi !5
  %inc75 = add nsw i32 %39, 1, !optimi !8
  store i32 %inc75, i32* %k, align 4
  br label %for.cond49

for.end76:                                        ; preds = %for.cond49
  br label %for.inc77

for.inc77:                                        ; preds = %for.end76
  %40 = load i32, i32* %j, align 4, !optimi !5
  %inc78 = add nsw i32 %40, 1, !optimi !8
  store i32 %inc78, i32* %j, align 4
  br label %for.cond46

for.end79:                                        ; preds = %for.cond46
  store i32 0, i32* %j, align 4
  br label %for.cond80

for.cond80:                                       ; preds = %for.inc131, %for.end79
  %41 = load i32, i32* %j, align 4, !optimi !5
  %cmp81 = icmp sle i32 %41, 511, !optimi !2
  br i1 %cmp81, label %for.body82, label %for.end133

for.body82:                                       ; preds = %for.cond80
  store i32 0, i32* %k, align 4
  br label %for.cond83

for.cond83:                                       ; preds = %for.inc128, %for.body82
  %42 = load i32, i32* %k, align 4, !optimi !5
  %cmp84 = icmp sle i32 %42, 511, !optimi !2
  br i1 %cmp84, label %for.body85, label %for.end130

for.body85:                                       ; preds = %for.cond83
  %43 = load double*, double** %hzero.addr, align 8, !optimi !1
  %44 = load i32, i32* %j, align 4, !optimi !5
  %mul86 = mul nsw i32 %44, 512, !optimi !6
  %45 = load i32, i32* %k, align 4, !optimi !5
  %add87 = add nsw i32 %mul86, %45, !optimi !7
  %idxprom88 = sext i32 %add87 to i64, !optimi !7
  %arrayidx89 = getelementptr inbounds double, double* %43, i64 %idxprom88, !optimi !1
  %46 = load double, double* %arrayidx89, align 8, !optimi !1
  %47 = load double*, double** %eta.addr, align 8, !optimi !1
  %48 = load i32, i32* %j, align 4, !optimi !5
  %mul90 = mul nsw i32 %48, 512, !optimi !6
  %49 = load i32, i32* %k, align 4, !optimi !5
  %add91 = add nsw i32 %mul90, %49, !optimi !7
  %idxprom92 = sext i32 %add91 to i64, !optimi !7
  %arrayidx93 = getelementptr inbounds double, double* %47, i64 %idxprom92, !optimi !1
  %50 = load double, double* %arrayidx93, align 8, !optimi !1
  %add94 = fadd double %46, %50, !optimi !13
  %51 = load double*, double** %h.addr, align 8, !optimi !1
  %52 = load i32, i32* %j, align 4, !optimi !5
  %mul95 = mul nsw i32 %52, 512, !optimi !6
  %53 = load i32, i32* %k, align 4, !optimi !5
  %add96 = add nsw i32 %mul95, %53, !optimi !7
  %idxprom97 = sext i32 %add96 to i64, !optimi !7
  %arrayidx98 = getelementptr inbounds double, double* %51, i64 %idxprom97, !optimi !1
  store double %add94, double* %arrayidx98, align 8
  %54 = load double*, double** %wet.addr, align 8, !optimi !2
  %55 = load i32, i32* %j, align 4, !optimi !5
  %mul99 = mul nsw i32 %55, 512, !optimi !6
  %56 = load i32, i32* %k, align 4, !optimi !5
  %add100 = add nsw i32 %mul99, %56, !optimi !7
  %idxprom101 = sext i32 %add100 to i64, !optimi !7
  %arrayidx102 = getelementptr inbounds double, double* %54, i64 %idxprom101, !optimi !2
  store double 1.000000e+00, double* %arrayidx102, align 8
  %57 = load double*, double** %h.addr, align 8, !optimi !1
  %58 = load i32, i32* %j, align 4, !optimi !5
  %mul103 = mul nsw i32 %58, 512, !optimi !6
  %59 = load i32, i32* %k, align 4, !optimi !5
  %add104 = add nsw i32 %mul103, %59, !optimi !7
  %idxprom105 = sext i32 %add104 to i64, !optimi !7
  %arrayidx106 = getelementptr inbounds double, double* %57, i64 %idxprom105, !optimi !1
  %60 = load double, double* %arrayidx106, align 8, !optimi !1
  %61 = load double, double* %hmin.addr, align 8, !optimi !1
  %cmp107 = fcmp olt double %60, %61, !optimi !2
  br i1 %cmp107, label %if.then, label %if.end

if.then:                                          ; preds = %for.body85
  %62 = load double*, double** %wet.addr, align 8, !optimi !2
  %63 = load i32, i32* %j, align 4, !optimi !5
  %mul108 = mul nsw i32 %63, 512, !optimi !6
  %64 = load i32, i32* %k, align 4, !optimi !5
  %add109 = add nsw i32 %mul108, %64, !optimi !7
  %idxprom110 = sext i32 %add109 to i64, !optimi !7
  %arrayidx111 = getelementptr inbounds double, double* %62, i64 %idxprom110, !optimi !2
  store double 0.000000e+00, double* %arrayidx111, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body85
  %65 = load double*, double** %u.addr, align 8, !optimi !3
  %66 = load i32, i32* %j, align 4, !optimi !5
  %mul112 = mul nsw i32 %66, 512, !optimi !6
  %67 = load i32, i32* %k, align 4, !optimi !5
  %add113 = add nsw i32 %mul112, %67, !optimi !7
  %idxprom114 = sext i32 %add113 to i64, !optimi !7
  %arrayidx115 = getelementptr inbounds double, double* %65, i64 %idxprom114, !optimi !3
  store double 0.000000e+00, double* %arrayidx115, align 8
  %68 = load double*, double** %un.addr, align 8, !optimi !3
  %69 = load i32, i32* %j, align 4, !optimi !5
  %mul116 = mul nsw i32 %69, 512, !optimi !6
  %70 = load i32, i32* %k, align 4, !optimi !5
  %add117 = add nsw i32 %mul116, %70, !optimi !7
  %idxprom118 = sext i32 %add117 to i64, !optimi !7
  %arrayidx119 = getelementptr inbounds double, double* %68, i64 %idxprom118, !optimi !3
  store double 0.000000e+00, double* %arrayidx119, align 8
  %71 = load double*, double** %v.addr, align 8, !optimi !3
  %72 = load i32, i32* %j, align 4, !optimi !5
  %mul120 = mul nsw i32 %72, 512, !optimi !6
  %73 = load i32, i32* %k, align 4, !optimi !5
  %add121 = add nsw i32 %mul120, %73, !optimi !7
  %idxprom122 = sext i32 %add121 to i64, !optimi !7
  %arrayidx123 = getelementptr inbounds double, double* %71, i64 %idxprom122, !optimi !3
  store double 0.000000e+00, double* %arrayidx123, align 8
  %74 = load double*, double** %vn.addr, align 8, !optimi !3
  %75 = load i32, i32* %j, align 4, !optimi !5
  %mul124 = mul nsw i32 %75, 512, !optimi !6
  %76 = load i32, i32* %k, align 4, !optimi !5
  %add125 = add nsw i32 %mul124, %76, !optimi !7
  %idxprom126 = sext i32 %add125 to i64, !optimi !7
  %arrayidx127 = getelementptr inbounds double, double* %74, i64 %idxprom126, !optimi !3
  store double 0.000000e+00, double* %arrayidx127, align 8
  br label %for.inc128

for.inc128:                                       ; preds = %if.end
  %77 = load i32, i32* %k, align 4, !optimi !5
  %inc129 = add nsw i32 %77, 1, !optimi !8
  store i32 %inc129, i32* %k, align 4
  br label %for.cond83

for.end130:                                       ; preds = %for.cond83
  br label %for.inc131

for.inc131:                                       ; preds = %for.end130
  %78 = load i32, i32* %j, align 4, !optimi !5
  %inc132 = add nsw i32 %78, 1, !optimi !8
  store i32 %inc132, i32* %j, align 4
  br label %for.cond80

for.end133:                                       ; preds = %for.cond80
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i32 0, i32 0)), !optimi !14
  %call134 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.7, i32 0, i32 0)), !optimi !14
  ret void
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @sw2d_dyn_host(double %dt, double %dx, double %dy, double %g, double* %eta, double* %un, double* %u, double* %wet, double* %v, double* %vn, double* %h, double* %etan, i32 %BytesPerWord) #0 {
entry:
  %dt.addr = alloca double, align 8, !optimi !15
  %dx.addr = alloca double, align 8, !optimi !15
  %dy.addr = alloca double, align 8, !optimi !15
  %g.addr = alloca double, align 8, !optimi !16
  %eta.addr = alloca double*, align 8, !optimi !1
  %un.addr = alloca double*, align 8, !optimi !3
  %u.addr = alloca double*, align 8, !optimi !3
  %wet.addr = alloca double*, align 8, !optimi !2
  %v.addr = alloca double*, align 8, !optimi !3
  %vn.addr = alloca double*, align 8, !optimi !3
  %h.addr = alloca double*, align 8, !optimi !1
  %etan.addr = alloca double*, align 8, !optimi !1
  %BytesPerWord.addr = alloca i32, align 4, !optimi !4
  %du = alloca double*, align 8, !optimi !17
  %dv = alloca double*, align 8, !optimi !17
  %uu = alloca double, align 8, !optimi !3
  %vv = alloca double, align 8, !optimi !3
  %duu = alloca double, align 8, !optimi !17
  %dvv = alloca double, align 8, !optimi !17
  %hue = alloca double, align 8, !optimi !18
  %huw = alloca double, align 8, !optimi !18
  %hwp = alloca double, align 8, !optimi !19
  %hwn = alloca double, align 8, !optimi !19
  %hen = alloca double, align 8, !optimi !19
  %hep = alloca double, align 8, !optimi !19
  %hvn = alloca double, align 8, !optimi !18
  %hvs = alloca double, align 8, !optimi !18
  %hsp = alloca double, align 8, !optimi !19
  %hsn = alloca double, align 8, !optimi !19
  %hnn = alloca double, align 8, !optimi !19
  %hnp = alloca double, align 8, !optimi !19
  %j = alloca i32, align 4, !optimi !20
  %k = alloca i32, align 4, !optimi !20
  store double %dt, double* %dt.addr, align 8
  %dt.addr1 = bitcast double* %dt.addr to i8*, !optimi !15
  call void @llvm.var.annotation(i8* %dt.addr1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 91)
  store double %dx, double* %dx.addr, align 8
  %dx.addr2 = bitcast double* %dx.addr to i8*, !optimi !15
  call void @llvm.var.annotation(i8* %dx.addr2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 92)
  store double %dy, double* %dy.addr, align 8
  %dy.addr3 = bitcast double* %dy.addr to i8*, !optimi !15
  call void @llvm.var.annotation(i8* %dy.addr3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 93)
  store double %g, double* %g.addr, align 8
  %g.addr4 = bitcast double* %g.addr to i8*, !optimi !16
  call void @llvm.var.annotation(i8* %g.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 94)
  store double* %eta, double** %eta.addr, align 8
  %eta.addr5 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %eta.addr5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 95)
  store double* %un, double** %un.addr, align 8
  %un.addr6 = bitcast double** %un.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %un.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 96)
  store double* %u, double** %u.addr, align 8
  %u.addr7 = bitcast double** %u.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %u.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 97)
  store double* %wet, double** %wet.addr, align 8
  %wet.addr8 = bitcast double** %wet.addr to i8*, !optimi !2
  call void @llvm.var.annotation(i8* %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 98)
  store double* %v, double** %v.addr, align 8
  %v.addr9 = bitcast double** %v.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %v.addr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 99)
  store double* %vn, double** %vn.addr, align 8
  %vn.addr10 = bitcast double** %vn.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %vn.addr10, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 100)
  store double* %h, double** %h.addr, align 8
  %h.addr11 = bitcast double** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %h.addr11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 101)
  store double* %etan, double** %etan.addr, align 8
  %etan.addr12 = bitcast double** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %etan.addr12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 102)
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4
  %BytesPerWord.addr13 = bitcast i32* %BytesPerWord.addr to i8*, !optimi !4
  call void @llvm.var.annotation(i8* %BytesPerWord.addr13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 103)
  %0 = bitcast double** %du to i8**, !optimi !17
  %1 = load i32, i32* %BytesPerWord.addr, align 4, !optimi !4
  %mul = mul nsw i32 262144, %1, !optimi !21
  %conv = sext i32 %mul to i64, !optimi !21
  %call = call i32 @posix_memalign(i8** %0, i64 64, i64 %conv) #1, !optimi !22
  %2 = bitcast double** %dv to i8**, !optimi !17
  %3 = load i32, i32* %BytesPerWord.addr, align 4, !optimi !4
  %mul14 = mul nsw i32 262144, %3, !optimi !21
  %conv15 = sext i32 %mul14 to i64, !optimi !21
  %call16 = call i32 @posix_memalign(i8** %2, i64 64, i64 %conv15) #1, !optimi !22
  store i32 1, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc53, %entry
  %4 = load i32, i32* %j, align 4, !optimi !20
  %cmp = icmp sle i32 %4, 510, !optimi !2
  br i1 %cmp, label %for.body, label %for.end55

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %k, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc, %for.body
  %5 = load i32, i32* %k, align 4, !optimi !20
  %cmp19 = icmp sle i32 %5, 510, !optimi !2
  br i1 %cmp19, label %for.body21, label %for.end

for.body21:                                       ; preds = %for.cond18
  %6 = load double, double* %dt.addr, align 8, !optimi !15
  %sub = fsub double -0.000000e+00, %6, !optimi !23
  %7 = load double, double* %g.addr, align 8, !optimi !16
  %mul22 = fmul double %sub, %7, !optimi !24
  %8 = load double*, double** %eta.addr, align 8, !optimi !1
  %9 = load i32, i32* %j, align 4, !optimi !20
  %mul23 = mul nsw i32 %9, 512, !optimi !25
  %10 = load i32, i32* %k, align 4, !optimi !20
  %add = add nsw i32 %mul23, %10, !optimi !26
  %add24 = add nsw i32 %add, 1, !optimi !27
  %idxprom = sext i32 %add24 to i64, !optimi !27
  %arrayidx = getelementptr inbounds double, double* %8, i64 %idxprom, !optimi !1
  %11 = load double, double* %arrayidx, align 8, !optimi !1
  %12 = load double*, double** %eta.addr, align 8, !optimi !1
  %13 = load i32, i32* %j, align 4, !optimi !20
  %mul25 = mul nsw i32 %13, 512, !optimi !25
  %14 = load i32, i32* %k, align 4, !optimi !20
  %add26 = add nsw i32 %mul25, %14, !optimi !26
  %idxprom27 = sext i32 %add26 to i64, !optimi !26
  %arrayidx28 = getelementptr inbounds double, double* %12, i64 %idxprom27, !optimi !1
  %15 = load double, double* %arrayidx28, align 8, !optimi !1
  %sub29 = fsub double %11, %15, !optimi !28
  %mul30 = fmul double %mul22, %sub29, !optimi !29
  %16 = load double, double* %dx.addr, align 8, !optimi !15
  %div = fdiv double %mul30, %16, !optimi !17
  %17 = load double*, double** %du, align 8, !optimi !17
  %18 = load i32, i32* %j, align 4, !optimi !20
  %mul31 = mul nsw i32 %18, 512, !optimi !25
  %19 = load i32, i32* %k, align 4, !optimi !20
  %add32 = add nsw i32 %mul31, %19, !optimi !26
  %idxprom33 = sext i32 %add32 to i64, !optimi !26
  %arrayidx34 = getelementptr inbounds double, double* %17, i64 %idxprom33, !optimi !17
  store double %div, double* %arrayidx34, align 8
  %20 = load double, double* %dt.addr, align 8, !optimi !15
  %sub35 = fsub double -0.000000e+00, %20, !optimi !23
  %21 = load double, double* %g.addr, align 8, !optimi !16
  %mul36 = fmul double %sub35, %21, !optimi !24
  %22 = load double*, double** %eta.addr, align 8, !optimi !1
  %23 = load i32, i32* %j, align 4, !optimi !20
  %add37 = add nsw i32 %23, 1, !optimi !30
  %mul38 = mul nsw i32 %add37, 512, !optimi !31
  %24 = load i32, i32* %k, align 4, !optimi !20
  %add39 = add nsw i32 %mul38, %24, !optimi !32
  %idxprom40 = sext i32 %add39 to i64, !optimi !32
  %arrayidx41 = getelementptr inbounds double, double* %22, i64 %idxprom40, !optimi !1
  %25 = load double, double* %arrayidx41, align 8, !optimi !1
  %26 = load double*, double** %eta.addr, align 8, !optimi !1
  %27 = load i32, i32* %j, align 4, !optimi !20
  %mul42 = mul nsw i32 %27, 512, !optimi !25
  %28 = load i32, i32* %k, align 4, !optimi !20
  %add43 = add nsw i32 %mul42, %28, !optimi !26
  %idxprom44 = sext i32 %add43 to i64, !optimi !26
  %arrayidx45 = getelementptr inbounds double, double* %26, i64 %idxprom44, !optimi !1
  %29 = load double, double* %arrayidx45, align 8, !optimi !1
  %sub46 = fsub double %25, %29, !optimi !28
  %mul47 = fmul double %mul36, %sub46, !optimi !29
  %30 = load double, double* %dy.addr, align 8, !optimi !15
  %div48 = fdiv double %mul47, %30, !optimi !17
  %31 = load double*, double** %dv, align 8, !optimi !17
  %32 = load i32, i32* %j, align 4, !optimi !20
  %mul49 = mul nsw i32 %32, 512, !optimi !25
  %33 = load i32, i32* %k, align 4, !optimi !20
  %add50 = add nsw i32 %mul49, %33, !optimi !26
  %idxprom51 = sext i32 %add50 to i64, !optimi !26
  %arrayidx52 = getelementptr inbounds double, double* %31, i64 %idxprom51, !optimi !17
  store double %div48, double* %arrayidx52, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body21
  %34 = load i32, i32* %k, align 4, !optimi !20
  %inc = add nsw i32 %34, 1, !optimi !30
  store i32 %inc, i32* %k, align 4
  br label %for.cond18

for.end:                                          ; preds = %for.cond18
  br label %for.inc53

for.inc53:                                        ; preds = %for.end
  %35 = load i32, i32* %j, align 4, !optimi !20
  %inc54 = add nsw i32 %35, 1, !optimi !30
  store i32 %inc54, i32* %j, align 4
  br label %for.cond

for.end55:                                        ; preds = %for.cond
  store i32 1, i32* %j, align 4
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc172, %for.end55
  %36 = load i32, i32* %j, align 4, !optimi !20
  %cmp57 = icmp sle i32 %36, 510, !optimi !2
  br i1 %cmp57, label %for.body59, label %for.end174

for.body59:                                       ; preds = %for.cond56
  store i32 1, i32* %k, align 4
  br label %for.cond60

for.cond60:                                       ; preds = %for.inc169, %for.body59
  %37 = load i32, i32* %k, align 4, !optimi !20
  %cmp61 = icmp sle i32 %37, 510, !optimi !2
  br i1 %cmp61, label %for.body63, label %for.end171

for.body63:                                       ; preds = %for.cond60
  %38 = load double*, double** %un.addr, align 8, !optimi !3
  %39 = load i32, i32* %j, align 4, !optimi !20
  %mul64 = mul nsw i32 %39, 512, !optimi !25
  %40 = load i32, i32* %k, align 4, !optimi !20
  %add65 = add nsw i32 %mul64, %40, !optimi !26
  %idxprom66 = sext i32 %add65 to i64, !optimi !26
  %arrayidx67 = getelementptr inbounds double, double* %38, i64 %idxprom66, !optimi !3
  store double 0.000000e+00, double* %arrayidx67, align 8
  %41 = load double*, double** %u.addr, align 8, !optimi !3
  %42 = load i32, i32* %j, align 4, !optimi !20
  %mul68 = mul nsw i32 %42, 512, !optimi !25
  %43 = load i32, i32* %k, align 4, !optimi !20
  %add69 = add nsw i32 %mul68, %43, !optimi !26
  %idxprom70 = sext i32 %add69 to i64, !optimi !26
  %arrayidx71 = getelementptr inbounds double, double* %41, i64 %idxprom70, !optimi !3
  %44 = load double, double* %arrayidx71, align 8, !optimi !3
  store double %44, double* %uu, align 8
  %45 = load double*, double** %du, align 8, !optimi !17
  %46 = load i32, i32* %j, align 4, !optimi !20
  %mul72 = mul nsw i32 %46, 512, !optimi !25
  %47 = load i32, i32* %k, align 4, !optimi !20
  %add73 = add nsw i32 %mul72, %47, !optimi !26
  %idxprom74 = sext i32 %add73 to i64, !optimi !26
  %arrayidx75 = getelementptr inbounds double, double* %45, i64 %idxprom74, !optimi !17
  %48 = load double, double* %arrayidx75, align 8, !optimi !17
  store double %48, double* %duu, align 8
  %49 = load double*, double** %wet.addr, align 8, !optimi !2
  %50 = load i32, i32* %j, align 4, !optimi !20
  %mul76 = mul nsw i32 %50, 512, !optimi !25
  %51 = load i32, i32* %k, align 4, !optimi !20
  %add77 = add nsw i32 %mul76, %51, !optimi !26
  %idxprom78 = sext i32 %add77 to i64, !optimi !26
  %arrayidx79 = getelementptr inbounds double, double* %49, i64 %idxprom78, !optimi !2
  %52 = load double, double* %arrayidx79, align 8, !optimi !2
  %cmp80 = fcmp oeq double %52, 1.000000e+00, !optimi !2
  br i1 %cmp80, label %if.then, label %if.else

if.then:                                          ; preds = %for.body63
  %53 = load double*, double** %wet.addr, align 8, !optimi !2
  %54 = load i32, i32* %j, align 4, !optimi !20
  %mul82 = mul nsw i32 %54, 512, !optimi !25
  %55 = load i32, i32* %k, align 4, !optimi !20
  %add83 = add nsw i32 %mul82, %55, !optimi !26
  %add84 = add nsw i32 %add83, 1, !optimi !27
  %idxprom85 = sext i32 %add84 to i64, !optimi !27
  %arrayidx86 = getelementptr inbounds double, double* %53, i64 %idxprom85, !optimi !2
  %56 = load double, double* %arrayidx86, align 8, !optimi !2
  %cmp87 = fcmp oeq double %56, 1.000000e+00, !optimi !2
  br i1 %cmp87, label %if.then91, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %57 = load double, double* %duu, align 8, !optimi !17
  %cmp89 = fcmp ogt double %57, 0.000000e+00, !optimi !2
  br i1 %cmp89, label %if.then91, label %if.end

if.then91:                                        ; preds = %lor.lhs.false, %if.then
  %58 = load double, double* %uu, align 8, !optimi !3
  %59 = load double, double* %duu, align 8, !optimi !17
  %add92 = fadd double %58, %59, !optimi !17
  %60 = load double*, double** %un.addr, align 8, !optimi !3
  %61 = load i32, i32* %j, align 4, !optimi !20
  %mul93 = mul nsw i32 %61, 512, !optimi !25
  %62 = load i32, i32* %k, align 4, !optimi !20
  %add94 = add nsw i32 %mul93, %62, !optimi !26
  %idxprom95 = sext i32 %add94 to i64, !optimi !26
  %arrayidx96 = getelementptr inbounds double, double* %60, i64 %idxprom95, !optimi !3
  store double %add92, double* %arrayidx96, align 8
  br label %if.end

if.end:                                           ; preds = %if.then91, %lor.lhs.false
  br label %if.end113

if.else:                                          ; preds = %for.body63
  %63 = load double*, double** %wet.addr, align 8, !optimi !2
  %64 = load i32, i32* %j, align 4, !optimi !20
  %mul97 = mul nsw i32 %64, 512, !optimi !25
  %65 = load i32, i32* %k, align 4, !optimi !20
  %add98 = add nsw i32 %mul97, %65, !optimi !26
  %add99 = add nsw i32 %add98, 1, !optimi !27
  %idxprom100 = sext i32 %add99 to i64, !optimi !27
  %arrayidx101 = getelementptr inbounds double, double* %63, i64 %idxprom100, !optimi !2
  %66 = load double, double* %arrayidx101, align 8, !optimi !2
  %cmp102 = fcmp oeq double %66, 1.000000e+00, !optimi !2
  br i1 %cmp102, label %land.lhs.true, label %if.end112

land.lhs.true:                                    ; preds = %if.else
  %67 = load double, double* %duu, align 8, !optimi !17
  %cmp104 = fcmp olt double %67, 0.000000e+00, !optimi !2
  br i1 %cmp104, label %if.then106, label %if.end112

if.then106:                                       ; preds = %land.lhs.true
  %68 = load double, double* %uu, align 8, !optimi !3
  %69 = load double, double* %duu, align 8, !optimi !17
  %add107 = fadd double %68, %69, !optimi !17
  %70 = load double*, double** %un.addr, align 8, !optimi !3
  %71 = load i32, i32* %j, align 4, !optimi !20
  %mul108 = mul nsw i32 %71, 512, !optimi !25
  %72 = load i32, i32* %k, align 4, !optimi !20
  %add109 = add nsw i32 %mul108, %72, !optimi !26
  %idxprom110 = sext i32 %add109 to i64, !optimi !26
  %arrayidx111 = getelementptr inbounds double, double* %70, i64 %idxprom110, !optimi !3
  store double %add107, double* %arrayidx111, align 8
  br label %if.end112

if.end112:                                        ; preds = %if.then106, %land.lhs.true, %if.else
  br label %if.end113

if.end113:                                        ; preds = %if.end112, %if.end
  %73 = load double*, double** %vn.addr, align 8, !optimi !3
  %74 = load i32, i32* %j, align 4, !optimi !20
  %mul114 = mul nsw i32 %74, 512, !optimi !25
  %75 = load i32, i32* %k, align 4, !optimi !20
  %add115 = add nsw i32 %mul114, %75, !optimi !26
  %idxprom116 = sext i32 %add115 to i64, !optimi !26
  %arrayidx117 = getelementptr inbounds double, double* %73, i64 %idxprom116, !optimi !3
  store double 0.000000e+00, double* %arrayidx117, align 8
  %76 = load double*, double** %v.addr, align 8, !optimi !3
  %77 = load i32, i32* %j, align 4, !optimi !20
  %mul118 = mul nsw i32 %77, 512, !optimi !25
  %78 = load i32, i32* %k, align 4, !optimi !20
  %add119 = add nsw i32 %mul118, %78, !optimi !26
  %idxprom120 = sext i32 %add119 to i64, !optimi !26
  %arrayidx121 = getelementptr inbounds double, double* %76, i64 %idxprom120, !optimi !3
  %79 = load double, double* %arrayidx121, align 8, !optimi !3
  store double %79, double* %vv, align 8
  %80 = load double*, double** %dv, align 8, !optimi !17
  %81 = load i32, i32* %j, align 4, !optimi !20
  %mul122 = mul nsw i32 %81, 512, !optimi !25
  %82 = load i32, i32* %k, align 4, !optimi !20
  %add123 = add nsw i32 %mul122, %82, !optimi !26
  %idxprom124 = sext i32 %add123 to i64, !optimi !26
  %arrayidx125 = getelementptr inbounds double, double* %80, i64 %idxprom124, !optimi !17
  %83 = load double, double* %arrayidx125, align 8, !optimi !17
  store double %83, double* %dvv, align 8
  %84 = load double*, double** %wet.addr, align 8, !optimi !2
  %85 = load i32, i32* %j, align 4, !optimi !20
  %mul126 = mul nsw i32 %85, 512, !optimi !25
  %86 = load i32, i32* %k, align 4, !optimi !20
  %add127 = add nsw i32 %mul126, %86, !optimi !26
  %idxprom128 = sext i32 %add127 to i64, !optimi !26
  %arrayidx129 = getelementptr inbounds double, double* %84, i64 %idxprom128, !optimi !2
  %87 = load double, double* %arrayidx129, align 8, !optimi !2
  %cmp130 = fcmp oeq double %87, 1.000000e+00, !optimi !2
  br i1 %cmp130, label %if.then132, label %if.else150

if.then132:                                       ; preds = %if.end113
  %88 = load double*, double** %wet.addr, align 8, !optimi !2
  %89 = load i32, i32* %j, align 4, !optimi !20
  %mul133 = mul nsw i32 %89, 512, !optimi !25
  %90 = load i32, i32* %k, align 4, !optimi !20
  %add134 = add nsw i32 %mul133, %90, !optimi !26
  %add135 = add nsw i32 %add134, 1, !optimi !27
  %idxprom136 = sext i32 %add135 to i64, !optimi !27
  %arrayidx137 = getelementptr inbounds double, double* %88, i64 %idxprom136, !optimi !2
  %91 = load double, double* %arrayidx137, align 8, !optimi !2
  %cmp138 = fcmp oeq double %91, 1.000000e+00, !optimi !2
  br i1 %cmp138, label %if.then143, label %lor.lhs.false140

lor.lhs.false140:                                 ; preds = %if.then132
  %92 = load double, double* %dvv, align 8, !optimi !17
  %cmp141 = fcmp ogt double %92, 0.000000e+00, !optimi !2
  br i1 %cmp141, label %if.then143, label %if.end149

if.then143:                                       ; preds = %lor.lhs.false140, %if.then132
  %93 = load double, double* %vv, align 8, !optimi !3
  %94 = load double, double* %dvv, align 8, !optimi !17
  %add144 = fadd double %93, %94, !optimi !17
  %95 = load double*, double** %vn.addr, align 8, !optimi !3
  %96 = load i32, i32* %j, align 4, !optimi !20
  %mul145 = mul nsw i32 %96, 512, !optimi !25
  %97 = load i32, i32* %k, align 4, !optimi !20
  %add146 = add nsw i32 %mul145, %97, !optimi !26
  %idxprom147 = sext i32 %add146 to i64, !optimi !26
  %arrayidx148 = getelementptr inbounds double, double* %95, i64 %idxprom147, !optimi !3
  store double %add144, double* %arrayidx148, align 8
  br label %if.end149

if.end149:                                        ; preds = %if.then143, %lor.lhs.false140
  br label %if.end168

if.else150:                                       ; preds = %if.end113
  %98 = load double*, double** %wet.addr, align 8, !optimi !2
  %99 = load i32, i32* %j, align 4, !optimi !20
  %mul151 = mul nsw i32 %99, 512, !optimi !25
  %100 = load i32, i32* %k, align 4, !optimi !20
  %add152 = add nsw i32 %mul151, %100, !optimi !26
  %add153 = add nsw i32 %add152, 1, !optimi !27
  %idxprom154 = sext i32 %add153 to i64, !optimi !27
  %arrayidx155 = getelementptr inbounds double, double* %98, i64 %idxprom154, !optimi !2
  %101 = load double, double* %arrayidx155, align 8, !optimi !2
  %cmp156 = fcmp oeq double %101, 1.000000e+00, !optimi !2
  br i1 %cmp156, label %land.lhs.true158, label %if.end167

land.lhs.true158:                                 ; preds = %if.else150
  %102 = load double, double* %dvv, align 8, !optimi !17
  %cmp159 = fcmp olt double %102, 0.000000e+00, !optimi !2
  br i1 %cmp159, label %if.then161, label %if.end167

if.then161:                                       ; preds = %land.lhs.true158
  %103 = load double, double* %vv, align 8, !optimi !3
  %104 = load double, double* %dvv, align 8, !optimi !17
  %add162 = fadd double %103, %104, !optimi !17
  %105 = load double*, double** %vn.addr, align 8, !optimi !3
  %106 = load i32, i32* %j, align 4, !optimi !20
  %mul163 = mul nsw i32 %106, 512, !optimi !25
  %107 = load i32, i32* %k, align 4, !optimi !20
  %add164 = add nsw i32 %mul163, %107, !optimi !26
  %idxprom165 = sext i32 %add164 to i64, !optimi !26
  %arrayidx166 = getelementptr inbounds double, double* %105, i64 %idxprom165, !optimi !3
  store double %add162, double* %arrayidx166, align 8
  br label %if.end167

if.end167:                                        ; preds = %if.then161, %land.lhs.true158, %if.else150
  br label %if.end168

if.end168:                                        ; preds = %if.end167, %if.end149
  br label %for.inc169

for.inc169:                                       ; preds = %if.end168
  %108 = load i32, i32* %k, align 4, !optimi !20
  %inc170 = add nsw i32 %108, 1, !optimi !30
  store i32 %inc170, i32* %k, align 4
  br label %for.cond60

for.end171:                                       ; preds = %for.cond60
  br label %for.inc172

for.inc172:                                       ; preds = %for.end171
  %109 = load i32, i32* %j, align 4, !optimi !20
  %inc173 = add nsw i32 %109, 1, !optimi !30
  store i32 %inc173, i32* %j, align 4
  br label %for.cond56

for.end174:                                       ; preds = %for.cond56
  store i32 1, i32* %j, align 4
  br label %for.cond175

for.cond175:                                      ; preds = %for.inc462, %for.end174
  %110 = load i32, i32* %j, align 4, !optimi !20
  %cmp176 = icmp sle i32 %110, 510, !optimi !2
  br i1 %cmp176, label %for.body178, label %for.end464

for.body178:                                      ; preds = %for.cond175
  store i32 1, i32* %k, align 4
  br label %for.cond179

for.cond179:                                      ; preds = %for.inc459, %for.body178
  %111 = load i32, i32* %k, align 4, !optimi !20
  %cmp180 = icmp sle i32 %111, 510, !optimi !2
  br i1 %cmp180, label %for.body182, label %for.end461

for.body182:                                      ; preds = %for.cond179
  %112 = load double*, double** %un.addr, align 8, !optimi !3
  %113 = load i32, i32* %j, align 4, !optimi !20
  %mul183 = mul nsw i32 %113, 512, !optimi !25
  %114 = load i32, i32* %k, align 4, !optimi !20
  %add184 = add nsw i32 %mul183, %114, !optimi !26
  %idxprom185 = sext i32 %add184 to i64, !optimi !26
  %arrayidx186 = getelementptr inbounds double, double* %112, i64 %idxprom185, !optimi !3
  %115 = load double, double* %arrayidx186, align 8, !optimi !3
  %116 = load double*, double** %un.addr, align 8, !optimi !3
  %117 = load i32, i32* %j, align 4, !optimi !20
  %mul187 = mul nsw i32 %117, 512, !optimi !25
  %118 = load i32, i32* %k, align 4, !optimi !20
  %add188 = add nsw i32 %mul187, %118, !optimi !26
  %idxprom189 = sext i32 %add188 to i64, !optimi !26
  %arrayidx190 = getelementptr inbounds double, double* %116, i64 %idxprom189, !optimi !3
  %119 = load double, double* %arrayidx190, align 8, !optimi !3
  %cmp191 = fcmp oge double %119, 0.000000e+00, !optimi !2
  br i1 %cmp191, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body182
  %120 = load double*, double** %un.addr, align 8, !optimi !3
  %121 = load i32, i32* %j, align 4, !optimi !20
  %mul193 = mul nsw i32 %121, 512, !optimi !25
  %122 = load i32, i32* %k, align 4, !optimi !20
  %add194 = add nsw i32 %mul193, %122, !optimi !26
  %idxprom195 = sext i32 %add194 to i64, !optimi !26
  %arrayidx196 = getelementptr inbounds double, double* %120, i64 %idxprom195, !optimi !3
  %123 = load double, double* %arrayidx196, align 8, !optimi !3
  br label %cond.end

cond.false:                                       ; preds = %for.body182
  %124 = load double*, double** %un.addr, align 8, !optimi !3
  %125 = load i32, i32* %j, align 4, !optimi !20
  %mul197 = mul nsw i32 %125, 512, !optimi !25
  %126 = load i32, i32* %k, align 4, !optimi !20
  %add198 = add nsw i32 %mul197, %126, !optimi !26
  %idxprom199 = sext i32 %add198 to i64, !optimi !26
  %arrayidx200 = getelementptr inbounds double, double* %124, i64 %idxprom199, !optimi !3
  %127 = load double, double* %arrayidx200, align 8, !optimi !3
  %sub201 = fsub double -0.000000e+00, %127, !optimi !3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %123, %cond.true ], [ %sub201, %cond.false ], !optimi !3
  %add202 = fadd double %115, %cond, !optimi !33
  %mul203 = fmul double 5.000000e-01, %add202, !optimi !3
  %128 = load double*, double** %h.addr, align 8, !optimi !1
  %129 = load i32, i32* %j, align 4, !optimi !20
  %mul204 = mul nsw i32 %129, 512, !optimi !25
  %130 = load i32, i32* %k, align 4, !optimi !20
  %add205 = add nsw i32 %mul204, %130, !optimi !26
  %idxprom206 = sext i32 %add205 to i64, !optimi !26
  %arrayidx207 = getelementptr inbounds double, double* %128, i64 %idxprom206, !optimi !1
  %131 = load double, double* %arrayidx207, align 8, !optimi !1
  %mul208 = fmul double %mul203, %131, !optimi !19
  store double %mul208, double* %hep, align 8
  %132 = load double*, double** %un.addr, align 8, !optimi !3
  %133 = load i32, i32* %j, align 4, !optimi !20
  %mul209 = mul nsw i32 %133, 512, !optimi !25
  %134 = load i32, i32* %k, align 4, !optimi !20
  %add210 = add nsw i32 %mul209, %134, !optimi !26
  %idxprom211 = sext i32 %add210 to i64, !optimi !26
  %arrayidx212 = getelementptr inbounds double, double* %132, i64 %idxprom211, !optimi !3
  %135 = load double, double* %arrayidx212, align 8, !optimi !3
  %136 = load double*, double** %un.addr, align 8, !optimi !3
  %137 = load i32, i32* %j, align 4, !optimi !20
  %mul213 = mul nsw i32 %137, 512, !optimi !25
  %138 = load i32, i32* %k, align 4, !optimi !20
  %add214 = add nsw i32 %mul213, %138, !optimi !26
  %idxprom215 = sext i32 %add214 to i64, !optimi !26
  %arrayidx216 = getelementptr inbounds double, double* %136, i64 %idxprom215, !optimi !3
  %139 = load double, double* %arrayidx216, align 8, !optimi !3
  %cmp217 = fcmp oge double %139, 0.000000e+00, !optimi !2
  br i1 %cmp217, label %cond.true219, label %cond.false224

cond.true219:                                     ; preds = %cond.end
  %140 = load double*, double** %un.addr, align 8, !optimi !3
  %141 = load i32, i32* %j, align 4, !optimi !20
  %mul220 = mul nsw i32 %141, 512, !optimi !25
  %142 = load i32, i32* %k, align 4, !optimi !20
  %add221 = add nsw i32 %mul220, %142, !optimi !26
  %idxprom222 = sext i32 %add221 to i64, !optimi !26
  %arrayidx223 = getelementptr inbounds double, double* %140, i64 %idxprom222, !optimi !3
  %143 = load double, double* %arrayidx223, align 8, !optimi !3
  br label %cond.end230

cond.false224:                                    ; preds = %cond.end
  %144 = load double*, double** %un.addr, align 8, !optimi !3
  %145 = load i32, i32* %j, align 4, !optimi !20
  %mul225 = mul nsw i32 %145, 512, !optimi !25
  %146 = load i32, i32* %k, align 4, !optimi !20
  %add226 = add nsw i32 %mul225, %146, !optimi !26
  %idxprom227 = sext i32 %add226 to i64, !optimi !26
  %arrayidx228 = getelementptr inbounds double, double* %144, i64 %idxprom227, !optimi !3
  %147 = load double, double* %arrayidx228, align 8, !optimi !3
  %sub229 = fsub double -0.000000e+00, %147, !optimi !3
  br label %cond.end230

cond.end230:                                      ; preds = %cond.false224, %cond.true219
  %cond231 = phi double [ %143, %cond.true219 ], [ %sub229, %cond.false224 ], !optimi !3
  %sub232 = fsub double %135, %cond231, !optimi !33
  %mul233 = fmul double 5.000000e-01, %sub232, !optimi !3
  %148 = load double*, double** %h.addr, align 8, !optimi !1
  %149 = load i32, i32* %j, align 4, !optimi !20
  %mul234 = mul nsw i32 %149, 512, !optimi !25
  %150 = load i32, i32* %k, align 4, !optimi !20
  %add235 = add nsw i32 %mul234, %150, !optimi !26
  %add236 = add nsw i32 %add235, 1, !optimi !27
  %idxprom237 = sext i32 %add236 to i64, !optimi !27
  %arrayidx238 = getelementptr inbounds double, double* %148, i64 %idxprom237, !optimi !1
  %151 = load double, double* %arrayidx238, align 8, !optimi !1
  %mul239 = fmul double %mul233, %151, !optimi !19
  store double %mul239, double* %hen, align 8
  %152 = load double, double* %hep, align 8, !optimi !19
  %153 = load double, double* %hen, align 8, !optimi !19
  %add240 = fadd double %152, %153, !optimi !18
  store double %add240, double* %hue, align 8
  %154 = load double*, double** %un.addr, align 8, !optimi !3
  %155 = load i32, i32* %j, align 4, !optimi !20
  %mul241 = mul nsw i32 %155, 512, !optimi !25
  %156 = load i32, i32* %k, align 4, !optimi !20
  %add242 = add nsw i32 %mul241, %156, !optimi !26
  %sub243 = sub nsw i32 %add242, 1, !optimi !25
  %idxprom244 = sext i32 %sub243 to i64, !optimi !25
  %arrayidx245 = getelementptr inbounds double, double* %154, i64 %idxprom244, !optimi !3
  %157 = load double, double* %arrayidx245, align 8, !optimi !3
  %158 = load double*, double** %un.addr, align 8, !optimi !3
  %159 = load i32, i32* %j, align 4, !optimi !20
  %mul246 = mul nsw i32 %159, 512, !optimi !25
  %160 = load i32, i32* %k, align 4, !optimi !20
  %add247 = add nsw i32 %mul246, %160, !optimi !26
  %sub248 = sub nsw i32 %add247, 1, !optimi !25
  %idxprom249 = sext i32 %sub248 to i64, !optimi !25
  %arrayidx250 = getelementptr inbounds double, double* %158, i64 %idxprom249, !optimi !3
  %161 = load double, double* %arrayidx250, align 8, !optimi !3
  %cmp251 = fcmp oge double %161, 0.000000e+00, !optimi !2
  br i1 %cmp251, label %cond.true253, label %cond.false259

cond.true253:                                     ; preds = %cond.end230
  %162 = load double*, double** %un.addr, align 8, !optimi !3
  %163 = load i32, i32* %j, align 4, !optimi !20
  %mul254 = mul nsw i32 %163, 512, !optimi !25
  %164 = load i32, i32* %k, align 4, !optimi !20
  %add255 = add nsw i32 %mul254, %164, !optimi !26
  %sub256 = sub nsw i32 %add255, 1, !optimi !25
  %idxprom257 = sext i32 %sub256 to i64, !optimi !25
  %arrayidx258 = getelementptr inbounds double, double* %162, i64 %idxprom257, !optimi !3
  %165 = load double, double* %arrayidx258, align 8, !optimi !3
  br label %cond.end266

cond.false259:                                    ; preds = %cond.end230
  %166 = load double*, double** %un.addr, align 8, !optimi !3
  %167 = load i32, i32* %j, align 4, !optimi !20
  %mul260 = mul nsw i32 %167, 512, !optimi !25
  %168 = load i32, i32* %k, align 4, !optimi !20
  %add261 = add nsw i32 %mul260, %168, !optimi !26
  %sub262 = sub nsw i32 %add261, 1, !optimi !25
  %idxprom263 = sext i32 %sub262 to i64, !optimi !25
  %arrayidx264 = getelementptr inbounds double, double* %166, i64 %idxprom263, !optimi !3
  %169 = load double, double* %arrayidx264, align 8, !optimi !3
  %sub265 = fsub double -0.000000e+00, %169, !optimi !3
  br label %cond.end266

cond.end266:                                      ; preds = %cond.false259, %cond.true253
  %cond267 = phi double [ %165, %cond.true253 ], [ %sub265, %cond.false259 ], !optimi !3
  %add268 = fadd double %157, %cond267, !optimi !33
  %mul269 = fmul double 5.000000e-01, %add268, !optimi !3
  %170 = load double*, double** %h.addr, align 8, !optimi !1
  %171 = load i32, i32* %j, align 4, !optimi !20
  %mul270 = mul nsw i32 %171, 512, !optimi !25
  %172 = load i32, i32* %k, align 4, !optimi !20
  %add271 = add nsw i32 %mul270, %172, !optimi !26
  %sub272 = sub nsw i32 %add271, 1, !optimi !25
  %idxprom273 = sext i32 %sub272 to i64, !optimi !25
  %arrayidx274 = getelementptr inbounds double, double* %170, i64 %idxprom273, !optimi !1
  %173 = load double, double* %arrayidx274, align 8, !optimi !1
  %mul275 = fmul double %mul269, %173, !optimi !19
  store double %mul275, double* %hwp, align 8
  %174 = load double*, double** %un.addr, align 8, !optimi !3
  %175 = load i32, i32* %j, align 4, !optimi !20
  %mul276 = mul nsw i32 %175, 512, !optimi !25
  %176 = load i32, i32* %k, align 4, !optimi !20
  %add277 = add nsw i32 %mul276, %176, !optimi !26
  %sub278 = sub nsw i32 %add277, 1, !optimi !25
  %idxprom279 = sext i32 %sub278 to i64, !optimi !25
  %arrayidx280 = getelementptr inbounds double, double* %174, i64 %idxprom279, !optimi !3
  %177 = load double, double* %arrayidx280, align 8, !optimi !3
  %178 = load double*, double** %un.addr, align 8, !optimi !3
  %179 = load i32, i32* %j, align 4, !optimi !20
  %mul281 = mul nsw i32 %179, 512, !optimi !25
  %180 = load i32, i32* %k, align 4, !optimi !20
  %add282 = add nsw i32 %mul281, %180, !optimi !26
  %sub283 = sub nsw i32 %add282, 1, !optimi !25
  %idxprom284 = sext i32 %sub283 to i64, !optimi !25
  %arrayidx285 = getelementptr inbounds double, double* %178, i64 %idxprom284, !optimi !3
  %181 = load double, double* %arrayidx285, align 8, !optimi !3
  %cmp286 = fcmp oge double %181, 0.000000e+00, !optimi !2
  br i1 %cmp286, label %cond.true288, label %cond.false294

cond.true288:                                     ; preds = %cond.end266
  %182 = load double*, double** %un.addr, align 8, !optimi !3
  %183 = load i32, i32* %j, align 4, !optimi !20
  %mul289 = mul nsw i32 %183, 512, !optimi !25
  %184 = load i32, i32* %k, align 4, !optimi !20
  %add290 = add nsw i32 %mul289, %184, !optimi !26
  %sub291 = sub nsw i32 %add290, 1, !optimi !25
  %idxprom292 = sext i32 %sub291 to i64, !optimi !25
  %arrayidx293 = getelementptr inbounds double, double* %182, i64 %idxprom292, !optimi !3
  %185 = load double, double* %arrayidx293, align 8, !optimi !3
  br label %cond.end301

cond.false294:                                    ; preds = %cond.end266
  %186 = load double*, double** %un.addr, align 8, !optimi !3
  %187 = load i32, i32* %j, align 4, !optimi !20
  %mul295 = mul nsw i32 %187, 512, !optimi !25
  %188 = load i32, i32* %k, align 4, !optimi !20
  %add296 = add nsw i32 %mul295, %188, !optimi !26
  %sub297 = sub nsw i32 %add296, 1, !optimi !25
  %idxprom298 = sext i32 %sub297 to i64, !optimi !25
  %arrayidx299 = getelementptr inbounds double, double* %186, i64 %idxprom298, !optimi !3
  %189 = load double, double* %arrayidx299, align 8, !optimi !3
  %sub300 = fsub double -0.000000e+00, %189, !optimi !3
  br label %cond.end301

cond.end301:                                      ; preds = %cond.false294, %cond.true288
  %cond302 = phi double [ %185, %cond.true288 ], [ %sub300, %cond.false294 ], !optimi !3
  %sub303 = fsub double %177, %cond302, !optimi !33
  %mul304 = fmul double 5.000000e-01, %sub303, !optimi !3
  %190 = load double*, double** %h.addr, align 8, !optimi !1
  %191 = load i32, i32* %j, align 4, !optimi !20
  %mul305 = mul nsw i32 %191, 512, !optimi !25
  %192 = load i32, i32* %k, align 4, !optimi !20
  %add306 = add nsw i32 %mul305, %192, !optimi !26
  %idxprom307 = sext i32 %add306 to i64, !optimi !26
  %arrayidx308 = getelementptr inbounds double, double* %190, i64 %idxprom307, !optimi !1
  %193 = load double, double* %arrayidx308, align 8, !optimi !1
  %mul309 = fmul double %mul304, %193, !optimi !19
  store double %mul309, double* %hwn, align 8
  %194 = load double, double* %hwp, align 8, !optimi !19
  %195 = load double, double* %hwn, align 8, !optimi !19
  %add310 = fadd double %194, %195, !optimi !18
  store double %add310, double* %huw, align 8
  %196 = load double*, double** %vn.addr, align 8, !optimi !3
  %197 = load i32, i32* %j, align 4, !optimi !20
  %mul311 = mul nsw i32 %197, 512, !optimi !25
  %198 = load i32, i32* %k, align 4, !optimi !20
  %add312 = add nsw i32 %mul311, %198, !optimi !26
  %idxprom313 = sext i32 %add312 to i64, !optimi !26
  %arrayidx314 = getelementptr inbounds double, double* %196, i64 %idxprom313, !optimi !3
  %199 = load double, double* %arrayidx314, align 8, !optimi !3
  %200 = load double*, double** %vn.addr, align 8, !optimi !3
  %201 = load i32, i32* %j, align 4, !optimi !20
  %mul315 = mul nsw i32 %201, 512, !optimi !25
  %202 = load i32, i32* %k, align 4, !optimi !20
  %add316 = add nsw i32 %mul315, %202, !optimi !26
  %idxprom317 = sext i32 %add316 to i64, !optimi !26
  %arrayidx318 = getelementptr inbounds double, double* %200, i64 %idxprom317, !optimi !3
  %203 = load double, double* %arrayidx318, align 8, !optimi !3
  %cmp319 = fcmp oge double %203, 0.000000e+00, !optimi !2
  br i1 %cmp319, label %cond.true321, label %cond.false326

cond.true321:                                     ; preds = %cond.end301
  %204 = load double*, double** %vn.addr, align 8, !optimi !3
  %205 = load i32, i32* %j, align 4, !optimi !20
  %mul322 = mul nsw i32 %205, 512, !optimi !25
  %206 = load i32, i32* %k, align 4, !optimi !20
  %add323 = add nsw i32 %mul322, %206, !optimi !26
  %idxprom324 = sext i32 %add323 to i64, !optimi !26
  %arrayidx325 = getelementptr inbounds double, double* %204, i64 %idxprom324, !optimi !3
  %207 = load double, double* %arrayidx325, align 8, !optimi !3
  br label %cond.end332

cond.false326:                                    ; preds = %cond.end301
  %208 = load double*, double** %vn.addr, align 8, !optimi !3
  %209 = load i32, i32* %j, align 4, !optimi !20
  %mul327 = mul nsw i32 %209, 512, !optimi !25
  %210 = load i32, i32* %k, align 4, !optimi !20
  %add328 = add nsw i32 %mul327, %210, !optimi !26
  %idxprom329 = sext i32 %add328 to i64, !optimi !26
  %arrayidx330 = getelementptr inbounds double, double* %208, i64 %idxprom329, !optimi !3
  %211 = load double, double* %arrayidx330, align 8, !optimi !3
  %sub331 = fsub double -0.000000e+00, %211, !optimi !3
  br label %cond.end332

cond.end332:                                      ; preds = %cond.false326, %cond.true321
  %cond333 = phi double [ %207, %cond.true321 ], [ %sub331, %cond.false326 ], !optimi !3
  %add334 = fadd double %199, %cond333, !optimi !33
  %mul335 = fmul double 5.000000e-01, %add334, !optimi !3
  %212 = load double*, double** %h.addr, align 8, !optimi !1
  %213 = load i32, i32* %j, align 4, !optimi !20
  %mul336 = mul nsw i32 %213, 512, !optimi !25
  %214 = load i32, i32* %k, align 4, !optimi !20
  %add337 = add nsw i32 %mul336, %214, !optimi !26
  %idxprom338 = sext i32 %add337 to i64, !optimi !26
  %arrayidx339 = getelementptr inbounds double, double* %212, i64 %idxprom338, !optimi !1
  %215 = load double, double* %arrayidx339, align 8, !optimi !1
  %mul340 = fmul double %mul335, %215, !optimi !19
  store double %mul340, double* %hnp, align 8
  %216 = load double*, double** %vn.addr, align 8, !optimi !3
  %217 = load i32, i32* %j, align 4, !optimi !20
  %mul341 = mul nsw i32 %217, 512, !optimi !25
  %218 = load i32, i32* %k, align 4, !optimi !20
  %add342 = add nsw i32 %mul341, %218, !optimi !26
  %idxprom343 = sext i32 %add342 to i64, !optimi !26
  %arrayidx344 = getelementptr inbounds double, double* %216, i64 %idxprom343, !optimi !3
  %219 = load double, double* %arrayidx344, align 8, !optimi !3
  %220 = load double*, double** %vn.addr, align 8, !optimi !3
  %221 = load i32, i32* %j, align 4, !optimi !20
  %mul345 = mul nsw i32 %221, 512, !optimi !25
  %222 = load i32, i32* %k, align 4, !optimi !20
  %add346 = add nsw i32 %mul345, %222, !optimi !26
  %idxprom347 = sext i32 %add346 to i64, !optimi !26
  %arrayidx348 = getelementptr inbounds double, double* %220, i64 %idxprom347, !optimi !3
  %223 = load double, double* %arrayidx348, align 8, !optimi !3
  %cmp349 = fcmp oge double %223, 0.000000e+00, !optimi !2
  br i1 %cmp349, label %cond.true351, label %cond.false356

cond.true351:                                     ; preds = %cond.end332
  %224 = load double*, double** %vn.addr, align 8, !optimi !3
  %225 = load i32, i32* %j, align 4, !optimi !20
  %mul352 = mul nsw i32 %225, 512, !optimi !25
  %226 = load i32, i32* %k, align 4, !optimi !20
  %add353 = add nsw i32 %mul352, %226, !optimi !26
  %idxprom354 = sext i32 %add353 to i64, !optimi !26
  %arrayidx355 = getelementptr inbounds double, double* %224, i64 %idxprom354, !optimi !3
  %227 = load double, double* %arrayidx355, align 8, !optimi !3
  br label %cond.end362

cond.false356:                                    ; preds = %cond.end332
  %228 = load double*, double** %vn.addr, align 8, !optimi !3
  %229 = load i32, i32* %j, align 4, !optimi !20
  %mul357 = mul nsw i32 %229, 512, !optimi !25
  %230 = load i32, i32* %k, align 4, !optimi !20
  %add358 = add nsw i32 %mul357, %230, !optimi !26
  %idxprom359 = sext i32 %add358 to i64, !optimi !26
  %arrayidx360 = getelementptr inbounds double, double* %228, i64 %idxprom359, !optimi !3
  %231 = load double, double* %arrayidx360, align 8, !optimi !3
  %sub361 = fsub double -0.000000e+00, %231, !optimi !3
  br label %cond.end362

cond.end362:                                      ; preds = %cond.false356, %cond.true351
  %cond363 = phi double [ %227, %cond.true351 ], [ %sub361, %cond.false356 ], !optimi !3
  %sub364 = fsub double %219, %cond363, !optimi !33
  %mul365 = fmul double 5.000000e-01, %sub364, !optimi !3
  %232 = load double*, double** %h.addr, align 8, !optimi !1
  %233 = load i32, i32* %j, align 4, !optimi !20
  %add366 = add nsw i32 %233, 1, !optimi !30
  %mul367 = mul nsw i32 %add366, 512, !optimi !31
  %234 = load i32, i32* %k, align 4, !optimi !20
  %add368 = add nsw i32 %mul367, %234, !optimi !32
  %idxprom369 = sext i32 %add368 to i64, !optimi !32
  %arrayidx370 = getelementptr inbounds double, double* %232, i64 %idxprom369, !optimi !1
  %235 = load double, double* %arrayidx370, align 8, !optimi !1
  %mul371 = fmul double %mul365, %235, !optimi !19
  store double %mul371, double* %hnn, align 8
  %236 = load double, double* %hnp, align 8, !optimi !19
  %237 = load double, double* %hnn, align 8, !optimi !19
  %add372 = fadd double %236, %237, !optimi !18
  store double %add372, double* %hvn, align 8
  %238 = load double*, double** %vn.addr, align 8, !optimi !3
  %239 = load i32, i32* %j, align 4, !optimi !20
  %sub373 = sub nsw i32 %239, 1, !optimi !34
  %mul374 = mul nsw i32 %sub373, 512, !optimi !34
  %240 = load i32, i32* %k, align 4, !optimi !20
  %add375 = add nsw i32 %mul374, %240, !optimi !20
  %idxprom376 = sext i32 %add375 to i64, !optimi !20
  %arrayidx377 = getelementptr inbounds double, double* %238, i64 %idxprom376, !optimi !3
  %241 = load double, double* %arrayidx377, align 8, !optimi !3
  %242 = load double*, double** %vn.addr, align 8, !optimi !3
  %243 = load i32, i32* %j, align 4, !optimi !20
  %sub378 = sub nsw i32 %243, 1, !optimi !34
  %mul379 = mul nsw i32 %sub378, 512, !optimi !34
  %244 = load i32, i32* %k, align 4, !optimi !20
  %add380 = add nsw i32 %mul379, %244, !optimi !20
  %idxprom381 = sext i32 %add380 to i64, !optimi !20
  %arrayidx382 = getelementptr inbounds double, double* %242, i64 %idxprom381, !optimi !3
  %245 = load double, double* %arrayidx382, align 8, !optimi !3
  %cmp383 = fcmp oge double %245, 0.000000e+00, !optimi !2
  br i1 %cmp383, label %cond.true385, label %cond.false391

cond.true385:                                     ; preds = %cond.end362
  %246 = load double*, double** %vn.addr, align 8, !optimi !3
  %247 = load i32, i32* %j, align 4, !optimi !20
  %sub386 = sub nsw i32 %247, 1, !optimi !34
  %mul387 = mul nsw i32 %sub386, 512, !optimi !34
  %248 = load i32, i32* %k, align 4, !optimi !20
  %add388 = add nsw i32 %mul387, %248, !optimi !20
  %idxprom389 = sext i32 %add388 to i64, !optimi !20
  %arrayidx390 = getelementptr inbounds double, double* %246, i64 %idxprom389, !optimi !3
  %249 = load double, double* %arrayidx390, align 8, !optimi !3
  br label %cond.end398

cond.false391:                                    ; preds = %cond.end362
  %250 = load double*, double** %vn.addr, align 8, !optimi !3
  %251 = load i32, i32* %j, align 4, !optimi !20
  %sub392 = sub nsw i32 %251, 1, !optimi !34
  %mul393 = mul nsw i32 %sub392, 512, !optimi !34
  %252 = load i32, i32* %k, align 4, !optimi !20
  %add394 = add nsw i32 %mul393, %252, !optimi !20
  %idxprom395 = sext i32 %add394 to i64, !optimi !20
  %arrayidx396 = getelementptr inbounds double, double* %250, i64 %idxprom395, !optimi !3
  %253 = load double, double* %arrayidx396, align 8, !optimi !3
  %sub397 = fsub double -0.000000e+00, %253, !optimi !3
  br label %cond.end398

cond.end398:                                      ; preds = %cond.false391, %cond.true385
  %cond399 = phi double [ %249, %cond.true385 ], [ %sub397, %cond.false391 ], !optimi !3
  %add400 = fadd double %241, %cond399, !optimi !33
  %mul401 = fmul double 5.000000e-01, %add400, !optimi !3
  %254 = load double*, double** %h.addr, align 8, !optimi !1
  %255 = load i32, i32* %j, align 4, !optimi !20
  %sub402 = sub nsw i32 %255, 1, !optimi !34
  %mul403 = mul nsw i32 %sub402, 512, !optimi !34
  %256 = load i32, i32* %k, align 4, !optimi !20
  %add404 = add nsw i32 %mul403, %256, !optimi !20
  %idxprom405 = sext i32 %add404 to i64, !optimi !20
  %arrayidx406 = getelementptr inbounds double, double* %254, i64 %idxprom405, !optimi !1
  %257 = load double, double* %arrayidx406, align 8, !optimi !1
  %mul407 = fmul double %mul401, %257, !optimi !19
  store double %mul407, double* %hsp, align 8
  %258 = load double*, double** %vn.addr, align 8, !optimi !3
  %259 = load i32, i32* %j, align 4, !optimi !20
  %sub408 = sub nsw i32 %259, 1, !optimi !34
  %mul409 = mul nsw i32 %sub408, 512, !optimi !34
  %260 = load i32, i32* %k, align 4, !optimi !20
  %add410 = add nsw i32 %mul409, %260, !optimi !20
  %idxprom411 = sext i32 %add410 to i64, !optimi !20
  %arrayidx412 = getelementptr inbounds double, double* %258, i64 %idxprom411, !optimi !3
  %261 = load double, double* %arrayidx412, align 8, !optimi !3
  %262 = load double*, double** %vn.addr, align 8, !optimi !3
  %263 = load i32, i32* %j, align 4, !optimi !20
  %sub413 = sub nsw i32 %263, 1, !optimi !34
  %mul414 = mul nsw i32 %sub413, 512, !optimi !34
  %264 = load i32, i32* %k, align 4, !optimi !20
  %add415 = add nsw i32 %mul414, %264, !optimi !20
  %idxprom416 = sext i32 %add415 to i64, !optimi !20
  %arrayidx417 = getelementptr inbounds double, double* %262, i64 %idxprom416, !optimi !3
  %265 = load double, double* %arrayidx417, align 8, !optimi !3
  %cmp418 = fcmp oge double %265, 0.000000e+00, !optimi !2
  br i1 %cmp418, label %cond.true420, label %cond.false426

cond.true420:                                     ; preds = %cond.end398
  %266 = load double*, double** %vn.addr, align 8, !optimi !3
  %267 = load i32, i32* %j, align 4, !optimi !20
  %sub421 = sub nsw i32 %267, 1, !optimi !34
  %mul422 = mul nsw i32 %sub421, 512, !optimi !34
  %268 = load i32, i32* %k, align 4, !optimi !20
  %add423 = add nsw i32 %mul422, %268, !optimi !20
  %idxprom424 = sext i32 %add423 to i64, !optimi !20
  %arrayidx425 = getelementptr inbounds double, double* %266, i64 %idxprom424, !optimi !3
  %269 = load double, double* %arrayidx425, align 8, !optimi !3
  br label %cond.end433

cond.false426:                                    ; preds = %cond.end398
  %270 = load double*, double** %vn.addr, align 8, !optimi !3
  %271 = load i32, i32* %j, align 4, !optimi !20
  %sub427 = sub nsw i32 %271, 1, !optimi !34
  %mul428 = mul nsw i32 %sub427, 512, !optimi !34
  %272 = load i32, i32* %k, align 4, !optimi !20
  %add429 = add nsw i32 %mul428, %272, !optimi !20
  %idxprom430 = sext i32 %add429 to i64, !optimi !20
  %arrayidx431 = getelementptr inbounds double, double* %270, i64 %idxprom430, !optimi !3
  %273 = load double, double* %arrayidx431, align 8, !optimi !3
  %sub432 = fsub double -0.000000e+00, %273, !optimi !3
  br label %cond.end433

cond.end433:                                      ; preds = %cond.false426, %cond.true420
  %cond434 = phi double [ %269, %cond.true420 ], [ %sub432, %cond.false426 ], !optimi !3
  %sub435 = fsub double %261, %cond434, !optimi !33
  %mul436 = fmul double 5.000000e-01, %sub435, !optimi !3
  %274 = load double*, double** %h.addr, align 8, !optimi !1
  %275 = load i32, i32* %j, align 4, !optimi !20
  %mul437 = mul nsw i32 %275, 512, !optimi !25
  %276 = load i32, i32* %k, align 4, !optimi !20
  %add438 = add nsw i32 %mul437, %276, !optimi !26
  %idxprom439 = sext i32 %add438 to i64, !optimi !26
  %arrayidx440 = getelementptr inbounds double, double* %274, i64 %idxprom439, !optimi !1
  %277 = load double, double* %arrayidx440, align 8, !optimi !1
  %mul441 = fmul double %mul436, %277, !optimi !19
  store double %mul441, double* %hsn, align 8
  %278 = load double, double* %hsp, align 8, !optimi !19
  %279 = load double, double* %hsn, align 8, !optimi !19
  %add442 = fadd double %278, %279, !optimi !18
  store double %add442, double* %hvs, align 8
  %280 = load double*, double** %eta.addr, align 8, !optimi !1
  %281 = load i32, i32* %j, align 4, !optimi !20
  %mul443 = mul nsw i32 %281, 512, !optimi !25
  %282 = load i32, i32* %k, align 4, !optimi !20
  %add444 = add nsw i32 %mul443, %282, !optimi !26
  %idxprom445 = sext i32 %add444 to i64, !optimi !26
  %arrayidx446 = getelementptr inbounds double, double* %280, i64 %idxprom445, !optimi !1
  %283 = load double, double* %arrayidx446, align 8, !optimi !1
  %284 = load double, double* %dt.addr, align 8, !optimi !15
  %285 = load double, double* %hue, align 8, !optimi !18
  %286 = load double, double* %huw, align 8, !optimi !18
  %sub447 = fsub double %285, %286, !optimi !35
  %mul448 = fmul double %284, %sub447, !optimi !36
  %287 = load double, double* %dx.addr, align 8, !optimi !15
  %div449 = fdiv double %mul448, %287, !optimi !17
  %sub450 = fsub double %283, %div449, !optimi !17
  %288 = load double, double* %dt.addr, align 8, !optimi !15
  %289 = load double, double* %hvn, align 8, !optimi !18
  %290 = load double, double* %hvs, align 8, !optimi !18
  %sub451 = fsub double %289, %290, !optimi !35
  %mul452 = fmul double %288, %sub451, !optimi !36
  %291 = load double, double* %dy.addr, align 8, !optimi !15
  %div453 = fdiv double %mul452, %291, !optimi !17
  %sub454 = fsub double %sub450, %div453, !optimi !37
  %292 = load double*, double** %etan.addr, align 8, !optimi !1
  %293 = load i32, i32* %j, align 4, !optimi !20
  %mul455 = mul nsw i32 %293, 512, !optimi !25
  %294 = load i32, i32* %k, align 4, !optimi !20
  %add456 = add nsw i32 %mul455, %294, !optimi !26
  %idxprom457 = sext i32 %add456 to i64, !optimi !26
  %arrayidx458 = getelementptr inbounds double, double* %292, i64 %idxprom457, !optimi !1
  store double %sub454, double* %arrayidx458, align 8
  br label %for.inc459

for.inc459:                                       ; preds = %cond.end433
  %295 = load i32, i32* %k, align 4, !optimi !20
  %inc460 = add nsw i32 %295, 1, !optimi !30
  store i32 %inc460, i32* %k, align 4
  br label %for.cond179

for.end461:                                       ; preds = %for.cond179
  br label %for.inc462

for.inc462:                                       ; preds = %for.end461
  %296 = load i32, i32* %j, align 4, !optimi !20
  %inc463 = add nsw i32 %296, 1, !optimi !30
  store i32 %inc463, i32* %j, align 4
  br label %for.cond175

for.end464:                                       ; preds = %for.cond175
  ret void
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #3

; Function Attrs: nounwind uwtable
define void @sw2d_shapiro_host(double* %wet, double* %etan, double %eps, double* %eta) #0 {
entry:
  %wet.addr = alloca double*, align 8, !optimi !2
  %etan.addr = alloca double*, align 8, !optimi !1
  %eps.addr = alloca double, align 8, !optimi !38
  %eta.addr = alloca double*, align 8, !optimi !1
  %j = alloca i32, align 4, !optimi !20
  %k = alloca i32, align 4, !optimi !20
  %term1 = alloca double, align 8, !optimi !1
  %term2 = alloca double, align 8, !optimi !39
  %term3 = alloca double, align 8, !optimi !39
  store double* %wet, double** %wet.addr, align 8
  %wet.addr1 = bitcast double** %wet.addr to i8*, !optimi !2
  call void @llvm.var.annotation(i8* %wet.addr1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 216)
  store double* %etan, double** %etan.addr, align 8
  %etan.addr2 = bitcast double** %etan.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %etan.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 217)
  store double %eps, double* %eps.addr, align 8
  %eps.addr3 = bitcast double* %eps.addr to i8*, !optimi !38
  call void @llvm.var.annotation(i8* %eps.addr3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 218)
  store double* %eta, double** %eta.addr, align 8
  %eta.addr4 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %eta.addr4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 219)
  store i32 1, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc106, %entry
  %0 = load i32, i32* %j, align 4, !optimi !20
  %cmp = icmp sle i32 %0, 510, !optimi !2
  br i1 %cmp, label %for.body, label %for.end108

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %k, align 4, !optimi !20
  %cmp6 = icmp sle i32 %1, 510, !optimi !2
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %2 = load double*, double** %wet.addr, align 8, !optimi !2
  %3 = load i32, i32* %j, align 4, !optimi !20
  %mul = mul nsw i32 %3, 512, !optimi !25
  %4 = load i32, i32* %k, align 4, !optimi !20
  %add = add nsw i32 %mul, %4, !optimi !26
  %idxprom = sext i32 %add to i64, !optimi !26
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom, !optimi !2
  %5 = load double, double* %arrayidx, align 8, !optimi !2
  %cmp8 = fcmp oeq double %5, 1.000000e+00, !optimi !2
  br i1 %cmp8, label %if.then, label %if.else

if.then:                                          ; preds = %for.body7
  %6 = load double, double* %eps.addr, align 8, !optimi !38
  %mul9 = fmul double 2.500000e-01, %6, !optimi !38
  %7 = load double*, double** %wet.addr, align 8, !optimi !2
  %8 = load i32, i32* %j, align 4, !optimi !20
  %mul10 = mul nsw i32 %8, 512, !optimi !25
  %9 = load i32, i32* %k, align 4, !optimi !20
  %add11 = add nsw i32 %mul10, %9, !optimi !26
  %add12 = add nsw i32 %add11, 1, !optimi !27
  %idxprom13 = sext i32 %add12 to i64, !optimi !27
  %arrayidx14 = getelementptr inbounds double, double* %7, i64 %idxprom13, !optimi !2
  %10 = load double, double* %arrayidx14, align 8, !optimi !2
  %11 = load double*, double** %wet.addr, align 8, !optimi !2
  %12 = load i32, i32* %j, align 4, !optimi !20
  %mul15 = mul nsw i32 %12, 512, !optimi !25
  %13 = load i32, i32* %k, align 4, !optimi !20
  %add16 = add nsw i32 %mul15, %13, !optimi !26
  %sub = sub nsw i32 %add16, 1, !optimi !25
  %idxprom17 = sext i32 %sub to i64, !optimi !25
  %arrayidx18 = getelementptr inbounds double, double* %11, i64 %idxprom17, !optimi !2
  %14 = load double, double* %arrayidx18, align 8, !optimi !2
  %add19 = fadd double %10, %14, !optimi !40
  %15 = load double*, double** %wet.addr, align 8, !optimi !2
  %16 = load i32, i32* %j, align 4, !optimi !20
  %add20 = add nsw i32 %16, 1, !optimi !30
  %mul21 = mul nsw i32 %add20, 512, !optimi !31
  %17 = load i32, i32* %k, align 4, !optimi !20
  %add22 = add nsw i32 %mul21, %17, !optimi !32
  %idxprom23 = sext i32 %add22 to i64, !optimi !32
  %arrayidx24 = getelementptr inbounds double, double* %15, i64 %idxprom23, !optimi !2
  %18 = load double, double* %arrayidx24, align 8, !optimi !2
  %add25 = fadd double %add19, %18, !optimi !41
  %19 = load double*, double** %wet.addr, align 8, !optimi !2
  %20 = load i32, i32* %j, align 4, !optimi !20
  %sub26 = sub nsw i32 %20, 1, !optimi !34
  %mul27 = mul nsw i32 %sub26, 512, !optimi !34
  %21 = load i32, i32* %k, align 4, !optimi !20
  %add28 = add nsw i32 %mul27, %21, !optimi !20
  %idxprom29 = sext i32 %add28 to i64, !optimi !20
  %arrayidx30 = getelementptr inbounds double, double* %19, i64 %idxprom29, !optimi !2
  %22 = load double, double* %arrayidx30, align 8, !optimi !2
  %add31 = fadd double %add25, %22, !optimi !42
  %mul32 = fmul double %mul9, %add31, !optimi !38
  %sub33 = fsub double 1.000000e+00, %mul32, !optimi !43
  %23 = load double*, double** %etan.addr, align 8, !optimi !1
  %24 = load i32, i32* %j, align 4, !optimi !20
  %mul34 = mul nsw i32 %24, 512, !optimi !25
  %25 = load i32, i32* %k, align 4, !optimi !20
  %add35 = add nsw i32 %mul34, %25, !optimi !26
  %idxprom36 = sext i32 %add35 to i64, !optimi !26
  %arrayidx37 = getelementptr inbounds double, double* %23, i64 %idxprom36, !optimi !1
  %26 = load double, double* %arrayidx37, align 8, !optimi !1
  %mul38 = fmul double %sub33, %26, !optimi !1
  store double %mul38, double* %term1, align 8
  %27 = load double, double* %eps.addr, align 8, !optimi !38
  %mul39 = fmul double 2.500000e-01, %27, !optimi !38
  %28 = load double*, double** %wet.addr, align 8, !optimi !2
  %29 = load i32, i32* %j, align 4, !optimi !20
  %mul40 = mul nsw i32 %29, 512, !optimi !25
  %30 = load i32, i32* %k, align 4, !optimi !20
  %add41 = add nsw i32 %mul40, %30, !optimi !26
  %add42 = add nsw i32 %add41, 1, !optimi !27
  %idxprom43 = sext i32 %add42 to i64, !optimi !27
  %arrayidx44 = getelementptr inbounds double, double* %28, i64 %idxprom43, !optimi !2
  %31 = load double, double* %arrayidx44, align 8, !optimi !2
  %32 = load double*, double** %etan.addr, align 8, !optimi !1
  %33 = load i32, i32* %j, align 4, !optimi !20
  %mul45 = mul nsw i32 %33, 512, !optimi !25
  %34 = load i32, i32* %k, align 4, !optimi !20
  %add46 = add nsw i32 %mul45, %34, !optimi !26
  %add47 = add nsw i32 %add46, 1, !optimi !27
  %idxprom48 = sext i32 %add47 to i64, !optimi !27
  %arrayidx49 = getelementptr inbounds double, double* %32, i64 %idxprom48, !optimi !1
  %35 = load double, double* %arrayidx49, align 8, !optimi !1
  %mul50 = fmul double %31, %35, !optimi !1
  %36 = load double*, double** %wet.addr, align 8, !optimi !2
  %37 = load i32, i32* %j, align 4, !optimi !20
  %mul51 = mul nsw i32 %37, 512, !optimi !25
  %38 = load i32, i32* %k, align 4, !optimi !20
  %add52 = add nsw i32 %mul51, %38, !optimi !26
  %sub53 = sub nsw i32 %add52, 1, !optimi !25
  %idxprom54 = sext i32 %sub53 to i64, !optimi !25
  %arrayidx55 = getelementptr inbounds double, double* %36, i64 %idxprom54, !optimi !2
  %39 = load double, double* %arrayidx55, align 8, !optimi !2
  %40 = load double*, double** %etan.addr, align 8, !optimi !1
  %41 = load i32, i32* %j, align 4, !optimi !20
  %mul56 = mul nsw i32 %41, 512, !optimi !25
  %42 = load i32, i32* %k, align 4, !optimi !20
  %add57 = add nsw i32 %mul56, %42, !optimi !26
  %sub58 = sub nsw i32 %add57, 1, !optimi !25
  %idxprom59 = sext i32 %sub58 to i64, !optimi !25
  %arrayidx60 = getelementptr inbounds double, double* %40, i64 %idxprom59, !optimi !1
  %43 = load double, double* %arrayidx60, align 8, !optimi !1
  %mul61 = fmul double %39, %43, !optimi !1
  %add62 = fadd double %mul50, %mul61, !optimi !13
  %mul63 = fmul double %mul39, %add62, !optimi !39
  store double %mul63, double* %term2, align 8
  %44 = load double, double* %eps.addr, align 8, !optimi !38
  %mul64 = fmul double 2.500000e-01, %44, !optimi !38
  %45 = load double*, double** %wet.addr, align 8, !optimi !2
  %46 = load i32, i32* %j, align 4, !optimi !20
  %add65 = add nsw i32 %46, 1, !optimi !30
  %mul66 = mul nsw i32 %add65, 512, !optimi !31
  %47 = load i32, i32* %k, align 4, !optimi !20
  %add67 = add nsw i32 %mul66, %47, !optimi !32
  %idxprom68 = sext i32 %add67 to i64, !optimi !32
  %arrayidx69 = getelementptr inbounds double, double* %45, i64 %idxprom68, !optimi !2
  %48 = load double, double* %arrayidx69, align 8, !optimi !2
  %49 = load double*, double** %etan.addr, align 8, !optimi !1
  %50 = load i32, i32* %j, align 4, !optimi !20
  %add70 = add nsw i32 %50, 1, !optimi !30
  %mul71 = mul nsw i32 %add70, 512, !optimi !31
  %51 = load i32, i32* %k, align 4, !optimi !20
  %add72 = add nsw i32 %mul71, %51, !optimi !32
  %idxprom73 = sext i32 %add72 to i64, !optimi !32
  %arrayidx74 = getelementptr inbounds double, double* %49, i64 %idxprom73, !optimi !1
  %52 = load double, double* %arrayidx74, align 8, !optimi !1
  %mul75 = fmul double %48, %52, !optimi !1
  %53 = load double*, double** %wet.addr, align 8, !optimi !2
  %54 = load i32, i32* %j, align 4, !optimi !20
  %sub76 = sub nsw i32 %54, 1, !optimi !34
  %mul77 = mul nsw i32 %sub76, 512, !optimi !34
  %55 = load i32, i32* %k, align 4, !optimi !20
  %add78 = add nsw i32 %mul77, %55, !optimi !20
  %idxprom79 = sext i32 %add78 to i64, !optimi !20
  %arrayidx80 = getelementptr inbounds double, double* %53, i64 %idxprom79, !optimi !2
  %56 = load double, double* %arrayidx80, align 8, !optimi !2
  %57 = load double*, double** %etan.addr, align 8, !optimi !1
  %58 = load i32, i32* %j, align 4, !optimi !20
  %sub81 = sub nsw i32 %58, 1, !optimi !34
  %mul82 = mul nsw i32 %sub81, 512, !optimi !34
  %59 = load i32, i32* %k, align 4, !optimi !20
  %add83 = add nsw i32 %mul82, %59, !optimi !20
  %idxprom84 = sext i32 %add83 to i64, !optimi !20
  %arrayidx85 = getelementptr inbounds double, double* %57, i64 %idxprom84, !optimi !1
  %60 = load double, double* %arrayidx85, align 8, !optimi !1
  %mul86 = fmul double %56, %60, !optimi !1
  %add87 = fadd double %mul75, %mul86, !optimi !13
  %mul88 = fmul double %mul64, %add87, !optimi !39
  store double %mul88, double* %term3, align 8
  %61 = load double, double* %term1, align 8, !optimi !1
  %62 = load double, double* %term2, align 8, !optimi !39
  %add89 = fadd double %61, %62, !optimi !1
  %63 = load double, double* %term3, align 8, !optimi !39
  %add90 = fadd double %add89, %63, !optimi !1
  %64 = load double*, double** %eta.addr, align 8, !optimi !1
  %65 = load i32, i32* %j, align 4, !optimi !20
  %sub91 = sub nsw i32 %65, 1, !optimi !34
  %mul92 = mul nsw i32 %sub91, 512, !optimi !34
  %66 = load i32, i32* %k, align 4, !optimi !20
  %add93 = add nsw i32 %mul92, %66, !optimi !20
  %idxprom94 = sext i32 %add93 to i64, !optimi !20
  %arrayidx95 = getelementptr inbounds double, double* %64, i64 %idxprom94, !optimi !1
  store double %add90, double* %arrayidx95, align 8
  br label %if.end

if.else:                                          ; preds = %for.body7
  %67 = load double*, double** %etan.addr, align 8, !optimi !1
  %68 = load i32, i32* %j, align 4, !optimi !20
  %sub96 = sub nsw i32 %68, 1, !optimi !34
  %mul97 = mul nsw i32 %sub96, 512, !optimi !34
  %69 = load i32, i32* %k, align 4, !optimi !20
  %add98 = add nsw i32 %mul97, %69, !optimi !20
  %idxprom99 = sext i32 %add98 to i64, !optimi !20
  %arrayidx100 = getelementptr inbounds double, double* %67, i64 %idxprom99, !optimi !1
  %70 = load double, double* %arrayidx100, align 8, !optimi !1
  %71 = load double*, double** %eta.addr, align 8, !optimi !1
  %72 = load i32, i32* %j, align 4, !optimi !20
  %sub101 = sub nsw i32 %72, 1, !optimi !34
  %mul102 = mul nsw i32 %sub101, 512, !optimi !34
  %73 = load i32, i32* %k, align 4, !optimi !20
  %add103 = add nsw i32 %mul102, %73, !optimi !20
  %idxprom104 = sext i32 %add103 to i64, !optimi !20
  %arrayidx105 = getelementptr inbounds double, double* %71, i64 %idxprom104, !optimi !1
  store double %70, double* %arrayidx105, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %74 = load i32, i32* %k, align 4, !optimi !20
  %inc = add nsw i32 %74, 1, !optimi !30
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc106

for.inc106:                                       ; preds = %for.end
  %75 = load i32, i32* %j, align 4, !optimi !20
  %inc107 = add nsw i32 %75, 1, !optimi !30
  store i32 %inc107, i32* %j, align 4
  br label %for.cond

for.end108:                                       ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @sw2d_updates_host(double* %h, double* %hzero, double* %eta, double* %u, double* %un, double* %v, double* %vn, double* %wet, double %hmin) #0 {
entry:
  %h.addr = alloca double*, align 8, !optimi !1
  %hzero.addr = alloca double*, align 8, !optimi !1
  %eta.addr = alloca double*, align 8, !optimi !1
  %u.addr = alloca double*, align 8, !optimi !3
  %un.addr = alloca double*, align 8, !optimi !3
  %v.addr = alloca double*, align 8, !optimi !3
  %vn.addr = alloca double*, align 8, !optimi !3
  %wet.addr = alloca double*, align 8, !optimi !2
  %hmin.addr = alloca double, align 8, !optimi !1
  %j = alloca i32, align 4, !optimi !34
  %k = alloca i32, align 4, !optimi !34
  store double* %h, double** %h.addr, align 8
  %h.addr1 = bitcast double** %h.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %h.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 263)
  store double* %hzero, double** %hzero.addr, align 8
  %hzero.addr2 = bitcast double** %hzero.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %hzero.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 264)
  store double* %eta, double** %eta.addr, align 8
  %eta.addr3 = bitcast double** %eta.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %eta.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 265)
  store double* %u, double** %u.addr, align 8
  %u.addr4 = bitcast double** %u.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %u.addr4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 266)
  store double* %un, double** %un.addr, align 8
  %un.addr5 = bitcast double** %un.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %un.addr5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 267)
  store double* %v, double** %v.addr, align 8
  %v.addr6 = bitcast double** %v.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %v.addr6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 268)
  store double* %vn, double** %vn.addr, align 8
  %vn.addr7 = bitcast double** %vn.addr to i8*, !optimi !3
  call void @llvm.var.annotation(i8* %vn.addr7, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 269)
  store double* %wet, double** %wet.addr, align 8
  %wet.addr8 = bitcast double** %wet.addr to i8*, !optimi !2
  call void @llvm.var.annotation(i8* %wet.addr8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 270)
  store double %hmin, double* %hmin.addr, align 8
  %hmin.addr9 = bitcast double* %hmin.addr to i8*, !optimi !1
  call void @llvm.var.annotation(i8* %hmin.addr9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 271)
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc51, %entry
  %0 = load i32, i32* %j, align 4, !optimi !34
  %cmp = icmp sle i32 %0, 511, !optimi !2
  br i1 %cmp, label %for.body, label %for.end53

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %k, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc, %for.body
  %1 = load i32, i32* %k, align 4, !optimi !34
  %cmp11 = icmp sle i32 %1, 511, !optimi !2
  br i1 %cmp11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond10
  %2 = load double*, double** %hzero.addr, align 8, !optimi !1
  %3 = load i32, i32* %j, align 4, !optimi !34
  %mul = mul nsw i32 %3, 512, !optimi !34
  %4 = load i32, i32* %k, align 4, !optimi !34
  %add = add nsw i32 %mul, %4, !optimi !34
  %idxprom = sext i32 %add to i64, !optimi !34
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom, !optimi !1
  %5 = load double, double* %arrayidx, align 8, !optimi !1
  %6 = load double*, double** %eta.addr, align 8, !optimi !1
  %7 = load i32, i32* %j, align 4, !optimi !34
  %mul13 = mul nsw i32 %7, 512, !optimi !34
  %8 = load i32, i32* %k, align 4, !optimi !34
  %add14 = add nsw i32 %mul13, %8, !optimi !34
  %idxprom15 = sext i32 %add14 to i64, !optimi !34
  %arrayidx16 = getelementptr inbounds double, double* %6, i64 %idxprom15, !optimi !1
  %9 = load double, double* %arrayidx16, align 8, !optimi !1
  %add17 = fadd double %5, %9, !optimi !13
  %10 = load double*, double** %h.addr, align 8, !optimi !1
  %11 = load i32, i32* %j, align 4, !optimi !34
  %mul18 = mul nsw i32 %11, 512, !optimi !34
  %12 = load i32, i32* %k, align 4, !optimi !34
  %add19 = add nsw i32 %mul18, %12, !optimi !34
  %idxprom20 = sext i32 %add19 to i64, !optimi !34
  %arrayidx21 = getelementptr inbounds double, double* %10, i64 %idxprom20, !optimi !1
  store double %add17, double* %arrayidx21, align 8
  %13 = load double*, double** %wet.addr, align 8, !optimi !2
  %14 = load i32, i32* %j, align 4, !optimi !34
  %mul22 = mul nsw i32 %14, 512, !optimi !34
  %15 = load i32, i32* %k, align 4, !optimi !34
  %add23 = add nsw i32 %mul22, %15, !optimi !34
  %idxprom24 = sext i32 %add23 to i64, !optimi !34
  %arrayidx25 = getelementptr inbounds double, double* %13, i64 %idxprom24, !optimi !2
  store double 1.000000e+00, double* %arrayidx25, align 8
  %16 = load double*, double** %h.addr, align 8, !optimi !1
  %17 = load i32, i32* %j, align 4, !optimi !34
  %mul26 = mul nsw i32 %17, 512, !optimi !34
  %18 = load i32, i32* %k, align 4, !optimi !34
  %add27 = add nsw i32 %mul26, %18, !optimi !34
  %idxprom28 = sext i32 %add27 to i64, !optimi !34
  %arrayidx29 = getelementptr inbounds double, double* %16, i64 %idxprom28, !optimi !1
  %19 = load double, double* %arrayidx29, align 8, !optimi !1
  %20 = load double, double* %hmin.addr, align 8, !optimi !1
  %cmp30 = fcmp olt double %19, %20, !optimi !2
  br i1 %cmp30, label %if.then, label %if.end

if.then:                                          ; preds = %for.body12
  %21 = load double*, double** %wet.addr, align 8, !optimi !2
  %22 = load i32, i32* %j, align 4, !optimi !34
  %mul31 = mul nsw i32 %22, 512, !optimi !34
  %23 = load i32, i32* %k, align 4, !optimi !34
  %add32 = add nsw i32 %mul31, %23, !optimi !34
  %idxprom33 = sext i32 %add32 to i64, !optimi !34
  %arrayidx34 = getelementptr inbounds double, double* %21, i64 %idxprom33, !optimi !2
  store double 0.000000e+00, double* %arrayidx34, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body12
  %24 = load double*, double** %un.addr, align 8, !optimi !3
  %25 = load i32, i32* %j, align 4, !optimi !34
  %mul35 = mul nsw i32 %25, 512, !optimi !34
  %26 = load i32, i32* %k, align 4, !optimi !34
  %add36 = add nsw i32 %mul35, %26, !optimi !34
  %idxprom37 = sext i32 %add36 to i64, !optimi !34
  %arrayidx38 = getelementptr inbounds double, double* %24, i64 %idxprom37, !optimi !3
  %27 = load double, double* %arrayidx38, align 8, !optimi !3
  %28 = load double*, double** %u.addr, align 8, !optimi !3
  %29 = load i32, i32* %j, align 4, !optimi !34
  %mul39 = mul nsw i32 %29, 512, !optimi !34
  %30 = load i32, i32* %k, align 4, !optimi !34
  %add40 = add nsw i32 %mul39, %30, !optimi !34
  %idxprom41 = sext i32 %add40 to i64, !optimi !34
  %arrayidx42 = getelementptr inbounds double, double* %28, i64 %idxprom41, !optimi !3
  store double %27, double* %arrayidx42, align 8
  %31 = load double*, double** %vn.addr, align 8, !optimi !3
  %32 = load i32, i32* %j, align 4, !optimi !34
  %mul43 = mul nsw i32 %32, 512, !optimi !34
  %33 = load i32, i32* %k, align 4, !optimi !34
  %add44 = add nsw i32 %mul43, %33, !optimi !34
  %idxprom45 = sext i32 %add44 to i64, !optimi !34
  %arrayidx46 = getelementptr inbounds double, double* %31, i64 %idxprom45, !optimi !3
  %34 = load double, double* %arrayidx46, align 8, !optimi !3
  %35 = load double*, double** %v.addr, align 8, !optimi !3
  %36 = load i32, i32* %j, align 4, !optimi !34
  %mul47 = mul nsw i32 %36, 512, !optimi !34
  %37 = load i32, i32* %k, align 4, !optimi !34
  %add48 = add nsw i32 %mul47, %37, !optimi !34
  %idxprom49 = sext i32 %add48 to i64, !optimi !34
  %arrayidx50 = getelementptr inbounds double, double* %35, i64 %idxprom49, !optimi !3
  store double %34, double* %arrayidx50, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %38 = load i32, i32* %k, align 4, !optimi !34
  %inc = add nsw i32 %38, 1, !optimi !20
  store i32 %inc, i32* %k, align 4
  br label %for.cond10

for.end:                                          ; preds = %for.cond10
  br label %for.inc51

for.inc51:                                        ; preds = %for.end
  %39 = load i32, i32* %j, align 4, !optimi !34
  %inc52 = add nsw i32 %39, 1, !optimi !20
  store i32 %inc52, i32* %j, align 4
  br label %for.cond

for.end53:                                        ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 284936)"}
!1 = !{!"(15, 0, 6)"}
!2 = !{!"(1, 0, 0)"}
!3 = !{!"(10, -10, 6)"}
!4 = !{!"(10, 0, 0)"}
!5 = !{!"(514, 0, 0)"}
!6 = !{!"(263168, 0, 0)"}
!7 = !{!"(263682, 0, 0)"}
!8 = !{!"(515, 1, 0)"}
!9 = !{!"(262146, 261632, 0)"}
!10 = !{!"(263680, 512, 0)"}
!11 = !{!"(263679, 511, 0)"}
!12 = !{!"(-0, -15, 6)"}
!13 = !{!"(30, 0, 6)"}
!14 = !{!"(2.14748e+09, -2.14748e+09, 0)"}
!15 = !{!"(100, 0, 2)"}
!16 = !{!"(10, 9, 2)"}
!17 = !{!"(inf, -inf, 6)"}
!18 = !{!"(300, -300, 6)"}
!19 = !{!"(150, -150, 6)"}
!20 = !{!"(1, 1, 0)"}
!21 = !{!"(2.62144e+06, 0, 0)"}
!22 = !{!"(3546, 0, 0)"}
!23 = !{!"(-0, -100, 2)"}
!24 = !{!"(-0, -1000, 2)"}
!25 = !{!"(512, 512, 0)"}
!26 = !{!"(513, 513, 0)"}
!27 = !{!"(514, 514, 0)"}
!28 = !{!"(15, -15, 6)"}
!29 = !{!"(15000, -15000, 6)"}
!30 = !{!"(2, 2, 0)"}
!31 = !{!"(1024, 1024, 0)"}
!32 = !{!"(1025, 1025, 0)"}
!33 = !{!"(20, -20, 6)"}
!34 = !{!"(0, 0, 0)"}
!35 = !{!"(600, -600, 6)"}
!36 = !{!"(60000, -60000, 6)"}
!37 = !{!"(-nan, -nan, 6)"}
!38 = !{!"(0, 0, 2)"}
!39 = !{!"(0, 0, 6)"}
!40 = !{!"(2, 0, 0)"}
!41 = !{!"(3, 0, 0)"}
!42 = !{!"(4, 0, 0)"}
!43 = !{!"(1, 1, 2)"}
