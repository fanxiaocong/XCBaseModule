//
//  NSArray+XCExtension.h
//  XCCategoryExample
//
//  Created by 樊小聪 on 2018/2/28.
//  Copyright © 2018年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (XCExtension)

/**
 *  获取数组中指定下标的元素，如果下标越界，则返回nil
 *
 *  @param index 下标
 */
- (id)objectOrNilAtIndex:(NSUInteger)index;

/**
 *  将数组转化为json字符串
 */
- (NSString *)toJsonString;

@end



@interface NSMutableArray (XCExtension)

/**
 *  移除数组里面的第一个元素（如果数组为空，则不做任何操作）
 */
- (void)removeFirstObject;

/**
 *  在数组后面追加一个元素（如果追加的元素为nil，则不做任何操作）
 */
- (void)appendObject:(id)object;

/**
 *  在数组后面追加一组元素（如果追加的数组为nil，则不做任何操作）
 */
- (void)appendObjects:(NSArray *)objects;

/**
 *  在数组最前面插入一个元素（如果插入的元素为nil，则不做任何操作）
 */
- (void)prependObject:(id)object;

/**
 *  在数组最前面插入一组元素（如果插入的数组为nil，则不做任何操作）
 */
- (void)prependObjects:(id)objects;

/**
 *  在数组指定的下标位置处插入一组元素
 */
- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index;

/**
 *  数组反转
 */
- (void)reverse;

@end
