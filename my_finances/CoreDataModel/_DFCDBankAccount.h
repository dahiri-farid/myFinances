// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DFCDBankAccount.h instead.

#import <CoreData/CoreData.h>

extern const struct DFCDBankAccountAttributes {
	__unsafe_unretained NSString *balance;
} DFCDBankAccountAttributes;

@interface DFCDBankAccountID : NSManagedObjectID {}
@end

@interface _DFCDBankAccount : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DFCDBankAccountID* objectID;

@property (nonatomic, strong) NSNumber* balance;

@property (atomic) double balanceValue;
- (double)balanceValue;
- (void)setBalanceValue:(double)value_;

//- (BOOL)validateBalance:(id*)value_ error:(NSError**)error_;

@end

@interface _DFCDBankAccount (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveBalance;
- (void)setPrimitiveBalance:(NSNumber*)value;

- (double)primitiveBalanceValue;
- (void)setPrimitiveBalanceValue:(double)value_;

@end
