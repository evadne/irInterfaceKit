//	CPString+IRInterfaceKitAdditions.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation CPString (IRInterfaceKitAdditions)

- (CPString) stringWithSuffixFromClassOf:(id)sender {
	
	return [self stringByAppendingString:CPStringFromClass([sender class])];
	
}

@end