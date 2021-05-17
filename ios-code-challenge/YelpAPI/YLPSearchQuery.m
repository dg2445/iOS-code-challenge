//
//  YLPSearchQuery.m
//  ios-code-challenge
//
//  Created by Dustin Lange on 1/21/18.
//  Copyright © 2018 Dustin Lange. All rights reserved.
//

#import "YLPSearchQuery.h"

@interface YLPSearchQuery()

@property (nonatomic, copy) NSString *location;

@end

@implementation YLPSearchQuery

- (instancetype)initWithLocation:(NSString *)location
{
    if(self = [super init]) {
        _location = location;
        
    }
    
    return self;
}

- (NSDictionary *)parameters
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if(self.location) {
        params[@"location"] = self.location;
    }
    
    if(self.term) {
        params[@"term"] = self.term;
    }
    
    if(self.radiusFilter > 0) {
        params[@"radius"] = @(self.radiusFilter);
    }
    
    if(self.categoryFilter != nil && self.categoryFilter.count > 0) {
        params[@"categories"] = [self.categoryFilter componentsJoinedByString:@","];
    }
    
    if(self.sortBy != nil) {
        params[@"sort_by"] = self.sortBy;
    }
   if(self.latitude != nil) {
        params[@"latitude"] = self.latitude;
    }
    
    if(self.longitude != nil) {
        params[@"longitude"] = self.longitude;
    }
    
    if(self.limit) {
        params[@"limit"] = @(self.limit);
    }
    
    if(self.offset) {
        params[@"offset"] = @(self.offset);
    }
    
    return params;
}

- (NSArray<NSString *> *)categoryFilter {
    return _categoryFilter ?: @[];
}

@end
