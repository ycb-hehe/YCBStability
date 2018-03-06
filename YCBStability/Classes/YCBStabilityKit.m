//
//  YCBStabilityBest.m
//  Pods
//
//  Created by ycb on 2018/3/6.
//
//

#import "YCBStabilityKit.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
@interface YCBStabilityLogs : NSObject

+ (NSString *)crashReason:(NSString *)reson
                  release:(NSString *)releaseLog
                 otherLog:(NSString *)otherLog;

@end

@implementation YCBStabilityLogs

+ (NSString *)crashReason:(NSString *)reson
                  release:(NSString *)releaseLog
                 otherLog:(NSString *)otherLog
{
    NSMutableString *mutStr = [NSMutableString string];
    [mutStr appendString:@"\n \n/**NSAssert断言,Creash仅限于Debug模式\n"];
    [mutStr appendString:[NSString stringWithFormat:@"/**Creash原因:%@ \n",reson]];
    [mutStr appendString:[NSString stringWithFormat:@"/**Release模式下:%@ \n",releaseLog]];
    [mutStr appendString:[NSString stringWithFormat:@"/**其它:%@ \n",otherLog]];
    
    return (NSString *)mutStr;
}

@end

////////////////////////////////////////////////////////////////
@implementation YCBNonEmpty

+ (BOOL)isArray:(id)object
{
    return [object isKindOfClass:[NSArray class]] && [(NSArray*)object count] > 0;
}

+ (BOOL)isSet:(id)object
{
    
    return [object isKindOfClass:[NSSet class]] && [(NSSet*)object count] > 0;
}

+ (BOOL)isString:(id)text
{
    return [text isKindOfClass:[NSString class]] && [(NSString*)text length] > 0;
}

+ (BOOL)isDictionary:(id)object
{
    return [object isKindOfClass:[NSDictionary class]] && [(NSDictionary *)object count] >0;
}

@end

////////////////////////////////////////////////////////////////

@interface NSArray (YCBStability)
@end

@implementation NSArray (YCBStability)

+ (void)load
{
    array_method_exchangeClass(objc_getClass("__NSArrayI"));
  //  array_method_exchangeClass( objc_getClass("__NSArray0"));
  //  array_method_exchangeClass(objc_getClass("__NSSingleObjectArrayI"));
  //  array_method_exchangeClass( objc_getClass("__NSPlaceholderArray"));
}

void array_method_exchangeClass(Class cls) {
    
    array_method_exchangeImplementations(cls,@selector(objectAtIndex:), @selector(safeObjectAtIndex:));
    array_method_exchangeImplementations(cls,@selector(indexOfObject:), @selector(safeIndexOfObject:));
}


void array_method_exchangeImplementations(Class cls, SEL name, SEL name2) {
    
    Method fromMethod = class_getInstanceMethod(cls, name);
    Method toMethod = class_getInstanceMethod(cls, name2);
    method_exchangeImplementations(fromMethod, toMethod);
}




- (NSUInteger)safeIndexOfObject:(id)anObject
{
    NSAssert((anObject && [self containsObject:anObject]),([YCBStabilityLogs crashReason:@"元素不存在"
                                                                                 release:@"返回0"
                                                                                otherLog:nil]));
    if (anObject && [self containsObject:anObject]) {
        return [self safeIndexOfObject:anObject];
    } else {
        return 0;
    }
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
    NSAssert((index < self.count),([YCBStabilityLogs crashReason:@"数组越界"
                                                         release:@"返回nil"
                                                        otherLog:[NSString stringWithFormat:@"数组Count:%@ 参数下标index:%@",@(self.count),@(index)]]));
    if (index < self.count){
        return [self safeObjectAtIndex:index];
    }else{
        return nil;
    }
}

@end

///////////////////////////////////////////////////////////

@interface NSMutableArray (YCBStability)
@end

@implementation NSMutableArray (YCBStability)

+ (void)load
{
    mutArray_method_exchangeImplementations(@selector(addObject:), @selector(safeAddObject:));
    
    mutArray_method_exchangeImplementations(@selector(insertObject:atIndex:),@selector(safeInsertObject:atIndex:));
    
    mutArray_method_exchangeImplementations(@selector(removeObjectAtIndex:),@selector(safeRemoveObjectAtIndex:));
}

- (void)safeAddObject:(id)anObject
{
    NSAssert((anObject), ([YCBStabilityLogs crashReason:@"被添加的元素不存在"
                                                release:@"不执行该方法"
                                               otherLog:nil]));
    if (anObject) {
        [self safeAddObject:anObject];
    }
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    NSAssert((anObject), ([YCBStabilityLogs crashReason:@"被添加的元素不存在"
                                                release:@"不执行该方法"
                                               otherLog:nil]));
    
    if (anObject) {
        [self safeInsertObject:anObject atIndex:index];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    NSAssert((index < self.count), ([YCBStabilityLogs crashReason:@"被移除的元素index越界"
                                                          release:@"不执行该方法"
                                                         otherLog:nil]));
    
    if (index < self.count) {
        [self safeRemoveObjectAtIndex:index];
    }
}

Class objc_NSMutArrayClass() {
    
    //return objc_getClass("__NSArrayM");
    return object_getClass([NSMutableArray class]);
}


void mutArray_method_exchangeImplementations(SEL name, SEL name2) {
    
    Method fromMethod = class_getInstanceMethod(objc_NSMutArrayClass(), name);
    Method toMethod = class_getInstanceMethod(objc_NSMutArrayClass(), name2);
    method_exchangeImplementations(fromMethod, toMethod);
}

@end

/////////////////////////////////////////////////////////////////////
@implementation NSDictionary (YCBStability)

- (NSString *)getStringForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    
    NSAssert(([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]),
             ([YCBStabilityLogs crashReason:@"无法获取NSString类型"
                                    release:@"返回@"""
                                   otherLog:[NSString stringWithFormat:@"得到的类型是：%@",
                                             NSStringFromClass([obj class])]]));

    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj stringValue];
    } else {
        return @"";
    }
}

- (NSArray *)getArrayForKey:(id)key
{
    id obj = [self objectForKey:key];

    NSAssert(([obj isKindOfClass:[NSString class]]),
             ([YCBStabilityLogs crashReason:@"无法获取NSArray类型"
                                    release:@"返回[NSArray array]实例"
                                   otherLog:[NSString stringWithFormat:@"得到的类型是：%@",
                                             NSStringFromClass([obj class])]]));
    
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj;
    } else {
        return [NSArray array];
    }
}


- (NSDictionary *)getDictinaryForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    NSAssert(([obj isKindOfClass:[NSDictionary class]]),
             ([YCBStabilityLogs crashReason:@"无法获取NSDictionary类型"
                                    release:@"返回[NSDictionary dictionary]实例"
                                   otherLog:[NSString stringWithFormat:@"得到的类型是：%@",
                                             NSStringFromClass([obj class])]]));

    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    } else {
        return [NSDictionary dictionary];
    }
}

- (int)getIntForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    NSAssert(([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]),
             ([YCBStabilityLogs crashReason:@"不是NSString或NSNumber，无法转化成int类型"
                                    release:@"返回0"
                                   otherLog:[NSString stringWithFormat:@"得到的类型是：%@",
                                             NSStringFromClass([obj class])]]));

    if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]) {
        return  [obj intValue];
    } else {
        return 0;
    }
}

- (float)getFloatForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    NSAssert(([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]),
             ([YCBStabilityLogs crashReason:@"不是NSString或NSNumber，无法转化成float类型"
                                    release:@"返回0"
                                   otherLog:[NSString stringWithFormat:@"得到的类型是：%@",
                                             NSStringFromClass([obj class])]]));

    
    if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]) {
        return  [obj floatValue];
    } else {
        return 0;
    }
}

- (BOOL)getBoolForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    NSAssert(([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]),
             ([YCBStabilityLogs crashReason:@"不是NSString或NSNumber，无法转化成BOOL类型"
                                    release:@"返回NO"
                                   otherLog:[NSString stringWithFormat:@"得到的类型是：%@",
                                             NSStringFromClass([obj class])]]));

    if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]) {
        return  [obj boolValue];
    } else {
        return NO;
    }
}


@end


///////////////////////////////////////////////////////
@interface NSMutableDictionary (YCBStability)
@end


@implementation NSMutableDictionary (YCBStability)

- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey;
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

@end


///////////////////////////////////////////////////////


@interface NSMutableSet (YCBStability)

@end

@implementation NSMutableSet (YCBStability)

+ (void)load
{

    mutSet_method_exchangeImplementations(@selector(addObject:), @selector(safeAddObject:));
}

- (void)safeAddObject:(id)anObject
{
    NSAssert((anObject), ([YCBStabilityLogs crashReason:@"被添加的元素不存在"
                                                release:@"不执行该方法"
                                               otherLog:nil]));

    if (anObject) {
        [self safeAddObject:anObject];
    }
}

Class objc_NSMutSetClass() {
    
    return objc_getClass("__NSSetM");
}


void mutSet_method_exchangeImplementations(SEL name, SEL name2) {
    
    Method fromMethod = class_getInstanceMethod(objc_NSMutSetClass(), name);
    Method toMethod = class_getInstanceMethod(objc_NSMutSetClass(), name2);
    method_exchangeImplementations(fromMethod, toMethod);
}

@end
