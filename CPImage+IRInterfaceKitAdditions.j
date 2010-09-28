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










@implementation CPNinePartImage (IRInterfaceKitAdditions)

+ (CPNinePartImage) imageWithBaseName:(CPString)baseName inBundle:(CPBundle)bundle withInset:(CGInset)inset {

	var image = function (index) {
	
		return [bundle pathForResource:baseName + @"_" + index + @".png"];
	
	}
	
	return [[CPNinePartImage alloc] initWithImageSlices:[

		[[CPImage alloc] initWithContentsOfFile:image("1") size:CGSizeMake(inset.left, inset.top)],
		[[CPImage alloc] initWithContentsOfFile:image("2") size:CGSizeMake(1.0, inset.top)],
		[[CPImage alloc] initWithContentsOfFile:image("3") size:CGSizeMake(inset.right, inset.top)],

		[[CPImage alloc] initWithContentsOfFile:image("4") size:CGSizeMake(inset.left, 1.0)],
		[[CPImage alloc] initWithContentsOfFile:image("5") size:CGSizeMake(1.0, 1.0)],
		[[CPImage alloc] initWithContentsOfFile:image("6") size:CGSizeMake(inset.right, 1.0)],

		[[CPImage alloc] initWithContentsOfFile:image("7") size:CGSizeMake(inset.left, inset.bottom)],
		[[CPImage alloc] initWithContentsOfFile:image("8") size:CGSizeMake(1.0, inset.bottom)],
		[[CPImage alloc] initWithContentsOfFile:image("9") size:CGSizeMake(inset.right, inset.bottom)]
		
	]];

}

+ (CPNinePartImage) imageWithBaseName:(CPString)baseName inBundleOf:(id)sender withInset:(CGInset)inset {

	return [CPNinePartImage imageWithBaseName:baseName inBundle:[CPBundle bundleForClass:[sender class]] withInset:inset];

}

@end










@implementation CPThreePartImage (IRInterfaceKitAdditions)

+ (CPThreePartImage) imageWithBaseName:(CPString)baseName inBundle:(CPBundle)bundle withInset:(CGInset)inset thickness:(float)thickness vertical:(BOOL)isVertical {

	var image = function (index) {
	
		return [bundle pathForResource:baseName + @"_" + index + @".png"];
	
	}
	
	if (isVertical) {
	
		return [[CPThreePartImage alloc] initWithImageSlices:[

			[[CPImage alloc] initWithContentsOfFile:image("2") size:CGSizeMake(thickness, inset.top)],
			[[CPImage alloc] initWithContentsOfFile:image("5") size:CGSizeMake(thickness, 1.0)],
			[[CPImage alloc] initWithContentsOfFile:image("8") size:CGSizeMake(thickness, inset.bottom)],

		] isVertical:YES];
	
	} else {
		
		return [[CPThreePartImage alloc] initWithImageSlices:[

			[[CPImage alloc] initWithContentsOfFile:image("4") size:CGSizeMake(inset.left, thickness)],
			[[CPImage alloc] initWithContentsOfFile:image("5") size:CGSizeMake(1.0, thickness)],
			[[CPImage alloc] initWithContentsOfFile:image("6") size:CGSizeMake(inset.right, thickness)],

		] isVertical:NO];		
	
	}

}

+ (CPThreePartImage) imageWithBaseName:(CPString)baseName inBundleOf:(id)sender withInset:(CGInset)inset thickness:(float)thickness vertical:(BOOL)isVertical {

	return [CPThreePartImage imageWithBaseName:baseName inBundle:[CPBundle bundleForClass:[sender class]] withInset:inset thickness:thickness vertical:isVertical];

}

@end




