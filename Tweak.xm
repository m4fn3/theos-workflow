#include <dlfcn.h>
#import <substrate.h>
#import <Foundation/Foundation.h>

//inline bool getPrefBool(NSString *key){
//    return [[[[NSUserDefaults alloc] initWithSuiteName:@"com.m4fn3.gommirativ.preferences.plist"] objectForKey:key] boolValue];
//}

// # define NSLog(fmt, ... ) NSLog((@"Gommirativ | " fmt), ## __VA_ARGS__);

int checkPKGManager(void* this_) {
	// NSLog(@"checkPKGManager()");
	return 0;
}
int checkPath(void* this_){
	// NSLog(@"checkPath()");
	return 0;
}
int hasPackageManagerScheme(void* this_){
	// NSLog(@"hasPackageManagerScheme()");
	return 0;
}
int checkWritable(void* this_){
	// NSLog(@"checkWritable()");
	return 0;
}

%ctor {
	NSLog(@"Gommirativ | Started!!");

	NSString *appPath = [NSString stringWithFormat: @"%@%@", [[NSBundle mainBundle] bundlePath], @"/mirrativ"];
	// NSLog(@"Gommirativ | Found: %@", appPath);
	// void* exec = dlopen([appPath UTF8String], RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
    void* exec = dlopen([appPath UTF8String], RTLD_NOW);

	void* sym_checkPKGManager = dlsym(exec, "$s8mirrativ18JailbreakDetectionC15checkPKGManagerSbvg");
	// NSLog(@"Gommirativ | sym_checkPKGManager addr = %p !!", sym_checkPKGManager);
	MSHookFunction(sym_checkPKGManager,(void*)checkPKGManager, NULL);

	void* sym_checkPath = dlsym(exec, "$s8mirrativ18JailbreakDetectionC9checkPathSbvg");
	// NSLog(@"Gommirativ | sym_checkPath addr = %p !!", sym_checkPath);
	MSHookFunction(sym_checkPath,(void*)checkPath, NULL);

	void* sym_hasPackageManagerScheme = dlsym(exec, "$s8mirrativ18JailbreakDetectionC23hasPackageManagerSchemeSbvg");
	// NSLog(@"Gommirativ | sym_hasPackageManagerScheme addr = %p !!", sym_hasPackageManagerScheme);
	MSHookFunction(sym_hasPackageManagerScheme,(void*)hasPackageManagerScheme, NULL);

	void* sym_checkWritable = dlsym(exec, "$s8mirrativ18JailbreakDetectionC13checkWritableSbvg");
	// NSLog(@"Gommirativ | sym_checkWritable addr = %p !!", sym_checkWritable);
	MSHookFunction(sym_checkWritable,(void*)checkWritable, NULL);
}

// %ctor {
// 	NSLog(@"[*] Started");
// 	NSString *execPath = [[NSString stringWithFormat: @"%@%@", [[NSBundle mainBundle] bundlePath], @"/mirrativ"] UTF8String];
// 	NSLog(@"[*] %@", execPath);
// 	MSImageRef execImage = MSGetImageByName(execPath);
// 	MSImageRef libdyldImage = MSGetImageByName("/usr/lib/system/libdyld.dylib");
// 	void *exec = dlopen(execPath, RTLD_NOW);
//
// 	void *dlopen_global_var_ptr = MSFindSymbol(libdyldImage, "__ZN5dyld45gDyldE"); // if this var exists, it means we're on a version new enough to hook dlopen directly again
// 	if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_14_1 && !dlopen_global_var_ptr) {
// 		// void *dlopen_internal_ptr = MSFindSymbol(libdyldImage, "__ZL15dlopen_internalPKciPv");
// 		// MSHookFunction(dlopen_internal_ptr, (void *)$dlopen_internal, (void* *)&dlopen_internal_orig);
// 		NSLog(@"[*] Using MSFindSymbol");
// 	}
// 	else {
// 		// MSHookFunction(&dlopen, (void *)$dlopen, (void* *)&dlopen_orig);
// 		// void *dlopen_from_ptr = dlsym(libdyldHandle, "dlopen_from");
// 		// if (dlopen_from_ptr) {
// 		// 	MSHookFunction(dlopen_from_ptr, (void *)$dlopen_internal, (void* *)&dlopen_internal_orig);
// 		// }
// 		NSLog(@"[*] Using dlsym");
// 	}
// }


// %ctor {
// 	NSLog(@"[*] Injected!");
//
// 	NSLog(@"[*] dlsym Test");
// 	NSString *execPath = [NSString stringWithFormat: @"%@%@", [[NSBundle mainBundle] bundlePath], @"/mirrativ"];
// 	NSLog(@"-  %@", execPath);
// 	void* handle = dlopen([execPath UTF8String], RTLD_NOW);
// 	if (handle){
// 		NSLog(@"- dlopen ok");
// 		void* symbol = dlsym(handle,"$s8mirrativ18JailbreakDetectionC15checkPKGManagerSbvg");
// 		if (symbol){
// 			NSLog(@"- addr = %p !!", symbol);
// 			MSHookFunction(symbol,(void*)checkPKGManager, NULL);
// 		} else {
// 			NSLog(@"- addr not found ;;");
// 		}
// 	} else {
// 		NSLog(@"- dlopen failed");
// 	}
//
// 	NSLog(@"[*] MSFindSymbol Test");
// 	MSImageRef execImage = MSGetImageByName([execPath UTF8String]);
// 	if (execImage){
// 		NSLog(@"- Image ok");
// 	} else {
// 		NSLog(@"- Image failed");
// 	}
// 	// -- findsymbol --
// 	void* func_addr = MSFindSymbol(execImage, "$s8mirrativ18JailbreakDetectionC15checkPKGManagerSbvg");
// 	if (func_addr){
// 		NSLog(@"- addr = %p", func_addr);
// 	} else {
// 		NSLog(@"- addr not found");
// 	}
//
// 	NSLog(@"[*] Done");
// }
