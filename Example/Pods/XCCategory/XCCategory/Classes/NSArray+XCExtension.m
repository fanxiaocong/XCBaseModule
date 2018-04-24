//
//  NSArray+XCExtension.m
//  XCCategoryExample
//
//  Created by 樊小聪 on 2018/2/28.
//  Copyright © 2018年 樊小聪. All rights reserved.
//

#import "NSArray+XCExtension.h"

@implementation NSArray (XCExtension)

- (id)objectOrNilAtIndex:(NSUInteger)index
{
    if (self.count > index) {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

- (NSString *)toJsonString
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}

@end



@implementation NSMutableArray (XCExtension)

- (void)removeFirstObject
{
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

- (void)appendObject:(id)object
{
    if (object) {
        [self addObject:object];
    }
}

- (void)appendObjects:(NSArray *)objects
{
    if (!objects)   return;
    
    [self addObjectsFromArray:objects];
}

- (void)prependObject:(id)object
{
    if (object) {
        [self insertObject:object atIndex:0];
    }
}

- (void)prependObjects:(id)objects
{
    if (!objects)   return;
    
    NSUInteger i = 0;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index
{
    if (!objects)   return;
    
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)reverse
{
    NSUInteger count = self.count;
    NSUInteger middleIndex = floor(count * 0.5);
    
    for (NSUInteger i = 0; i < middleIndex; i++)
    {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count-(i+1))];
    }
}

@end
