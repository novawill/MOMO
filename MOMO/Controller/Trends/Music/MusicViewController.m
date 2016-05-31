//
//  MusicViewController.m
//  MOMO
//
//  Created by 黄梓伦 on 5/29/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "MusicViewController.h"
#import "MusicCell.h"
#import "MusicModel.h"

NSString * const MusicCellIdentifier = @"MusicCellIdentifier";

@interface MusicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *musicTableView;
@property (nonatomic, strong) NSMutableArray *musicArray;
@property (nonatomic, assign) NSUInteger start;//Property of Start


@end

@implementation MusicViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.start = 0;
    [self creatView];
    
}
#pragma mark - LazyLoad for _musicArray
- (NSMutableArray *)musicArray
{
    if (!_musicArray) {
        
        _musicArray = [[NSMutableArray alloc] init];
        
        
    }
    return _musicArray;
}



- (void)creatView
{
    //Setting Navigation title with textcolor
    [self addNavigationTitle:@"听音乐" andColor:[UIColor blackColor]];
    
    //Setting backAction Button
    [self addBackButtonWithImage:[UIImage imageNamed:@"browser-back-black"]];
    
    __weak typeof(self) weakSelf = self;

    _musicTableView = [[UITableView alloc] init];
    
    [self.view addSubview:_musicTableView];
    
    _musicTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_musicTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.edges.equalTo(weakSelf.view);
      
        
    }];
    
    _musicTableView.dataSource = self;
    
    //Setting row height
    _musicTableView.rowHeight = ScreenH - 64;//Subtracting the height of UINavigationBar which is 64)
    
    //Resitering MusicCell
    [_musicTableView registerNib:[UINib nibWithNibName:@"MusicCell" bundle:nil] forCellReuseIdentifier:MusicCellIdentifier];
 
    //mj_Header & mj_Footer
    
    _musicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        
        [weakSelf requestDataWithURLWithStart:weakSelf.start];
        weakSelf.start += 10;
        weakSelf.musicTableView.mj_footer.hidden = YES;
       
    }];
    
    
    
    _musicTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        weakSelf.start += 10;
        [weakSelf requestDataWithURLWithStart:weakSelf.start];
        weakSelf.musicTableView.mj_header.hidden = YES;
        
    }];
    //Beginning request
  
    [_musicTableView.mj_header beginRefreshing];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.musicArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:MusicCellIdentifier forIndexPath:indexPath];
    
    Meows *model = self.musicArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
    
}

- (void)requestDataWithURLWithStart:(NSUInteger)start
{
    
    __weak typeof(self) weakSelf = self;
    
    //Setting URL
    NSString *url;
    
    if (start == 0) {
       url = musicAPI;
    }else
    {
       url = [musicAPI stringByAppendingString:[NSString stringWithFormat:@"&start=%lu",start]];
    }
    
    //Requesting datasource
    
    [self.httpManager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        MusicModel *musicModel = [MusicModel yy_modelWithJSON:responseObject];
        
                                             
        if (start == 0) {
            
            [self.musicArray removeAllObjects];
        }
        
        //Adding the parsed data array(i.e meows) to musicArray which is the dataArray for tableView
        [self.musicArray addObjectsFromArray:musicModel.meows];
        
        //Refreshing main UI screen
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //Refreshing TableView
            [weakSelf.musicTableView reloadData];
            //Updating footer and header status
            [weakSelf.musicTableView.mj_header endRefreshing];
            [weakSelf.musicTableView.mj_header endRefreshing];
            weakSelf.musicTableView.mj_header.hidden = NO;
            weakSelf.musicTableView.mj_footer.hidden = NO;
            
            if (self.musicArray.count < 10) {
                
                [weakSelf.musicTableView.mj_footer endRefreshingWithNoMoreData];
                [KVNProgress showSuccessWithStatus:@"没有更多数据了，亲~"];
                
            }else
            {
                
                [weakSelf.musicTableView.mj_footer resetNoMoreData];
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        [KVNProgress showErrorWithStatus:error.localizedDescription];
        
        if (weakSelf.start > 0) {
            
            weakSelf.start--;
        }
        
    }];

}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
