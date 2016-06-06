//
//  CheckInViewController.m
//  MOMO
//
//  Created by 黄梓伦 on 6/2/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "CheckInViewController.h"
#import "CheckInModel.h"


NSString * const checkInCellIdentifier = @"checkInIdentifier";

@interface CheckInViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSString *start;

@property (nonatomic, strong) UITableView *checkInTableView;

@property (nonatomic, strong) NSMutableArray *checkInDataArray;

@end

@implementation CheckInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.start = @"";
    [self creatUI];
    
    
}

- (void)creatUI
{
    
    __weak typeof(self) weakSelf = self;
    self.checkInTableView = [[UITableView alloc] init];
    
    [self.checkInTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.view);
        
    }];
    
    self.checkInTableView.delegate = self;
    
    self.checkInTableView.dataSource = self;
    
    [self.checkInTableView registerNib:[UINib nibWithNibName:@"CheckInCell" bundle:nil] forCellReuseIdentifier:checkInCellIdentifier];
    
    
    self.checkInTableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
        
        [weakSelf requestWithStart:weakSelf.start];
       
        weakSelf.checkInTableView.mj_footer.hidden = YES;
        
        
    }];
    
    self.checkInTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf requestWithStart:weakSelf.start];
        
        weakSelf.checkInTableView.mj_header.hidden = YES;
        
        
    }];
    
    [self.checkInTableView.mj_header beginRefreshing];
}


- (void)requestWithStart:(NSString *)start
{
    
    __weak typeof(self) weakSelf = self;
    NSString *url;
    if (!start) {
        
        url = checkInAPI;
        
    }else
    {
        url = [checkInAPI stringByAppendingString:[NSString stringWithFormat:@"start=%@",start]];
    }
    
    
    [self.httpManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        CheckInModel *model = [CheckInModel yy_modelWithJSON:responseObject];
        
        if ([self.checkInTableView.mj_footer isHidden]) {
            
            [self.checkInDataArray removeAllObjects];
            
        }
        
        [self.checkInDataArray addObject:model.meows_list];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakSelf.checkInTableView reloadData];
            
            [weakSelf.checkInTableView.mj_header endRefreshing];
            [weakSelf.checkInTableView.mj_footer endRefreshing];
            weakSelf.checkInTableView.mj_header.hidden = NO;
            weakSelf.checkInTableView.mj_footer.hidden = NO;
            
            if (model.is_last_page) {
                
                [weakSelf.checkInTableView.mj_footer endRefreshingWithNoMoreData];
                [KVNProgress showSuccessWithStatus:@"没有更多数据了，亲~"];
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [KVNProgress showErrorWithStatus:error.localizedDescription];
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
