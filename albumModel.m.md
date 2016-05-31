//
//  AlbumModel.m
//  MOMO
//
//  Created by 黄梓伦 on 5/31/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel


+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"meows":[Meows class]};
}




@end
@implementation Meows

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"desc":@"description"};
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"category":[Cate class],@"group":[Group class],@"images":[Images class],@"user":[User class]};
}
@end


@implementation Group

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"desc":@"description"};
}

@end


@implementation Thumb

@end


@implementation Master_Info

@end


@implementation Coordinate

@end


@implementation Cert

@end


@implementation Admin_Data

@end


@implementation Coordinate2

@end


@implementation User

@end


@implementation Coordinate3

@end


@implementation Images

@end


