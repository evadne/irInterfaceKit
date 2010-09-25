//	CPNinePartImage+IRInterfaceKitAdditions.j
//	Evadne Wu at Iridia, 2010
	
@import <AppKit/CPImage.j>
	
	
	
	
	
@implementation CPNinePartImage (IRInterfaceKitAdditions)

+ (CPNinePartImage) imageWithBaseName:(CPString)baseName inBundle:(CPBundle)bundle withInset:(CGInset)inset {
	
	var image = function (index) {
		
		return [bundle pathForResource:baseName + @"_0" + index + @".png"];
		
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