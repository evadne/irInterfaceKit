//	CPImage+IRInterfaceKitAdditions.j
//	Evadne Wu
	
@import <AppKit/CPImage.j>

	
	
	
	
@implementation CPImage (IRInterfaceKitAdditions)

+ (CPImage) bundledImageNamed:(CPString)imageName {
	
	return [[[self class] alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:imageName]];
	
}

@end




