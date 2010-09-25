//	IRViewController.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRViewController : CPViewController 





+ (CPBundle) bundleForResources {

	return [CPBundle mainBundle];
	
}





+ (CPToolbarItem) sharedToolbarItem {

//	Convention over configuration.
	
	var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier:CPStringFromClass([self class]) + @"ToolbarItem"]; if (toolbarItem == nil) return nil;
	
	
	
	return toolbarItem;
	
}





- (IRViewController) init {
	
	
	
	
	
}





@end




