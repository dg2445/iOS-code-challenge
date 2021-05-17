//
//  YLPBusiness.h
//  ios-code-challenge
//
//  Created by Dustin Lange on 1/21/18.
//  Copyright © 2018 Dustin Lange. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface YLPBusiness : NSObject

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

/**
 *  Yelp id of this business.
 */
@property (nonatomic, readonly, copy) NSString *identifier;

/**
 *  Name of this business.
 */
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSArray *categories;
@property (nonatomic, readonly, copy) NSNumber *reviews;
@property (nonatomic, readonly, copy) NSNumber *rating;
@property (nonatomic, readonly, copy) NSNumber *distance;
@property (nonatomic, readonly, copy) NSString *price;
@property (nonatomic, readonly, copy) NSData *image;
@end

NS_ASSUME_NONNULL_END
