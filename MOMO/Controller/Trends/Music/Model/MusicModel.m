//
//  MusicModel.m
//  MOMO
//
//  Created by 黄梓伦 on 5/29/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "MusicModel.h"

@implementation MusicModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    
    return @{@"meows":[Meows class]};
    
}


@end







@implementation Meows
+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"album_cover":[Album_Cover class],@"category":[Cate class],@"group":[Group class],@"user":[User class],@"thumb":[Thumb class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    
    return @{@"desc":@"description",@"_id":@"id"};
    
    
}
@end


@implementation Group
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    
    return @{@"desc":@"description",@"_id":@"id"};
    
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    
    return @{@"master_info":[Master_Info class],@"thumb":[g_m_thumb class]};
    
}

@end


@implementation g_m_thumb

@end


@implementation Master_Info

@end


@implementation g_m_coordinate

@end


@implementation Thumb

@end


@implementation Album_Cover

@end


@implementation Cate

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"_id":@"id"};
    
}
@end


@implementation User

@end


@implementation u_Coordinate

@end

