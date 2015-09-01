// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DFCDExpense.m instead.

#import "_DFCDExpense.h"

const struct DFCDExpenseAttributes DFCDExpenseAttributes = {
	.amount = @"amount",
	.recurrent = @"recurrent",
	.type = @"type",
};

@implementation DFCDExpenseID
@end

@implementation _DFCDExpense

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DFCDExpense" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DFCDExpense";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DFCDExpense" inManagedObjectContext:moc_];
}

- (DFCDExpenseID*)objectID {
	return (DFCDExpenseID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"amountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"amount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"recurrentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"recurrent"];
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

@dynamic recurrent;

- (BOOL)recurrentValue {
	NSNumber *result = [self recurrent];
	return [result boolValue];
}

- (void)setRecurrentValue:(BOOL)value_ {
	[self setRecurrent:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveRecurrentValue {
	NSNumber *result = [self primitiveRecurrent];
	return [result boolValue];
}

- (void)setPrimitiveRecurrentValue:(BOOL)value_ {
	[self setPrimitiveRecurrent:[NSNumber numberWithBool:value_]];
}

@dynamic type;

@end

