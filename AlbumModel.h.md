//
//  AlbumModel.h
//  MOMO
//
//  Created by 黄梓伦 on 5/31/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseModel.h"
@class Meows,Group,Thumb,Master_Info,Coordinate,Cert,Admin_Data,Coordinate2,User,Coordinate3,Images,Cate;
@interface AlbumModel : BaseModel<YYModel>

@property (nonatomic, assign) BOOL is_last_page;

@property (nonatomic, strong) NSArray<Meows *> *meows;

@property (nonatomic, assign) NSInteger start;

@end
@interface Meows : NSObject<YYModel>

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, strong) Cate *category;

@property (nonatomic, assign) NSInteger _id;

@property (nonatomic, assign) NSInteger is_post_by_master;

@property (nonatomic, assign) NSInteger image_count;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) NSInteger bang_count;

@property (nonatomic, assign) NSInteger is_filtered;

@property (nonatomic, assign) NSInteger meow_type;

@property (nonatomic, assign) BOOL is_folded;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger object_type;

@property (nonatomic, strong) Group *group;

@property (nonatomic, copy) NSString *meow_status;

@property (nonatomic, strong) NSArray<Images *> *images;

@property (nonatomic, assign) NSInteger create_time;

@property (nonatomic, assign) NSInteger kind;

@property (nonatomic, strong) User *user;

@end

@interface Cate : NSObject

@property (nonatomic, assign) NSInteger _id;

@property (nonatomic, copy) NSString *name;

@end

@interface Group : NSObject<YYModel>

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, assign) NSInteger _id;

@property (nonatomic, copy) NSString *logo_url;

@property (nonatomic, assign) NSInteger campaign_num;

@property (nonatomic, assign) NSInteger discuss_content_num;

@property (nonatomic, strong) Master_Info *master_info;

@property (nonatomic, assign) NSInteger cert_kind_id;

@property (nonatomic, assign) NSInteger publisher_type;

@property (nonatomic, copy) NSString *slogan;

@property (nonatomic, strong) NSArray<Admin_Data *> *admin_data;

@property (nonatomic, strong) Thumb *thumb;

@property (nonatomic, assign) NSInteger member_num;

@property (nonatomic, strong) NSArray<NSString *> *admin_list;

@property (nonatomic, assign) NSInteger topic_content_num;

@property (nonatomic, strong) Cert *cert;

@property (nonatomic, assign) NSInteger kind;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *status;

@end

@interface Thumb : NSObject

@property (nonatomic, copy) NSString *raw;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;

@end

@interface Master_Info : NSObject

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, assign) NSInteger horoscope;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL is_anonymous;

@property (nonatomic, copy) NSString *self_description;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, strong) Coordinate *coordinate;

@end

@interface Coordinate : NSObject

@property (nonatomic, assign) NSInteger longitude;

@property (nonatomic, copy) NSString *area_name;

@property (nonatomic, assign) NSInteger latitude;

@end

@interface Cert : NSObject

@property (nonatomic, assign) NSInteger cert_url_type;

@property (nonatomic, copy) NSString *android_download_url;

@property (nonatomic, copy) NSString *home_page;

@property (nonatomic, assign) NSInteger _id;

@property (nonatomic, copy) NSString *ios_download_url;

@property (nonatomic, copy) NSString *wechat_id;

@property (nonatomic, copy) NSString *weibo_url;

@property (nonatomic, assign) NSInteger cert_kind_id;

@property (nonatomic, copy) NSString *ios_stats_download_url;

@property (nonatomic, copy) NSString *app_name;

@end

@interface Admin_Data : NSObject

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, assign) NSInteger horoscope;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL is_anonymous;

@property (nonatomic, copy) NSString *self_description;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, strong) Coordinate2 *coordinate;

@end

@interface Coordinate2 : NSObject

@property (nonatomic, assign) NSInteger longitude;

@property (nonatomic, copy) NSString *area_name;

@property (nonatomic, assign) NSInteger latitude;

@end

@interface User : NSObject

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, assign) NSInteger horoscope;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL is_anonymous;

@property (nonatomic, copy) NSString *self_description;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, strong) Coordinate3 *coordinate;

@end

@interface Coordinate3 : NSObject

@property (nonatomic, assign) NSInteger longitude;

@property (nonatomic, copy) NSString *area_name;

@property (nonatomic, assign) NSInteger latitude;

@end

@interface Images : NSObject

@property (nonatomic, copy) NSString *raw;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;

@end

