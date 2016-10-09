//
//  KNBBaseModel.h
//  KenuoTraining
//
//  Created by ... on 16/2/25.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "MTLManagedObjectAdapter.h"
#import <Mantle/Mantle.h>
#import <MagicalRecord/MagicalRecord.h>

@interface KNBBaseModel : MTLModel<MTLJSONSerializing, MTLManagedObjectSerializing>
/**
 * search后转变为model模型
 */
+ (NSArray *)searchAll;
+ (NSArray *)searchWithKey:(id)key;
+ (NSArray *)searchWithKey:(id)key value:(id)value;
+ (NSArray *)searchWithPredicate:(NSPredicate *)dicate;

/**
 * search后未进行转换
 */
+ (NSArray *)search;
+ (NSArray *)searchKey:(id)key;
+ (NSArray *)searchKey:(id)key ascending:(BOOL)ascending;
+ (NSArray *)searchKey:(id)key value:(id)value;

/**
 * 转换为model模型
 */
+ (NSArray *)classToModel:(NSArray *)res;

// delete
+ (BOOL)deleteKey:(id)key value:(id)value;
+ (BOOL)deleteModel;

/**
 * 模型(转换后的模型不能调用)
 */
+ (BOOL)deleteWithModel:(id)model;

/**
 *  通过主健的值删除模型(适用于单个主键)
 */
+ (BOOL)deletePrimaryKeyValue:(id)value;

/**
 *  通过predicate条件进行删除
 */
+ (BOOL)deleteWithPredicate:(NSPredicate *)predicate;

/**
 *  保存数据模型
 */
+ (void)saveWithModel:(id)model resultBlock:(void(^)(BOOL success))block;


#pragma mark - Json To Model
/**
 *  通过数据获取 模型或者模型数组
 */
+ (id)changeResponseJSONObject:(id)obj;

/**
 *  通过数据获取模型数组
 */
+ (NSArray *)changeJSONArray:(NSArray *)ary;

@end
