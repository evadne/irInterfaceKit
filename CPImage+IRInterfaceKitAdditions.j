//	CPImage+IRInterfaceKitAdditions.j
//	Evadne Wu
	
@import <AppKit/CPImage.j>

	
	
	
	
@implementation CPImage (IRInterfaceKitAdditions)

+ (CPImage) bundledImageNamed:(CPString)imageName {
	
	return [CPImage imageNamed:imageName inBundleOf:[CPApp delegate]];
	
//	return [[[self class] alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:imageName]];
	
}

+ (CPImage) imageNamed:(CPString)imageName inBundleOf:(id)sender {
	
	return [[[self class] alloc] initWithContentsOfFile:[[CPBundle bundleForClass:[sender class]] pathForResource:imageName]];
	
}

@end




