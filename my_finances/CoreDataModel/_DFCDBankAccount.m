// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DFCDBankAccount.m instead.

#import "_DFCDBankAccount.h"

const struct DFCDBankAccountAttributes DFCDBankAccountAttributes = {
	.balance = @"balance",
};

@implementation DFCDBankAccountID
@end

@implementation _DFCDBankAccount

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DFCDBankAccount" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DFCDBankAccount";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DFCDBankAccount" inManagedObjectContext:moc_];
}

- (DFCDBankAccountID*)objectID {
	return (DFCDBankAccountID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"balanceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"balance"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic balance;

- (double)balanceValue {
	NSNumber *result = [self balance];
	return [result doubleValue];
}

- (void)setBalanceValue:(double)value_ {
	[self setBalance:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveBalanceValue {
	NSNumber *result = [self primitiveBalance];
	return [result doubleValue];
}

- (void)setPrimitiveBalanceValue:(double)value_ {
	[self setPrimitiveBalance:[NSNumber numberWithDouble:value_]];
}

@end

