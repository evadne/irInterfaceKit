//	IROverlayFullPlatformWindow.j
//	Evadne Wu at Iridia, 2010
	
@import <AppKit/AppKit.j>

	
	
	
	
@implementation IROverlayFullPlatformWindow : CPWindow {	
	
}

- (IROverlayFullPlatformWindow) init {
	
	self = [super initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessWindowMask];
	if (self == nil) return nil;
	
	[self setFullPlatformWindow:YES];
	[[self contentView] setBackgroundColor:[CPColor colorWithWhite:0.0 alpha:0.75]];
	
	return self;
	
}





- (void) orderFront:(id)sender animated:(BOOL)animated {
	
	
	
}

- (void) orderOut:(id)sender animation:(IRAnimationType)animationType {
	
	
}

@end