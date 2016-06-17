//
//  AlbumViewController.m
//  MOMO
//
//  Created by 黄梓伦 on 5/31/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "AlbumViewController.h"
#import "AlbumCell.h"

NSString *const AlbumCellIdentifier = @"AlbumCellIdentifier";

@interface AlbumViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *albumDataArray;
@property (nonatomic, strong) UITableView *albumTableView;
@property (nonatomic, assign) NSInteger start;

@end

@implementation AlbumViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.start = 0;
    [self createUI];
}


- (BOOL)canBecomeFirstResponder
{
    return YES;
}



- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    

        
    [self.albumTableView.mj_header beginRefreshing];

    
}

- (NSMutableArray *)albumDataArray
{
    
    if (!_albumDataArray) {
        
        _albumDataArray = [[NSMutableArray alloc] init];
        
    }
    
    return _albumDataArray;
    
}

- (void)createUI
{

    
    //Sets navigation title
    [self addNavigationTitle:@"看图册" andColor:[UIColor blackColor]];
    
    //Adds back navigation item
    [self addBackButtonWithImage:[UIImage imageNamed:@"browser-back-black"]];
    
    
    __weak typeof(self) weakSelf = self; //creates weakSelf to avoid
    
    self.albumTableView = [[UITableView alloc] init];
    
    [self.view addSubview:self.albumTableView];
    
    self.albumTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //Sets constrains of albumTableView
    [self.albumTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.view);
        
        
    }];
    
    
    self.albumTableView.dataSource = self;
    
    self.albumTableView.delegate = self;
    
    self.albumTableView.rowHeight = ScreenH - 64;
    
    
    
    [self.albumTableView registerNib:[UINib nibWithNibName:@"AlbumCell" bundle:nil]
              forCellReuseIdentifier:AlbumCellIdentifier];
    
    
    self.albumTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        [weakSelf requestWithStart:weakSelf.start];
        weakSelf.start += 10;
        weakSelf.albumTableView.mj_footer.hidden = YES;
        
    }];
    
    self.albumTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf requestWithStart:weakSelf.start];
        weakSelf.start += 10;
        weakSelf.albumTableView.mj_header.hidden = YES;
        
    }];
    
    
    [self.albumTableView.mj_header beginRefreshing];
}

- (void)requestWithStart:(NSInteger)start
{
    NSString *url;
    
    if (start == 0) {
        
        url = albumAPI;
    }else
    {
        url = [albumAPI stringByAppendingString:[NSString stringWithFormat:@"&start=%ld",start]];
    }
   
   [self.httpManager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
       AlbumModel *model = [AlbumModel yy_modelWithJSON:responseObject];
       
       if ([self.albumTableView.mj_footer isHidden]) {
        
           [self.albumDataArray removeAllObjects];
        
       }
       
       [self.albumDataArray addObjectsFromArray:model.meows];
       
        __weak typeof(self) weakSelf = self;
       
       dispatch_async(dispatch_get_main_queue(), ^{
           
           [weakSelf.albumTableView reloadData];
           [weakSelf.albumTableView.mj_header endRefreshing];
           [weakSelf.albumTableView.mj_footer endRefreshing];
           weakSelf.albumTableView.mj_header.hidden = NO;
           weakSelf.albumTableView.mj_footer.hidden= NO;
           
           if (model.is_last_page) {
               
               [weakSelf.albumTableView.mj_footer endRefreshingWithNoMoreData];
               [KVNProgress showWithStatus:@"没有更多数据了，亲~"];
           }
        
       });
       
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
       [KVNProgress showErrorWithStatus:[NSString stringWithFormat:@"%@",error.localizedDescription]];
       
       
   }];
    
}

#pragma mark - UITableView delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.albumDataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:AlbumCellIdentifier];
    
    Meows *model = self.albumDataArray[indexPath.row];
    
    cell.model = model;
    
   
    
    return cell;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
