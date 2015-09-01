// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DFCDExpense.h instead.

#import <CoreData/CoreData.h>

extern const struct DFCDExpenseAttributes {
	__unsafe_unretained NSString *amount;
	__unsafe_unretained NSString *recurrent;
	__unsafe_unretained NSString *type;
} DFCDExpenseAttributes;

@interface DFCDExpenseID : NSManagedObjectID {}
@end

@interface _DFCDExpense : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DFCDExpenseID* objectID;

@property (nonatomic, strong) NSNumber* amount;

@property (atomic) double amountValue;
- (double)amountValue;
- (void)setAmountValue:(double)value_;

//- (BOOL)validateAmount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* recurrent;

@property (atomic) BOOL recurrentValue;
- (BOOL)recurrentValue;
- (void)setRecurrentValue:(BOOL)value_;

//- (BOOL)validateRecurrent:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@end

@interface _DFCDExpense (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAmount;
- (void)setPrimitiveAmount:(NSNumber*)value;

- (double)primitiveAmountValue;
- (void)setPrimitiveAmountValue:(double)value_;

- (NSNumber*)primitiveRecurrent;
- (void)setPrimitiveRecurrent:(NSNumber*)value;

- (BOOL)primitiveRecurrentValue;
- (void)setPrimitiveRecurrentValue:(BOOL)value_;

@end
