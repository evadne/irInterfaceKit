//	CPImage+IRInterfaceKitAdditions.j
//	Evadne Wu
	
	
	
	
	
@implementation CPImage (IRInterfaceKitAdditions)

+ (CPImage) bundledImageNamed:(CPString)imageName {
	
	return [[[self class] alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:imageName]];
	
}

@end




