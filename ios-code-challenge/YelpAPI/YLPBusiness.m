//
//  YLPBusiness.m
//  ios-code-challenge
//
//  Created by Dustin Lange on 1/21/18.
//  Copyright © 2018 Dustin Lange. All rights reserved.
//

#import "YLPBusiness.h"

@implementation YLPBusiness

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    if(self = [super init]) {
        _identifier = attributes[@"id"];
        _name = attributes[@"name"];
        _rating = attributes[@"rating"];
        _distance = attributes[@"distance"];
        _categories = attributes[@"categories"];
        _reviews = attributes[@"review_count"];
        _price = attributes[@"price"];
        //TODO: Make async
        _image = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:attributes[@"image_url"]]];
    }
    
    return self;
}

@end
