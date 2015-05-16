#import "SLAppDelegate.h"
#import "JSONKit.h"

static void SLMessage(NSDictionary *const msg)
{
	NSString *const str = [msg JSONStringWithOptions:JKSerializeOptionEscapeUnicode error:NULL];
	if(str) fprintf(stdout, "%s\n", [str UTF8String]);
}

@implementation SLAppDelegate

- (void)awakeFromNib
{
	(void)[NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
	if(![NSApp isActive]) [self applicationWillBecomeActive:nil];
}

- (void)applicationWillBecomeActive:(NSNotification *)notification
{
	NSProcessInfo *const proc = [NSProcessInfo processInfo];
	SLMessage([NSDictionary dictionaryWithObjectsAndKeys:
		@"open", @"action",
		[proc hostName], @"host",
		nil]);
}

@end
