//
//  ViewController.m
//  bigPicture
//
//  Created by comma on 16/5/18.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+common.h"

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
    
    //去掉nav下面的线
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    //设置nav
    [self setUpNav];

}

- (void)setUpNav
{
    self.navigationItem.title = @"hello";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:nil];
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
    
    UIColor *color = [UIColor blueColor];
    
    CGFloat alpha = (offSetY) / 200;
     //nav隐藏
    if (offSetY < -200) {
        
        CGRect f = _bigP.frame;
        
        f.origin.y = offSetY;
        
        f.size.height = - offSetY;
        
       _bigP.frame = f;
        
        
    }
    
    
    if (offSetY > -30) {
        
       
        [UIView animateWithDuration:1 animations:^{
            
             [self.navigationController.navigationBar alphaNavigationBarView:[color colorWithAlphaComponent:1]];
        }];
        
       
        
    }else{
        
      
        [UIView animateWithDuration:1 animations:^{
            
            [self.navigationController.navigationBar alphaNavigationBarView:[color colorWithAlphaComponent:0]];
        }];
        
    }

   
    
    
}


@end
