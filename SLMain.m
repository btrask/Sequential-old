int main(int argc, char const **const argv)
{
	NSAutoreleasePool *const pool = [[NSAutoreleasePool alloc] init];
	NSString *const serverInterface = [[[NSProcessInfo processInfo] environment] objectForKey:@"SL_SERVER_INTERFACE"];
	if(serverInterface) {
		[pool drain];
		return NSApplicationMain(argc, argv);
	} else {
		NSTask *const node = [[[NSTask alloc] init] autorelease];
		[node setLaunchPath:@"/usr/local/bin/node"];
		[node setArguments:[NSArray arrayWithObject:@"/Users/ben/Desktop/SequentialWeb/server/server.js"]];
		[node setEnvironment:[NSDictionary dictionaryWithObjectsAndKeys:
			@"MAC_OS_X", @"SL_PLATFORM_INTERFACE",
			[[NSBundle mainBundle] executablePath], @"SL_GUI_PATH",
			[[NSBundle mainBundle] resourcePath], @"SL_RESOURCE_PATH",
			nil]];
		[node launch];
		[pool drain];
		return EXIT_SUCCESS;
	}
}
