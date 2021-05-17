//
//  NXTBusinessTableViewCell+YLPBusiness.m
//  ios-code-challenge
//
//  Created by Dustin Lange on 1/21/18.
//  Copyright © 2018 Dustin Lange. All rights reserved.
//

#import "NXTBusinessTableViewCell+YLPBusiness.h"
#import "YLPBusiness.h"

@implementation NXTBusinessTableViewCell (YLPBusiness) 

- (void)configureCell:(YLPBusiness *)business
{
    self.nameLabel.text = business.name;
    self.reviewsLabel.text = [NSString stringWithFormat: @"Reviews: %@", [business.reviews stringValue]];
    self.ratingsLabel.text = [NSString stringWithFormat: @"Rating: %@", [business.rating stringValue]];
    self.thumbnailImage.image = [UIImage imageWithData: business.image];
 
    NSString * categories = @"";
    for (int i = 0; i < business.categories.count; i++)
    {
        NSDictionary * dict = business.categories[i];
        if (i != 0)
        {
            categories = [categories stringByAppendingString:@", "];
        }
        categories = [categories stringByAppendingString:[dict objectForKey:@"title"]];
    }
    self.categoriesLabel.text = categories;

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.roundingIncrement = [NSNumber numberWithDouble:0.1];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    self.distanceLabel.text = [NSString stringWithFormat: @"Distance: %@ Meters", [formatter stringFromNumber:business.distance]];
}
   

#pragma mark - NXTBindingDataForObjectDelegate
- (void)bindingDataForObject:(id)object
{
    [self configureCell:(YLPBusiness *)object];
}

@end
