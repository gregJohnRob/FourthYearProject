; ModuleID = 'host.bc'
source_filename = "host.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [63 x i8] c"*************************************************************\0A\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"Host executable begins\0A\00", align 1
@.str.2 = private unnamed_addr constant [47 x i8] c"2D shallow water heterogenuous opencl model $\0A\00", align 1
@.str.3 = private unnamed_addr constant [63 x i8] c"-------------------------------------------------------------\0A\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"Application Run # %d\0A\00", align 1
@time_write_to_device = common global [5 x double] zeroinitializer, align 16
@.str.5 = private unnamed_addr constant [28 x i8] c"Starting time loop on host\0A\00", align 1
@time_total_alltimesteps_kernels = common global [5 x double] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [12 x i8] c"End of Run\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"Host executable ends\0A\00", align 1
@time_read_from_device = common global [5 x double] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4, !optimi !1
  %argc.addr = alloca i32, align 4, !optimi !2
  %argv.addr = alloca i8**, align 8, !optimi !2
  %quantum = alloca i32, align 4
  %t = alloca double, align 8
  %k = alloca i32, align 4, !optimi !1
  %BytesPerWord = alloca i32, align 4, !optimi !3
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %start_timer = alloca double, align 8, !optimi !2
  %end_timer = alloca double, align 8, !optimi !2
  %hmin = alloca double, align 8, !optimi !4
  %dx = alloca double, align 8, !optimi !5
  %dy = alloca double, align 8, !optimi !5
  %dt = alloca double, align 8, !optimi !6
  %g = alloca double, align 8, !optimi !7
  %hzero = alloca double*, align 8, !optimi !2
  %eta = alloca double*, align 8, !optimi !2
  %etan = alloca double*, align 8, !optimi !2
  %h = alloca double*, align 8, !optimi !2
  %wet = alloca double*, align 8, !optimi !2
  %u = alloca double*, align 8, !optimi !2
  %un = alloca double*, align 8, !optimi !2
  %v = alloca double*, align 8, !optimi !2
  %vn = alloca double*, align 8, !optimi !2
  %eps = alloca double, align 8, !optimi !4
  %ntot = alloca i32, align 4, !optimi !5
  %nout = alloca i32, align 4, !optimi !8
  %hmax = alloca double, align 8, !optimi !1
  %j30 = alloca i32, align 4, !optimi !9
  %k32 = alloca i32, align 4, !optimi !9
  %c = alloca double, align 8, !optimi !2
  %lambda = alloca double, align 8, !optimi !10
  %i72 = alloca i32, align 4, !optimi !1
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 8, i32* %BytesPerWord, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0)), !optimi !2
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i32 0, i32 0)), !optimi !2
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0)), !optimi !2
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.2, i32 0, i32 0)), !optimi !2
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.3, i32 0, i32 0)), !optimi !2
  store double 5.000000e-02, double* %hmin, align 8
  store double 1.000000e+01, double* %dx, align 8
  store double 1.000000e+01, double* %dy, align 8
  store double 1.000000e-01, double* %dt, align 8
  store double 9.810000e+00, double* %g, align 8
  %0 = bitcast double** %hzero to i8**, !optimi !2
  %1 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul = mul nsw i32 262144, %1, !optimi !11
  %conv = sext i32 %mul to i64, !optimi !11
  %call5 = call i32 @posix_memalign(i8** %0, i64 64, i64 %conv) #3, !optimi !12
  %2 = bitcast double** %eta to i8**, !optimi !2
  %3 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul6 = mul nsw i32 262144, %3, !optimi !11
  %conv7 = sext i32 %mul6 to i64, !optimi !11
  %call8 = call i32 @posix_memalign(i8** %2, i64 64, i64 %conv7) #3, !optimi !12
  %4 = bitcast double** %etan to i8**, !optimi !2
  %5 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul9 = mul nsw i32 262144, %5, !optimi !11
  %conv10 = sext i32 %mul9 to i64, !optimi !11
  %call11 = call i32 @posix_memalign(i8** %4, i64 64, i64 %conv10) #3, !optimi !12
  %6 = bitcast double** %h to i8**, !optimi !2
  %7 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul12 = mul nsw i32 262144, %7, !optimi !11
  %conv13 = sext i32 %mul12 to i64, !optimi !11
  %call14 = call i32 @posix_memalign(i8** %6, i64 64, i64 %conv13) #3, !optimi !12
  %8 = bitcast double** %wet to i8**, !optimi !2
  %9 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul15 = mul nsw i32 262144, %9, !optimi !11
  %conv16 = sext i32 %mul15 to i64, !optimi !11
  %call17 = call i32 @posix_memalign(i8** %8, i64 64, i64 %conv16) #3, !optimi !12
  %10 = bitcast double** %u to i8**, !optimi !2
  %11 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul18 = mul nsw i32 262144, %11, !optimi !11
  %conv19 = sext i32 %mul18 to i64, !optimi !11
  %call20 = call i32 @posix_memalign(i8** %10, i64 64, i64 %conv19) #3, !optimi !12
  %12 = bitcast double** %un to i8**, !optimi !2
  %13 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul21 = mul nsw i32 262144, %13, !optimi !11
  %conv22 = sext i32 %mul21 to i64, !optimi !11
  %call23 = call i32 @posix_memalign(i8** %12, i64 64, i64 %conv22) #3, !optimi !12
  %14 = bitcast double** %v to i8**, !optimi !2
  %15 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul24 = mul nsw i32 262144, %15, !optimi !11
  %conv25 = sext i32 %mul24 to i64, !optimi !11
  %call26 = call i32 @posix_memalign(i8** %14, i64 64, i64 %conv25) #3, !optimi !12
  %16 = bitcast double** %vn to i8**, !optimi !2
  %17 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  %mul27 = mul nsw i32 262144, %17, !optimi !11
  %conv28 = sext i32 %mul27 to i64, !optimi !11
  %call29 = call i32 @posix_memalign(i8** %16, i64 64, i64 %conv28) #3, !optimi !12
  %18 = load double*, double** %hzero, align 8, !optimi !2
  %19 = load double*, double** %eta, align 8, !optimi !2
  %20 = load double*, double** %etan, align 8, !optimi !2
  %21 = load double*, double** %h, align 8, !optimi !2
  %22 = load double*, double** %wet, align 8, !optimi !2
  %23 = load double*, double** %u, align 8, !optimi !2
  %24 = load double*, double** %un, align 8, !optimi !2
  %25 = load double*, double** %v, align 8, !optimi !2
  %26 = load double*, double** %vn, align 8, !optimi !2
  %27 = load double, double* %hmin, align 8, !optimi !4
  %28 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  call void @sw2d_init_data_host(double* %18, double* %19, double* %20, double* %21, double* %22, double* %23, double* %24, double* %25, double* %26, double %27, i32 %28), !optimi !2
  store double 5.000000e-02, double* %eps, align 8
  store i32 10, i32* %ntot, align 4
  store i32 5, i32* %nout, align 4
  store double 0.000000e+00, double* %hmax, align 8
  store i32 1, i32* %j30, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc47, %entry
  %29 = load i32, i32* %j30, align 4, !optimi !9
  %cmp = icmp sle i32 %29, 510, !optimi !13
  br i1 %cmp, label %for.body, label %for.end49

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %k32, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc, %for.body
  %30 = load i32, i32* %k32, align 4, !optimi !9
  %cmp34 = icmp sle i32 %30, 510, !optimi !13
  br i1 %cmp34, label %for.body36, label %for.end

for.body36:                                       ; preds = %for.cond33
  %31 = load double, double* %hmax, align 8, !optimi !1
  %32 = load double*, double** %h, align 8, !optimi !2
  %33 = load i32, i32* %j30, align 4, !optimi !9
  %idx.ext = sext i32 %33 to i64, !optimi !9
  %add.ptr = getelementptr inbounds double, double* %32, i64 %idx.ext, !optimi !2
  %add.ptr37 = getelementptr inbounds double, double* %add.ptr, i64 512, !optimi !2
  %34 = load i32, i32* %k32, align 4, !optimi !9
  %idx.ext38 = sext i32 %34 to i64, !optimi !9
  %add.ptr39 = getelementptr inbounds double, double* %add.ptr37, i64 %idx.ext38, !optimi !2
  %35 = load double, double* %add.ptr39, align 8, !optimi !2
  %cmp40 = fcmp ogt double %31, %35, !optimi !13
  br i1 %cmp40, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body36
  %36 = load double, double* %hmax, align 8, !optimi !1
  br label %cond.end

cond.false:                                       ; preds = %for.body36
  %37 = load double*, double** %h, align 8, !optimi !2
  %38 = load i32, i32* %j30, align 4, !optimi !9
  %idx.ext42 = sext i32 %38 to i64, !optimi !9
  %add.ptr43 = getelementptr inbounds double, double* %37, i64 %idx.ext42, !optimi !2
  %add.ptr44 = getelementptr inbounds double, double* %add.ptr43, i64 512, !optimi !2
  %39 = load i32, i32* %k32, align 4, !optimi !9
  %idx.ext45 = sext i32 %39 to i64, !optimi !9
  %add.ptr46 = getelementptr inbounds double, double* %add.ptr44, i64 %idx.ext45, !optimi !2
  %40 = load double, double* %add.ptr46, align 8, !optimi !2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %36, %cond.true ], [ %40, %cond.false ], !optimi !1
  store double %cond, double* %hmax, align 8
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %41 = load i32, i32* %k32, align 4, !optimi !9
  %inc = add nsw i32 %41, 1, !optimi !14
  store i32 %inc, i32* %k32, align 4
  br label %for.cond33

for.end:                                          ; preds = %for.cond33
  br label %for.inc47

for.inc47:                                        ; preds = %for.end
  %42 = load i32, i32* %j30, align 4, !optimi !9
  %inc48 = add nsw i32 %42, 1, !optimi !14
  store i32 %inc48, i32* %j30, align 4
  br label %for.cond

for.end49:                                        ; preds = %for.cond
  %43 = load double, double* %g, align 8, !optimi !7
  %mul50 = fmul double 2.000000e+00, %43, !optimi !15
  %44 = load double, double* %hmax, align 8, !optimi !1
  %mul51 = fmul double %mul50, %44, !optimi !16
  %call52 = call double @sqrt(double %mul51) #3, !optimi !2
  store double %call52, double* %c, align 8
  %45 = load double, double* %dt, align 8, !optimi !6
  %46 = load double, double* %g, align 8, !optimi !7
  %47 = load double, double* %hmax, align 8, !optimi !1
  %mul53 = fmul double %46, %47, !optimi !16
  %call54 = call double @sqrt(double %mul53) #3, !optimi !2
  %mul55 = fmul double %45, %call54, !optimi !17
  %48 = load double, double* %dx, align 8, !optimi !5
  %49 = load double, double* %dy, align 8, !optimi !5
  %cmp56 = fcmp olt double %48, %49, !optimi !13
  br i1 %cmp56, label %cond.true58, label %cond.false59

cond.true58:                                      ; preds = %for.end49
  %50 = load double, double* %dx, align 8, !optimi !5
  br label %cond.end60

cond.false59:                                     ; preds = %for.end49
  %51 = load double, double* %dy, align 8, !optimi !5
  br label %cond.end60

cond.end60:                                       ; preds = %cond.false59, %cond.true58
  %cond61 = phi double [ %50, %cond.true58 ], [ %51, %cond.false59 ], !optimi !5
  %div = fdiv double %mul55, %cond61, !optimi !10
  store double %div, double* %lambda, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc86, %cond.end60
  %52 = load i32, i32* %k, align 4, !optimi !1
  %cmp63 = icmp slt i32 %52, 5, !optimi !13
  br i1 %cmp63, label %for.body65, label %for.end88

for.body65:                                       ; preds = %for.cond62
  %call66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.3, i32 0, i32 0)), !optimi !2
  %53 = load i32, i32* %k, align 4, !optimi !1
  %add = add nsw i32 %53, 1, !optimi !9
  %call67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i32 %add), !optimi !2
  %call68 = call double (...) @mysecond(), !optimi !2
  store double %call68, double* %start_timer, align 8
  %call69 = call double (...) @mysecond(), !optimi !2
  store double %call69, double* %end_timer, align 8
  %54 = load double, double* %end_timer, align 8, !optimi !2
  %55 = load double, double* %start_timer, align 8, !optimi !2
  %sub = fsub double %54, %55, !optimi !2
  %56 = load i32, i32* %k, align 4, !optimi !1
  %idxprom = sext i32 %56 to i64, !optimi !1
  %arrayidx = getelementptr inbounds [5 x double], [5 x double]* @time_write_to_device, i64 0, i64 %idxprom, !optimi !2
  store double %sub, double* %arrayidx, align 8
  %call70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i32 0, i32 0)), !optimi !2
  %call71 = call double (...) @mysecond(), !optimi !2
  store double %call71, double* %start_timer, align 8
  store i32 0, i32* %i72, align 4
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc77, %for.body65
  %57 = load i32, i32* %i72, align 4, !optimi !1
  %58 = load i32, i32* %ntot, align 4, !optimi !5
  %cmp74 = icmp slt i32 %57, %58, !optimi !13
  br i1 %cmp74, label %for.body76, label %for.end79

for.body76:                                       ; preds = %for.cond73
  %59 = load double, double* %dt, align 8, !optimi !6
  %60 = load double, double* %dx, align 8, !optimi !5
  %61 = load double, double* %dy, align 8, !optimi !5
  %62 = load double, double* %g, align 8, !optimi !7
  %63 = load double*, double** %eta, align 8, !optimi !2
  %64 = load double*, double** %un, align 8, !optimi !2
  %65 = load double*, double** %u, align 8, !optimi !2
  %66 = load double*, double** %wet, align 8, !optimi !2
  %67 = load double*, double** %v, align 8, !optimi !2
  %68 = load double*, double** %vn, align 8, !optimi !2
  %69 = load double*, double** %h, align 8, !optimi !2
  %70 = load double*, double** %etan, align 8, !optimi !2
  %71 = load i32, i32* %BytesPerWord, align 4, !optimi !3
  call void @sw2d_dyn_host(double %59, double %60, double %61, double %62, double* %63, double* %64, double* %65, double* %66, double* %67, double* %68, double* %69, double* %70, i32 %71), !optimi !2
  %72 = load double*, double** %wet, align 8, !optimi !2
  %73 = load double*, double** %etan, align 8, !optimi !2
  %74 = load double, double* %eps, align 8, !optimi !4
  %75 = load double*, double** %eta, align 8, !optimi !2
  call void @sw2d_shapiro_host(double* %72, double* %73, double %74, double* %75), !optimi !2
  %76 = load double*, double** %h, align 8, !optimi !2
  %77 = load double*, double** %hzero, align 8, !optimi !2
  %78 = load double*, double** %eta, align 8, !optimi !2
  %79 = load double*, double** %u, align 8, !optimi !2
  %80 = load double*, double** %un, align 8, !optimi !2
  %81 = load double*, double** %v, align 8, !optimi !2
  %82 = load double*, double** %vn, align 8, !optimi !2
  %83 = load double*, double** %wet, align 8, !optimi !2
  %84 = load double, double* %hmin, align 8, !optimi !4
  call void @sw2d_updates_host(double* %76, double* %77, double* %78, double* %79, double* %80, double* %81, double* %82, double* %83, double %84), !optimi !2
  br label %for.inc77

for.inc77:                                        ; preds = %for.body76
  %85 = load i32, i32* %i72, align 4, !optimi !1
  %inc78 = add nsw i32 %85, 1, !optimi !9
  store i32 %inc78, i32* %i72, align 4
  br label %for.cond73

for.end79:                                        ; preds = %for.cond73
  %call80 = call double (...) @mysecond(), !optimi !2
  store double %call80, double* %end_timer, align 8
  %86 = load double, double* %end_timer, align 8, !optimi !2
  %87 = load double, double* %start_timer, align 8, !optimi !2
  %sub81 = fsub double %86, %87, !optimi !2
  %88 = load i32, i32* %k, align 4, !optimi !1
  %idxprom82 = sext i32 %88 to i64, !optimi !1
  %arrayidx83 = getelementptr inbounds [5 x double], [5 x double]* @time_total_alltimesteps_kernels, i64 0, i64 %idxprom82, !optimi !2
  store double %sub81, double* %arrayidx83, align 8
  %call84 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0)), !optimi !2
  %call85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.3, i32 0, i32 0)), !optimi !2
  br label %for.inc86

for.inc86:                                        ; preds = %for.end79
  %89 = load i32, i32* %k, align 4, !optimi !1
  %inc87 = add nsw i32 %89, 1, !optimi !9
  store i32 %inc87, i32* %k, align 4
  br label %for.cond62

for.end88:                                        ; preds = %for.cond62
  call void (...) @oclh_calculate_performance(), !optimi !2
  %90 = load double*, double** %hzero, align 8, !optimi !2
  %91 = bitcast double* %90 to i8*, !optimi !2
  call void @free(i8* %91) #3, !optimi !2
  %92 = load double*, double** %eta, align 8, !optimi !2
  %93 = bitcast double* %92 to i8*, !optimi !2
  call void @free(i8* %93) #3, !optimi !2
  %94 = load double*, double** %etan, align 8, !optimi !2
  %95 = bitcast double* %94 to i8*, !optimi !2
  call void @free(i8* %95) #3, !optimi !2
  %96 = load double*, double** %h, align 8, !optimi !2
  %97 = bitcast double* %96 to i8*, !optimi !2
  call void @free(i8* %97) #3, !optimi !2
  %98 = load double*, double** %wet, align 8, !optimi !2
  %99 = bitcast double* %98 to i8*, !optimi !2
  call void @free(i8* %99) #3, !optimi !2
  %100 = load double*, double** %u, align 8, !optimi !2
  %101 = bitcast double* %100 to i8*, !optimi !2
  call void @free(i8* %101) #3, !optimi !2
  %102 = load double*, double** %un, align 8, !optimi !2
  %103 = bitcast double* %102 to i8*, !optimi !2
  call void @free(i8* %103) #3, !optimi !2
  %104 = load double*, double** %v, align 8, !optimi !2
  %105 = bitcast double* %104 to i8*, !optimi !2
  call void @free(i8* %105) #3, !optimi !2
  %106 = load double*, double** %vn, align 8, !optimi !2
  %107 = bitcast double* %106 to i8*, !optimi !2
  call void @free(i8* %107) #3, !optimi !2
  %call89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0)), !optimi !2
  %call90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i32 0, i32 0)), !optimi !2
  %call91 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0)), !optimi !2
  %108 = load i32, i32* %retval, align 4, !optimi !1
  ret i32 %108
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #2

declare void @sw2d_init_data_host(double*, double*, double*, double*, double*, double*, double*, double*, double*, double, i32) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare double @mysecond(...) #1

declare void @sw2d_dyn_host(double, double, double, double, double*, double*, double*, double*, double*, double*, double*, double*, i32) #1

declare void @sw2d_shapiro_host(double*, double*, double, double*) #1

declare void @sw2d_updates_host(double*, double*, double*, double*, double*, double*, double*, double*, double) #1

declare void @oclh_calculate_performance(...) #1

; Function Attrs: nounwind
declare void @free(i8*) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 284936)"}
!1 = !{!"(0, 0, 0)"}
!2 = !{!"(2.14748e+09, -2.14748e+09, 0)"}
!3 = !{!"(8, 8, 0)"}
!4 = !{!"(0.05, 0.05, 2)"}
!5 = !{!"(10, 10, 0)"}
!6 = !{!"(0.1, 0.1, 1)"}
!7 = !{!"(9.81, 9.81, 15)"}
!8 = !{!"(5, 5, 0)"}
!9 = !{!"(1, 1, 0)"}
!10 = !{!"(2.14748e+07, -2.14748e+07, 1)"}
!11 = !{!"(2.09715e+06, 2.09715e+06, 0)"}
!12 = !{!"(3546, 0, 0)"}
!13 = !{!"(1, 0, 0)"}
!14 = !{!"(2, 2, 0)"}
!15 = !{!"(19.62, 19.62, 15)"}
!16 = !{!"(0, 0, 15)"}
!17 = !{!"(2.14748e+08, -2.14748e+08, 1)"}
