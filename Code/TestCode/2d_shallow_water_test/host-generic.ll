; ModuleID = 'host-generic.bc'
source_filename = "host-generic.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [46 x i8] c"Host arrays initialized. Random integer = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [63 x i8] c"-------------------------------------------------------------\0A\00", align 1
@.str.3 = private unnamed_addr constant [46 x i8] c"This system uses %d bytes per array element.\0A\00", align 1
@.str.4 = private unnamed_addr constant [43 x i8] c"Array dimensions\09= %llu x %llu (elements)\0A\00", align 1
@.str.5 = private unnamed_addr constant [55 x i8] c"Array size\09\09= %llu (elements), Offset = %d (elements)\0A\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"Memory per array\09= %.1f MiB (= %.1f GiB).\0A\00", align 1
@.str.7 = private unnamed_addr constant [48 x i8] c"Total memory required\09= %.1f MiB (= %.1f GiB).\0A\00", align 1
@.str.8 = private unnamed_addr constant [40 x i8] c"Each kernel will be executed %d times.\0A\00", align 1
@.str.9 = private unnamed_addr constant [83 x i8] c"Bandwidth based on best, worst, and average times (excluding the first iteration)\0A\00", align 1
@.str.10 = private unnamed_addr constant [59 x i8] c"will be reported, along with relative standard deviation.\0A\00", align 1
@.str.11 = private unnamed_addr constant [65 x i8] c"Your clock granularity/precision appears to be %d microseconds.\0A\00", align 1
@.str.12 = private unnamed_addr constant [65 x i8] c"Your clock granularity appears to be less than one microsecond.\0A\00", align 1
@.str.13 = private unnamed_addr constant [60 x i8] c"Each test below will take on the order of %d microseconds.\0A\00", align 1
@.str.14 = private unnamed_addr constant [23 x i8] c"   (= %d clock ticks)\0A\00", align 1
@.str.15 = private unnamed_addr constant [52 x i8] c"Increase the size of the arrays if this shows that\0A\00", align 1
@.str.16 = private unnamed_addr constant [55 x i8] c"you are not getting at least 20 clock ticks per test.\0A\00", align 1
@.str.17 = private unnamed_addr constant [49 x i8] c"WARNING -- The above is only a rough guideline.\0A\00", align 1
@.str.18 = private unnamed_addr constant [47 x i8] c"For best results, please be sure you know the\0A\00", align 1
@.str.19 = private unnamed_addr constant [33 x i8] c"precision of your system timer.\0A\00", align 1
@.str.20 = private unnamed_addr constant [63 x i8] c"*************************************************************\0A\00", align 1
@.str.21 = private unnamed_addr constant [21 x i8] c"Experimental Setup \0A\00", align 1
@.str.22 = private unnamed_addr constant [68 x i8] c"TARGET                  = %d [AOCL, SDACCEL, GPU, CPU]            \0A\00", align 1
@.str.23 = private unnamed_addr constant [68 x i8] c"VECTOR_SIZE             = %d                                      \0A\00", align 1
@.str.24 = private unnamed_addr constant [68 x i8] c"STREAM_ARRAY_SIZE_DIM1  = %d                                      \0A\00", align 1
@.str.25 = private unnamed_addr constant [68 x i8] c"STREAM_ARRAY_SIZE       = %d                                      \0A\00", align 1
@.str.26 = private unnamed_addr constant [68 x i8] c"LOOPING management      = %d [API, KERNEL]                        \0A\00", align 1
@.str.27 = private unnamed_addr constant [68 x i8] c"NESTING                 = %d [FLAT_LOOPING, NESTED_LOOPING]       \0A\00", align 1
@.str.28 = private unnamed_addr constant [31 x i8] c"OCLH: Logging data to OUT.log\0A\00", align 1
@.str.29 = private unnamed_addr constant [8 x i8] c"OUT.log\00", align 1
@.str.30 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.31 = private unnamed_addr constant [65 x i8] c" %d \09 %d \09 \09:  a2d[i][j] = %lf\09 b2d[i][j] = %lf\09 c2d[i][j] = %lf\00", align 1
@.str.32 = private unnamed_addr constant [47 x i8] c"OCLH: Results from device written to LOG file\0A\00", align 1
@.str.33 = private unnamed_addr constant [76 x i8] c"*** TEST FAILED ***. Device results do not match locally computed results!\0A\00", align 1
@.str.34 = private unnamed_addr constant [72 x i8] c"At failure, i = %d, j = %d, expected value = %lf, computed value = %lf\0A\00", align 1
@.str.35 = private unnamed_addr constant [69 x i8] c"*** TEST PASSED ***. Device results match locally computed results!\0A\00", align 1
@.str.36 = private unnamed_addr constant [25 x i8] c"OCLH: Bandwidth results\0A\00", align 1
@.str.37 = private unnamed_addr constant [48 x i8] c"Time taken by %dth run of the application = %f\0A\00", align 1
@time_total_alltimesteps_kernels = external global [5 x double], align 16
@avgtime = internal global double 0.000000e+00, align 8
@mintime = internal global double 0x47EFFFFFE0000000, align 8
@maxtime = internal global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define i32 @checktick() #0 {
entry:
  %i = alloca i32, align 4, !optimi !1
  %minDelta = alloca i32, align 4, !optimi !2
  %Delta = alloca i32, align 4, !optimi !3
  %t1 = alloca double, align 8, !optimi !4
  %t2 = alloca double, align 8, !optimi !4
  %timesfound = alloca [20 x double], align 16, !optimi !4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !optimi !1
  %cmp = icmp slt i32 %0, 20, !optimi !5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call double @mysecond(), !optimi !4
  store double %call, double* %t1, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %call1 = call double @mysecond(), !optimi !4
  store double %call1, double* %t2, align 8
  %1 = load double, double* %t1, align 8, !optimi !4
  %sub = fsub double %call1, %1, !optimi !6
  %cmp2 = fcmp olt double %sub, 1.000000e-06, !optimi !5
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %2 = load double, double* %t2, align 8, !optimi !4
  store double %2, double* %t1, align 8
  %3 = load i32, i32* %i, align 4, !optimi !1
  %idxprom = sext i32 %3 to i64, !optimi !1
  %arrayidx = getelementptr inbounds [20 x double], [20 x double]* %timesfound, i64 0, i64 %idxprom, !optimi !4
  store double %2, double* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %4 = load i32, i32* %i, align 4, !optimi !1
  %inc = add nsw i32 %4, 1, !optimi !7
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1000000, i32* %minDelta, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc26, %for.end
  %5 = load i32, i32* %i, align 4, !optimi !1
  %cmp4 = icmp slt i32 %5, 20, !optimi !5
  br i1 %cmp4, label %for.body5, label %for.end28

for.body5:                                        ; preds = %for.cond3
  %6 = load i32, i32* %i, align 4, !optimi !1
  %idxprom6 = sext i32 %6 to i64, !optimi !1
  %arrayidx7 = getelementptr inbounds [20 x double], [20 x double]* %timesfound, i64 0, i64 %idxprom6, !optimi !4
  %7 = load double, double* %arrayidx7, align 8, !optimi !4
  %8 = load i32, i32* %i, align 4, !optimi !1
  %sub8 = sub nsw i32 %8, 1, !optimi !8
  %idxprom9 = sext i32 %sub8 to i64, !optimi !8
  %arrayidx10 = getelementptr inbounds [20 x double], [20 x double]* %timesfound, i64 0, i64 %idxprom9, !optimi !4
  %9 = load double, double* %arrayidx10, align 8, !optimi !4
  %sub11 = fsub double %7, %9, !optimi !6
  %mul = fmul double 1.000000e+06, %sub11, !optimi !3
  %conv = fptosi double %mul to i32, !optimi !3
  store i32 %conv, i32* %Delta, align 4
  %10 = load i32, i32* %minDelta, align 4, !optimi !2
  %11 = load i32, i32* %Delta, align 4, !optimi !3
  %cmp12 = icmp sgt i32 %11, 0, !optimi !5
  br i1 %cmp12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body5
  %12 = load i32, i32* %Delta, align 4, !optimi !3
  br label %cond.end

cond.false:                                       ; preds = %for.body5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %12, %cond.true ], [ 0, %cond.false ], !optimi !3
  %cmp14 = icmp slt i32 %10, %cond, !optimi !5
  br i1 %cmp14, label %cond.true16, label %cond.false17

cond.true16:                                      ; preds = %cond.end
  %13 = load i32, i32* %minDelta, align 4, !optimi !2
  br label %cond.end24

cond.false17:                                     ; preds = %cond.end
  %14 = load i32, i32* %Delta, align 4, !optimi !3
  %cmp18 = icmp sgt i32 %14, 0, !optimi !5
  br i1 %cmp18, label %cond.true20, label %cond.false21

cond.true20:                                      ; preds = %cond.false17
  %15 = load i32, i32* %Delta, align 4, !optimi !3
  br label %cond.end22

cond.false21:                                     ; preds = %cond.false17
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false21, %cond.true20
  %cond23 = phi i32 [ %15, %cond.true20 ], [ 0, %cond.false21 ], !optimi !3
  br label %cond.end24

cond.end24:                                       ; preds = %cond.end22, %cond.true16
  %cond25 = phi i32 [ %13, %cond.true16 ], [ %cond23, %cond.end22 ], !optimi !2
  store i32 %cond25, i32* %minDelta, align 4
  br label %for.inc26

for.inc26:                                        ; preds = %cond.end24
  %16 = load i32, i32* %i, align 4, !optimi !1
  %inc27 = add nsw i32 %16, 1, !optimi !7
  store i32 %inc27, i32* %i, align 4
  br label %for.cond3

for.end28:                                        ; preds = %for.cond3
  %17 = load i32, i32* %minDelta, align 4, !optimi !2
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define double @mysecond() #0 {
entry:
  %tp = alloca %struct.timeval, align 8, !optimi !4
  %tzp = alloca %struct.timezone, align 4
  %i = alloca i32, align 4, !optimi !4
  %call = call i32 @gettimeofday(%struct.timeval* %tp, %struct.timezone* %tzp) #3, !optimi !4
  store i32 %call, i32* %i, align 4
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i32 0, i32 0, !optimi !4
  %0 = load i64, i64* %tv_sec, align 8, !optimi !4
  %conv = sitofp i64 %0 to double, !optimi !4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i32 0, i32 1, !optimi !4
  %1 = load i64, i64* %tv_usec, align 8, !optimi !4
  %conv1 = sitofp i64 %1 to double, !optimi !4
  %mul = fmul double %conv1, 1.000000e-06, !optimi !9
  %add = fadd double %conv, %mul, !optimi !10
  ret double %add
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

; Function Attrs: nounwind uwtable
define i32 @load_file_to_memory(i8* %filename, i8** %result) #0 {
entry:
  %retval = alloca i32, align 4, !optimi !8
  %filename.addr = alloca i8*, align 8, !optimi !4
  %result.addr = alloca i8**, align 8, !optimi !1
  %size = alloca i64, align 8, !optimi !1
  %f = alloca %struct._IO_FILE*, align 8, !optimi !4
  store i8* %filename, i8** %filename.addr, align 8
  store i8** %result, i8*** %result.addr, align 8
  store i64 0, i64* %size, align 8
  %0 = load i8*, i8** %filename.addr, align 8, !optimi !4
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0)), !optimi !4
  store %struct._IO_FILE* %call, %struct._IO_FILE** %f, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !optimi !4
  %cmp = icmp eq %struct._IO_FILE* %1, null, !optimi !5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8**, i8*** %result.addr, align 8, !optimi !1
  store i8* null, i8** %2, align 8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !optimi !4
  %call1 = call i32 @fseek(%struct._IO_FILE* %3, i64 0, i32 2), !optimi !4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !optimi !4
  %call2 = call i64 @ftell(%struct._IO_FILE* %4), !optimi !4
  store i64 %call2, i64* %size, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !optimi !4
  %call3 = call i32 @fseek(%struct._IO_FILE* %5, i64 0, i32 0), !optimi !4
  %6 = load i64, i64* %size, align 8, !optimi !1
  %add = add i64 %6, 1, !optimi !7
  %call4 = call noalias i8* @malloc(i64 %add) #3, !optimi !4
  %7 = load i8**, i8*** %result.addr, align 8, !optimi !1
  store i8* %call4, i8** %7, align 8
  %8 = load i64, i64* %size, align 8, !optimi !1
  %9 = load i8**, i8*** %result.addr, align 8, !optimi !1
  %10 = load i8*, i8** %9, align 8, !optimi !1
  %11 = load i64, i64* %size, align 8, !optimi !1
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !optimi !4
  %call5 = call i64 @fread(i8* %10, i64 1, i64 %11, %struct._IO_FILE* %12), !optimi !4
  %cmp6 = icmp ne i64 %8, %call5, !optimi !5
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  %13 = load i8**, i8*** %result.addr, align 8, !optimi !1
  %14 = load i8*, i8** %13, align 8, !optimi !1
  call void @free(i8* %14) #3, !optimi !4
  store i32 -2, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %f, align 8, !optimi !4
  %call9 = call i32 @fclose(%struct._IO_FILE* %15), !optimi !4
  %16 = load i8**, i8*** %result.addr, align 8, !optimi !1
  %17 = load i8*, i8** %16, align 8, !optimi !1
  %18 = load i64, i64* %size, align 8, !optimi !1
  %arrayidx = getelementptr inbounds i8, i8* %17, i64 %18, !optimi !1
  store i8 0, i8* %arrayidx, align 1
  %19 = load i64, i64* %size, align 8, !optimi !1
  %conv = trunc i64 %19 to i32, !optimi !1
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then7, %if.then
  %20 = load i32, i32* %retval, align 4, !optimi !8
  ret i32 %20
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #2

declare i64 @ftell(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @oclh_init_data(double* %a2d, double* %b2d, double* %c2d, i32 %BytesPerWord) #0 {
entry:
  %a2d.addr = alloca double*, align 8, !optimi !4
  %b2d.addr = alloca double*, align 8, !optimi !1
  %c2d.addr = alloca double*, align 8, !optimi !1
  %BytesPerWord.addr = alloca i32, align 4, !optimi !4
  %tt = alloca i64, align 8
  %r = alloca i32, align 4, !optimi !4
  %i = alloca i32, align 4, !optimi !1
  %j = alloca i32, align 4, !optimi !1
  store double* %a2d, double** %a2d.addr, align 8
  store double* %b2d, double** %b2d.addr, align 8
  store double* %c2d, double** %c2d.addr, align 8
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4
  %call = call i64 @time(i64* %tt) #3, !optimi !4
  %conv = trunc i64 %call to i32, !optimi !4
  call void @srand(i32 %conv) #3, !optimi !4
  %call1 = call i32 @rand() #3, !optimi !4
  %rem = srem i32 %call1, 50, !optimi !4
  store i32 %rem, i32* %r, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc23, %entry
  %0 = load i32, i32* %i, align 4, !optimi !1
  %cmp = icmp slt i32 %0, 512, !optimi !5
  br i1 %cmp, label %for.body, label %for.end25

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !optimi !1
  %cmp4 = icmp slt i32 %1, 512, !optimi !5
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond3
  %2 = load i32, i32* %r, align 4, !optimi !4
  %3 = load i32, i32* %i, align 4, !optimi !1
  %add = add nsw i32 %2, %3, !optimi !4
  %4 = load i32, i32* %j, align 4, !optimi !1
  %add7 = add nsw i32 %add, %4, !optimi !4
  %conv8 = sitofp i32 %add7 to double, !optimi !4
  %5 = load double*, double** %a2d.addr, align 8, !optimi !4
  %6 = load i32, i32* %i, align 4, !optimi !1
  %mul = mul nsw i32 %6, 512, !optimi !1
  %idx.ext = sext i32 %mul to i64, !optimi !1
  %add.ptr = getelementptr inbounds double, double* %5, i64 %idx.ext, !optimi !4
  %7 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext9 = sext i32 %7 to i64, !optimi !1
  %add.ptr10 = getelementptr inbounds double, double* %add.ptr, i64 %idx.ext9, !optimi !4
  store double %conv8, double* %add.ptr10, align 8
  %8 = load i32, i32* %i, align 4, !optimi !1
  %9 = load i32, i32* %j, align 4, !optimi !1
  %add11 = add nsw i32 %8, %9, !optimi !1
  %conv12 = sitofp i32 %add11 to double, !optimi !1
  %10 = load double*, double** %b2d.addr, align 8, !optimi !1
  %11 = load i32, i32* %i, align 4, !optimi !1
  %mul13 = mul nsw i32 %11, 512, !optimi !1
  %idx.ext14 = sext i32 %mul13 to i64, !optimi !1
  %add.ptr15 = getelementptr inbounds double, double* %10, i64 %idx.ext14, !optimi !1
  %12 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext16 = sext i32 %12 to i64, !optimi !1
  %add.ptr17 = getelementptr inbounds double, double* %add.ptr15, i64 %idx.ext16, !optimi !1
  store double %conv12, double* %add.ptr17, align 8
  %13 = load double*, double** %c2d.addr, align 8, !optimi !1
  %14 = load i32, i32* %i, align 4, !optimi !1
  %mul18 = mul nsw i32 %14, 512, !optimi !1
  %idx.ext19 = sext i32 %mul18 to i64, !optimi !1
  %add.ptr20 = getelementptr inbounds double, double* %13, i64 %idx.ext19, !optimi !1
  %15 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext21 = sext i32 %15 to i64, !optimi !1
  %add.ptr22 = getelementptr inbounds double, double* %add.ptr20, i64 %idx.ext21, !optimi !1
  store double 0.000000e+00, double* %add.ptr22, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %16 = load i32, i32* %j, align 4, !optimi !1
  %inc = add nsw i32 %16, 1, !optimi !7
  store i32 %inc, i32* %j, align 4
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  br label %for.inc23

for.inc23:                                        ; preds = %for.end
  %17 = load i32, i32* %i, align 4, !optimi !1
  %inc24 = add nsw i32 %17, 1, !optimi !7
  store i32 %inc24, i32* %i, align 4
  br label %for.cond

for.end25:                                        ; preds = %for.cond
  %18 = load i32, i32* %r, align 4, !optimi !4
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0), i32 %18), !optimi !4
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @oclh_timing_setup(double* %a2d, i32 %BytesPerWord) #0 {
entry:
  %a2d.addr = alloca double*, align 8, !optimi !4
  %BytesPerWord.addr = alloca i32, align 4, !optimi !4
  %quantum = alloca i32, align 4, !optimi !7
  %t = alloca double, align 8, !optimi !4
  %i = alloca i32, align 4, !optimi !1
  %j = alloca i32, align 4, !optimi !1
  store double* %a2d, double** %a2d.addr, align 8
  store i32 %BytesPerWord, i32* %BytesPerWord.addr, align 4
  %0 = load i32, i32* %BytesPerWord.addr, align 4, !optimi !4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.3, i32 0, i32 0), i32 %0), !optimi !4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.4, i32 0, i32 0), i64 512, i64 512), !optimi !4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.5, i32 0, i32 0), i64 262144, i32 0), !optimi !4
  %1 = load i32, i32* %BytesPerWord.addr, align 4, !optimi !4
  %conv = sitofp i32 %1 to double, !optimi !4
  %mul = fmul double %conv, 2.500000e-01, !optimi !11
  %2 = load i32, i32* %BytesPerWord.addr, align 4, !optimi !4
  %conv4 = sitofp i32 %2 to double, !optimi !4
  %mul5 = fmul double %conv4, 0x3F30000000000000, !optimi !12
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i32 0, i32 0), double %mul, double %mul5), !optimi !4
  %3 = load i32, i32* %BytesPerWord.addr, align 4, !optimi !4
  %conv7 = sitofp i32 %3 to double, !optimi !4
  %mul8 = fmul double 3.000000e+00, %conv7, !optimi !4
  %mul9 = fmul double %mul8, 2.500000e-01, !optimi !11
  %4 = load i32, i32* %BytesPerWord.addr, align 4, !optimi !4
  %conv10 = sitofp i32 %4 to double, !optimi !4
  %mul11 = fmul double 3.000000e+00, %conv10, !optimi !13
  %mul12 = fmul double %mul11, 0x3F30000000000000, !optimi !14
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.7, i32 0, i32 0), double %mul9, double %mul12), !optimi !4
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.8, i32 0, i32 0), i32 5), !optimi !4
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([83 x i8], [83 x i8]* @.str.9, i32 0, i32 0)), !optimi !4
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.10, i32 0, i32 0)), !optimi !4
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  %call18 = call i32 @checktick(), !optimi !4
  store i32 %call18, i32* %quantum, align 4
  %cmp = icmp sge i32 %call18, 1, !optimi !5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %quantum, align 4, !optimi !7
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.11, i32 0, i32 0), i32 %5), !optimi !4
  br label %if.end

if.else:                                          ; preds = %entry
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.12, i32 0, i32 0)), !optimi !4
  store i32 1, i32* %quantum, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call22 = call double @mysecond(), !optimi !4
  store double %call22, double* %t, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc38, %if.end
  %6 = load i32, i32* %i, align 4, !optimi !1
  %cmp23 = icmp slt i32 %6, 512, !optimi !5
  br i1 %cmp23, label %for.body, label %for.end40

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc, %for.body
  %7 = load i32, i32* %j, align 4, !optimi !1
  %cmp26 = icmp slt i32 %7, 512, !optimi !5
  br i1 %cmp26, label %for.body28, label %for.end

for.body28:                                       ; preds = %for.cond25
  %8 = load double*, double** %a2d.addr, align 8, !optimi !4
  %9 = load i32, i32* %i, align 4, !optimi !1
  %mul29 = mul nsw i32 %9, 512, !optimi !1
  %idx.ext = sext i32 %mul29 to i64, !optimi !1
  %add.ptr = getelementptr inbounds double, double* %8, i64 %idx.ext, !optimi !4
  %10 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext30 = sext i32 %10 to i64, !optimi !1
  %add.ptr31 = getelementptr inbounds double, double* %add.ptr, i64 %idx.ext30, !optimi !4
  %11 = load double, double* %add.ptr31, align 8, !optimi !4
  %mul32 = fmul double 2.000000e+00, %11, !optimi !4
  %12 = load double*, double** %a2d.addr, align 8, !optimi !4
  %13 = load i32, i32* %i, align 4, !optimi !1
  %mul33 = mul nsw i32 %13, 512, !optimi !1
  %idx.ext34 = sext i32 %mul33 to i64, !optimi !1
  %add.ptr35 = getelementptr inbounds double, double* %12, i64 %idx.ext34, !optimi !4
  %14 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext36 = sext i32 %14 to i64, !optimi !1
  %add.ptr37 = getelementptr inbounds double, double* %add.ptr35, i64 %idx.ext36, !optimi !4
  store double %mul32, double* %add.ptr37, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body28
  %15 = load i32, i32* %j, align 4, !optimi !1
  %inc = add nsw i32 %15, 1, !optimi !7
  store i32 %inc, i32* %j, align 4
  br label %for.cond25

for.end:                                          ; preds = %for.cond25
  br label %for.inc38

for.inc38:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4, !optimi !1
  %inc39 = add nsw i32 %16, 1, !optimi !7
  store i32 %inc39, i32* %i, align 4
  br label %for.cond

for.end40:                                        ; preds = %for.cond
  %call41 = call double @mysecond(), !optimi !4
  %17 = load double, double* %t, align 8, !optimi !4
  %sub = fsub double %call41, %17, !optimi !6
  %mul42 = fmul double 1.000000e+06, %sub, !optimi !4
  store double %mul42, double* %t, align 8
  %call43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  %18 = load double, double* %t, align 8, !optimi !4
  %conv44 = fptosi double %18 to i32, !optimi !4
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13, i32 0, i32 0), i32 %conv44), !optimi !4
  %19 = load double, double* %t, align 8, !optimi !4
  %20 = load i32, i32* %quantum, align 4, !optimi !7
  %conv46 = sitofp i32 %20 to double, !optimi !7
  %div = fdiv double %19, %conv46, !optimi !4
  %conv47 = fptosi double %div to i32, !optimi !4
  %call48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.14, i32 0, i32 0), i32 %conv47), !optimi !4
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.15, i32 0, i32 0)), !optimi !4
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.16, i32 0, i32 0)), !optimi !4
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  %call52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.17, i32 0, i32 0)), !optimi !4
  %call53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.18, i32 0, i32 0)), !optimi !4
  %call54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.19, i32 0, i32 0)), !optimi !4
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  ret void
}

; Function Attrs: nounwind uwtable
define void @oclh_display_setup() #0 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.20, i32 0, i32 0)), !optimi !4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.21, i32 0, i32 0)), !optimi !4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.22, i32 0, i32 0), i32 5), !optimi !4
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.23, i32 0, i32 0), i32 1), !optimi !4
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.24, i32 0, i32 0), i32 512), !optimi !4
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.25, i32 0, i32 0), i32 262144), !optimi !4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.26, i32 0, i32 0), i32 1), !optimi !4
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.27, i32 0, i32 0), i32 1), !optimi !4
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  ret void
}

; Function Attrs: nounwind uwtable
define void @oclh_log_results(double* %a2d, double* %b2d, double* %c2d) #0 {
entry:
  %a2d.addr = alloca double*, align 8, !optimi !4
  %b2d.addr = alloca double*, align 8, !optimi !4
  %c2d.addr = alloca double*, align 8, !optimi !4
  %myfile = alloca %struct._IO_FILE*, align 8, !optimi !4
  %i = alloca i32, align 4, !optimi !1
  %j = alloca i32, align 4, !optimi !1
  store double* %a2d, double** %a2d.addr, align 8
  store double* %b2d, double** %b2d.addr, align 8
  store double* %c2d, double** %c2d.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.28, i32 0, i32 0)), !optimi !4
  %call1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30, i32 0, i32 0)), !optimi !4
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %myfile, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i32, i32* %i, align 4, !optimi !1
  %cmp = icmp slt i32 %0, 512, !optimi !5
  br i1 %cmp, label %for.body, label %for.end20

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !optimi !1
  %cmp3 = icmp slt i32 %1, 512, !optimi !5
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %myfile, align 8, !optimi !4
  %3 = load i32, i32* %i, align 4, !optimi !1
  %4 = load i32, i32* %j, align 4, !optimi !1
  %5 = load double*, double** %a2d.addr, align 8, !optimi !4
  %6 = load i32, i32* %i, align 4, !optimi !1
  %mul = mul nsw i32 %6, 512, !optimi !1
  %idx.ext = sext i32 %mul to i64, !optimi !1
  %add.ptr = getelementptr inbounds double, double* %5, i64 %idx.ext, !optimi !4
  %7 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext5 = sext i32 %7 to i64, !optimi !1
  %add.ptr6 = getelementptr inbounds double, double* %add.ptr, i64 %idx.ext5, !optimi !4
  %8 = load double, double* %add.ptr6, align 8, !optimi !4
  %9 = load double*, double** %b2d.addr, align 8, !optimi !4
  %10 = load i32, i32* %i, align 4, !optimi !1
  %mul7 = mul nsw i32 %10, 512, !optimi !1
  %idx.ext8 = sext i32 %mul7 to i64, !optimi !1
  %add.ptr9 = getelementptr inbounds double, double* %9, i64 %idx.ext8, !optimi !4
  %11 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext10 = sext i32 %11 to i64, !optimi !1
  %add.ptr11 = getelementptr inbounds double, double* %add.ptr9, i64 %idx.ext10, !optimi !4
  %12 = load double, double* %add.ptr11, align 8, !optimi !4
  %13 = load double*, double** %c2d.addr, align 8, !optimi !4
  %14 = load i32, i32* %i, align 4, !optimi !1
  %mul12 = mul nsw i32 %14, 512, !optimi !1
  %idx.ext13 = sext i32 %mul12 to i64, !optimi !1
  %add.ptr14 = getelementptr inbounds double, double* %13, i64 %idx.ext13, !optimi !4
  %15 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext15 = sext i32 %15 to i64, !optimi !1
  %add.ptr16 = getelementptr inbounds double, double* %add.ptr14, i64 %idx.ext15, !optimi !4
  %16 = load double, double* %add.ptr16, align 8, !optimi !4
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.31, i32 0, i32 0), i32 %3, i32 %4, double %8, double %12, double %16), !optimi !4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %17 = load i32, i32* %j, align 4, !optimi !1
  %inc = add nsw i32 %17, 1, !optimi !7
  store i32 %inc, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %18 = load i32, i32* %i, align 4, !optimi !1
  %inc19 = add nsw i32 %18, 1, !optimi !7
  store i32 %inc19, i32* %i, align 4
  br label %for.cond

for.end20:                                        ; preds = %for.cond
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %myfile, align 8, !optimi !4
  %call21 = call i32 @fclose(%struct._IO_FILE* %19), !optimi !4
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.32, i32 0, i32 0)), !optimi !4
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @oclh_verify_results(double* %a2d, double* %b2d, double* %c2d, double %scalarval) #0 {
entry:
  %retval = alloca i32, align 4, !optimi !7
  %a2d.addr = alloca double*, align 8, !optimi !4
  %b2d.addr = alloca double*, align 8, !optimi !4
  %c2d.addr = alloca double*, align 8, !optimi !4
  %scalarval.addr = alloca double, align 8, !optimi !4
  %goldval = alloca double, align 8, !optimi !4
  %i = alloca i32, align 4, !optimi !1
  %j = alloca i32, align 4, !optimi !1
  store double* %a2d, double** %a2d.addr, align 8
  store double* %b2d, double** %b2d.addr, align 8
  store double* %c2d, double** %c2d.addr, align 8
  store double %scalarval, double* %scalarval.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.20, i32 0, i32 0)), !optimi !4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %entry
  %0 = load i32, i32* %i, align 4, !optimi !1
  %cmp = icmp slt i32 %0, 512, !optimi !5
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !optimi !1
  %cmp2 = icmp slt i32 %1, 512, !optimi !5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load double*, double** %a2d.addr, align 8, !optimi !4
  %3 = load i32, i32* %i, align 4, !optimi !1
  %mul = mul nsw i32 %3, 512, !optimi !1
  %idx.ext = sext i32 %mul to i64, !optimi !1
  %add.ptr = getelementptr inbounds double, double* %2, i64 %idx.ext, !optimi !4
  %4 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext4 = sext i32 %4 to i64, !optimi !1
  %add.ptr5 = getelementptr inbounds double, double* %add.ptr, i64 %idx.ext4, !optimi !4
  %5 = load double, double* %add.ptr5, align 8, !optimi !4
  store double %5, double* %goldval, align 8
  %6 = load double*, double** %c2d.addr, align 8, !optimi !4
  %7 = load i32, i32* %i, align 4, !optimi !1
  %mul6 = mul nsw i32 %7, 512, !optimi !1
  %idx.ext7 = sext i32 %mul6 to i64, !optimi !1
  %add.ptr8 = getelementptr inbounds double, double* %6, i64 %idx.ext7, !optimi !4
  %8 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext9 = sext i32 %8 to i64, !optimi !1
  %add.ptr10 = getelementptr inbounds double, double* %add.ptr8, i64 %idx.ext9, !optimi !4
  %9 = load double, double* %add.ptr10, align 8, !optimi !4
  %10 = load double, double* %goldval, align 8, !optimi !4
  %cmp11 = fcmp une double %9, %10, !optimi !5
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.33, i32 0, i32 0)), !optimi !4
  %11 = load i32, i32* %i, align 4, !optimi !1
  %12 = load i32, i32* %j, align 4, !optimi !1
  %13 = load double, double* %goldval, align 8, !optimi !4
  %14 = load double*, double** %c2d.addr, align 8, !optimi !4
  %15 = load i32, i32* %i, align 4, !optimi !1
  %mul13 = mul nsw i32 %15, 512, !optimi !1
  %idx.ext14 = sext i32 %mul13 to i64, !optimi !1
  %add.ptr15 = getelementptr inbounds double, double* %14, i64 %idx.ext14, !optimi !4
  %16 = load i32, i32* %j, align 4, !optimi !1
  %idx.ext16 = sext i32 %16 to i64, !optimi !1
  %add.ptr17 = getelementptr inbounds double, double* %add.ptr15, i64 %idx.ext16, !optimi !4
  %17 = load double, double* %add.ptr17, align 8, !optimi !4
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.34, i32 0, i32 0), i32 %11, i32 %12, double %13, double %17), !optimi !4
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %18 = load i32, i32* %j, align 4, !optimi !1
  %inc = add nsw i32 %18, 1, !optimi !7
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %19 = load i32, i32* %i, align 4, !optimi !1
  %inc20 = add nsw i32 %19, 1, !optimi !7
  store i32 %inc20, i32* %i, align 4
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.35, i32 0, i32 0)), !optimi !4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end21, %if.then
  %20 = load i32, i32* %retval, align 4, !optimi !7
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define void @oclh_calculate_performance() #0 {
entry:
  %k = alloca i32, align 4, !optimi !7
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.20, i32 0, i32 0)), !optimi !4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.36, i32 0, i32 0)), !optimi !4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.2, i32 0, i32 0)), !optimi !4
  store i32 1, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !optimi !7
  %cmp = icmp slt i32 %0, 5, !optimi !5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %k, align 4, !optimi !7
  %2 = load i32, i32* %k, align 4, !optimi !7
  %idxprom = sext i32 %2 to i64, !optimi !7
  %arrayidx = getelementptr inbounds [5 x double], [5 x double]* @time_total_alltimesteps_kernels, i64 0, i64 %idxprom, !optimi !4
  %3 = load double, double* %arrayidx, align 8, !optimi !4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.37, i32 0, i32 0), i32 %1, double %3), !optimi !4
  %4 = load double, double* @avgtime, align 8, !optimi !4
  %5 = load i32, i32* %k, align 4, !optimi !7
  %idxprom4 = sext i32 %5 to i64, !optimi !7
  %arrayidx5 = getelementptr inbounds [5 x double], [5 x double]* @time_total_alltimesteps_kernels, i64 0, i64 %idxprom4, !optimi !4
  %6 = load double, double* %arrayidx5, align 8, !optimi !4
  %add = fadd double %4, %6, !optimi !4
  store double %add, double* @avgtime, align 8
  %7 = load double, double* @mintime, align 8, !optimi !4
  %8 = load i32, i32* %k, align 4, !optimi !7
  %idxprom6 = sext i32 %8 to i64, !optimi !7
  %arrayidx7 = getelementptr inbounds [5 x double], [5 x double]* @time_total_alltimesteps_kernels, i64 0, i64 %idxprom6, !optimi !4
  %9 = load double, double* %arrayidx7, align 8, !optimi !4
  %cmp8 = fcmp olt double %7, %9, !optimi !5
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %10 = load double, double* @mintime, align 8, !optimi !4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %11 = load i32, i32* %k, align 4, !optimi !7
  %idxprom9 = sext i32 %11 to i64, !optimi !7
  %arrayidx10 = getelementptr inbounds [5 x double], [5 x double]* @time_total_alltimesteps_kernels, i64 0, i64 %idxprom9, !optimi !4
  %12 = load double, double* %arrayidx10, align 8, !optimi !4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %10, %cond.true ], [ %12, %cond.false ], !optimi !4
  store double %cond, double* @mintime, align 8
  %13 = load double, double* @maxtime, align 8, !optimi !4
  %14 = load i32, i32* %k, align 4, !optimi !7
  %idxprom11 = sext i32 %14 to i64, !optimi !7
  %arrayidx12 = getelementptr inbounds [5 x double], [5 x double]* @time_total_alltimesteps_kernels, i64 0, i64 %idxprom11, !optimi !4
  %15 = load double, double* %arrayidx12, align 8, !optimi !4
  %cmp13 = fcmp ogt double %13, %15, !optimi !5
  br i1 %cmp13, label %cond.true14, label %cond.false15

cond.true14:                                      ; preds = %cond.end
  %16 = load double, double* @maxtime, align 8, !optimi !4
  br label %cond.end18

cond.false15:                                     ; preds = %cond.end
  %17 = load i32, i32* %k, align 4, !optimi !7
  %idxprom16 = sext i32 %17 to i64, !optimi !7
  %arrayidx17 = getelementptr inbounds [5 x double], [5 x double]* @time_total_alltimesteps_kernels, i64 0, i64 %idxprom16, !optimi !4
  %18 = load double, double* %arrayidx17, align 8, !optimi !4
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false15, %cond.true14
  %cond19 = phi double [ %16, %cond.true14 ], [ %18, %cond.false15 ], !optimi !4
  store double %cond19, double* @maxtime, align 8
  br label %for.inc

for.inc:                                          ; preds = %cond.end18
  %19 = load i32, i32* %k, align 4, !optimi !7
  %inc = add nsw i32 %19, 1, !optimi !15
  store i32 %inc, i32* %k, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @oclh_disp_timing_profile() #0 {
entry:
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 284936)"}
!1 = !{!"(0, 0, 0)"}
!2 = !{!"(1e+06, 1e+06, 0)"}
!3 = !{!"(4.29497e+15, -4.29497e+15, 0)"}
!4 = !{!"(2.14748e+09, -2.14748e+09, 0)"}
!5 = !{!"(1, 0, 0)"}
!6 = !{!"(4.29497e+09, -4.29497e+09, 0)"}
!7 = !{!"(1, 1, 0)"}
!8 = !{!"(-1, -1, 0)"}
!9 = !{!"(2147.48, -2147.48, 6)"}
!10 = !{!"(2.14749e+09, -2.14749e+09, 6)"}
!11 = !{!"(5.36871e+08, -5.36871e+08, 2)"}
!12 = !{!"(524288, -524288, 12)"}
!13 = !{!"(6.44245e+09, -6.44245e+09, 0)"}
!14 = !{!"(1.57286e+06, -1.57286e+06, 12)"}
!15 = !{!"(2, 2, 0)"}
