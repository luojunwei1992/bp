//
//  ViewController.m
//  bigPicture
//
//  Created by comma on 16/5/18.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIImageView *bigP;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在tableview上面插入一张图片
    [self insertBigPicture];
    
    //设置偏移量
    self.tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);

}

- (void)insertBigPicture
{
    _bigP = [[UIImageView alloc] init];
    _bigP.image = [UIImage imageNamed:@"mine_bg"];
    
    _bigP.frame = CGRectMake(0, -200, [UIScreen mainScreen].bounds.size.width, 200);
    
    [self.tableView addSubview:_bigP];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetY = scrollView.contentOffset.y;
    
    NSLog(@"%lf----------offsetY",offSetY);
    
    if (offSetY < -200) {
        
        CGRect f = _bigP.frame;
        
        f.origin.y = offSetY;
        
        f.size.height = - offSetY;
        
       _bigP.frame = f;
    }
    
}


@end
