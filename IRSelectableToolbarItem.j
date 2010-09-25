//	IRSelectableToolbarItem.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRSelectableToolbarItem : CPToolbarItem {
	
	BOOL selected;
	
}

- (IRSelectedToolbarItem) initWithItemIdentifier:(CPString)anItemIdentifier {
	
	self = [super initWithItemIdentifier:anItemIdentifier];
	if (self === nil) return nil;

//	CPImage imageNamed:@"" fromBundleResourcesOf:(id)sender {
	
	
//	[CPBundle bundleForClass:[self class]] resource
	
	return self;
	
}

- (BOOL) isSelected {
	
	return selected;
	
}

- (void) setSelected:(BOOL)inSelectedFlag {
	
	selected = inSelectedFlag;
	[selectedBackdropView setVisible:selected];
	
}

@end