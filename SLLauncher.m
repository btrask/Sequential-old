#include <CoreServices/CoreServices.h>

int main(int argc, char const **const argv)
{
	NSAutoreleasePool *const pool = [[NSAutoreleasePool alloc] init];
	NSApplicationLoad();

//	SetSystemUIMode( kUIModeNormal, 0);
//osx_foreground_hack();
//	[NSApp setMainMenu:[[[NSMenu alloc] initWithTitle:@"asdf"] autorelease]];
//	[NSApp setPresentationOptions:NSApplicationPresentationDefault];

	ProcessSerialNumber proc = {};
	(void)GetCurrentProcess(&proc);
	(void)TransformProcessType(&proc, kProcessTransformToForegroundApplication);

	NSImageView *const v = [[[NSImageView alloc] initWithFrame:NSZeroRect] autorelease];
	[v setImageScaling:NSImageScaleProportionallyUpOrDown];
	[v setImage:[NSImage imageNamed:NSImageNameUser]];
	[[NSApp dockTile] setContentView:v];
	[[NSApp dockTile] display];
//	NSDockTile



	sleep(10);
	[pool drain];
	return EXIT_SUCCESS;
}
