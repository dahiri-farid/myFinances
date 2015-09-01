// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DFCDIncome.m instead.

#import "_DFCDIncome.h"

const struct DFCDIncomeAttributes DFCDIncomeAttributes = {
	.amount = @"amount",
	.type = @"type",
};

@implementation DFCDIncomeID
@end

@implementation _DFCDIncome

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DFCDIncome" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DFCDIncome";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DFCDIncome" inManagedObjectContext:moc_];
}

- (DFCDIncomeID*)objectID {
	return (DFCDIncomeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"amountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"amount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic amount;

- (double)amountValue {
	NSNumber *result = [self amount];
	return [result doubleValue];
}

- (void)setAmountValue:(double)value_ {
	[self setAmount:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveAmountValue {
	NSNumber *result = [self primitiveAmount];
	return [result doubleValue];
}

- (void)setPrimitiveAmountValue:(double)value_ {
	[self setPrimitiveAmount:[NSNumber numberWithDouble:value_]];
}

@dynamic type;

@end

