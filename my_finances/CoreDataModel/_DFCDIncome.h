// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DFCDIncome.h instead.

#import <CoreData/CoreData.h>

extern const struct DFCDIncomeAttributes {
	__unsafe_unretained NSString *amount;
	__unsafe_unretained NSString *type;
} DFCDIncomeAttributes;

@interface DFCDIncomeID : NSManagedObjectID {}
@end

@interface _DFCDIncome : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DFCDIncomeID* objectID;

@property (nonatomic, strong) NSNumber* amount;

@property (atomic) double amountValue;
- (double)amountValue;
- (void)setAmountValue:(double)value_;

//- (BOOL)validateAmount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@end

@interface _DFCDIncome (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAmount;
- (void)setPrimitiveAmount:(NSNumber*)value;

- (double)primitiveAmountValue;
- (void)setPrimitiveAmountValue:(double)value_;

@end
