//
//  ViewController.m
//  YS_iOS_Other
//
//  Created by YJ on 16/6/6.
//  Copyright © 2016年 YJ. All rights reserved.
//

#import "ViewController.h"

#import "OnePickerViewController.h"
#import "OneCollectionViewController.h"
#import "OneHorizontalTableViewController.h"
#import "OneSearchDisplayController.h"
#import "OneSearchController.h"
#import "ApplicationSettingViewController.h"
#import "CustemSearchViewController.h"


#import "TwoDocumentViewController.h"
#import "YSDefaultsViewController.h"


#import "SevenBaiduViewController.h"


// 11
#import "JianShuNavAnimationViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * otherTableView;

@end

@implementation ViewController
{
    NSArray * _sectionTitle;
    NSMutableArray * _sectionCellContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"目录";
    
    _sectionTitle = @[@"1 控件", @"2 数据持久化", @"3 iCloud", @"4 GCD", @"5 Quartz/OpenGL", @"6 手势/触摸", @"7 Location", @"8 陀螺仪/加速器", @"9 照相机/相片库", @"10 本地化", @"11 一些效果"];
    
    
    NSArray * sectionOne    = @[@"Picker", @"CollectionView", @"横向tableView", @"UISearchDisplayController", @"UISearchController", @"UIApplicaton一些设置", @"仿微信SearchBar"];
    NSArray * sectionTwo    = @[@"沙盒", @"文件", @"归档", @"sqlite", @"CoreData", @"偏好设置"];
    NSArray * sectionThree  = @[@"使用UIDocument管理文件存储", @"添加iCloud支持"];
    NSArray * sectionFour   = @[@"GCD"];
    NSArray * sectionFive   = @[@"Quartz", @"OpenGL"];
    NSArray * sectionSix    = @[@"手势", @"触摸"];
    NSArray * sectionSeven  = @[@"原生", @"百度", @"高德"];
    NSArray * sectionEight  = @[@"陀螺仪", @"加速器"];
    NSArray * sectionNine   = @[@"照相机", @"相片库"];
    NSArray * sectionTen    = @[@"本地化"];
    NSArray * sectionElven  = @[@"导航栏效果"];
    
    if (_sectionCellContent == nil) {
        _sectionCellContent = [NSMutableArray array];
    }
    
    _sectionCellContent = [NSMutableArray arrayWithArray:@[sectionOne, sectionTwo, sectionThree, sectionFour, sectionFive, sectionSix, sectionSeven, sectionEight, sectionNine, sectionTen, sectionElven]];
    
    
    [self initTableView];
    
    //
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTableView
{
    _otherTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    _otherTableView.delegate = self;
    _otherTableView.dataSource = self;
    [self.view addSubview:_otherTableView];
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_sectionCellContent objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sectionTitle count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cell_id = @"CELL_ID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    NSArray * sectionContent = [_sectionCellContent objectAtIndex:indexPath.section];
    cell.textLabel.text = [sectionContent objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_sectionTitle objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int sectionIndex = (int)indexPath.section;
    switch (sectionIndex) {
        case 0:
        {
            if (indexPath.row == 0) {
                
                // "Picker"
                OnePickerViewController * pickerVC = [[OnePickerViewController alloc] init];
                pickerVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:pickerVC animated:YES];
                
            } else if (indexPath.row == 1) {
                
                // “CollectionView”
                OneCollectionViewController * collectionVC = [[OneCollectionViewController alloc] initWithType:ComeFromTypeOneCollection];
                collectionVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:collectionVC animated:YES];
            } else if (indexPath.row == 2) {
                
                // 横向 tableview
                OneHorizontalTableViewController * horizontalVC = [[OneHorizontalTableViewController alloc] init];
                horizontalVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:horizontalVC animated:YES];
            } else if (indexPath.row == 3) {
                
                // UISearchDisplayController
                OneSearchDisplayController * searchVC = [[OneSearchDisplayController alloc] init];
                [self.navigationController pushViewController:searchVC animated:YES];
                
            } else if (indexPath.row == 4) {
                
                // UISearchController
                OneSearchController * searchVC = [[OneSearchController alloc] init];
                [self.navigationController pushViewController:searchVC animated:YES];
                
            } else if (indexPath.row == 5) {
                
                // UIApplicaton一些设置
                ApplicationSettingViewController * appVC = [[ApplicationSettingViewController alloc] init];
                [self.navigationController pushViewController:appVC animated:YES];
                
            } else if (indexPath.row == 6) {
                
                // 仿微信SearchBar
                CustemSearchViewController * searchBarVC = [[CustemSearchViewController alloc] init];
                [self.navigationController pushViewController:searchBarVC animated:YES];
                
            }
        }
            break;
        case 1:
        {
            if (indexPath.row == 0) {
                
                // “沙盒”
                TwoDocumentViewController * collectionVC = [[TwoDocumentViewController alloc] init];
                collectionVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:collectionVC animated:YES];
                
            } else if (indexPath.row == 1) {
                
                // “文件”
                OneCollectionViewController * collectionVC = [[OneCollectionViewController alloc] initWithType:ComeFromTypeTwoFile];
                collectionVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:collectionVC animated:YES];
            
            } else if (indexPath.row == 2) {
                
                // “归档”
                OneCollectionViewController * collectionVC = [[OneCollectionViewController alloc] initWithType:ComeFromTypeTwoArchive];
                collectionVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:collectionVC animated:YES];
                
            } else if (indexPath.row == 3) {
                
                // “sqlite”
                OneCollectionViewController * collectionVC = [[OneCollectionViewController alloc] initWithType:ComeFromTypeTwoSqlite];
                collectionVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:collectionVC animated:YES];
                
            } else if (indexPath.row == 4) {
                
                // “CoreData”
                OneCollectionViewController * collectionVC = [[OneCollectionViewController alloc] initWithType:ComeFromTypeTwoCoreData];
                collectionVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:collectionVC animated:YES];
                
            } else if (indexPath.row == 5) {
            
                // “偏好设置”
                YSDefaultsViewController * defaultVC = [[YSDefaultsViewController alloc] init];
                [self.navigationController pushViewController:defaultVC animated:YES];
                
            }
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            if (indexPath.row == 0) {
                
            } else if (indexPath.row == 1) {
                
                // 百度地图
                SevenBaiduViewController * baiduMapVC = [[SevenBaiduViewController alloc] init];
                [self.navigationController pushViewController:baiduMapVC animated:YES];
            }
        }
            break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            
        }
            break;
        case 9:
        {
            
        }
            break;
        case 10:
        {
            if (indexPath.row == 0) {
                JianShuNavAnimationViewController * jianshuNavVC = [[JianShuNavAnimationViewController alloc] init];
                [self.navigationController pushViewController:jianshuNavVC animated:YES];
            }
        }
            break;
        case 11:
        {
        
        }
            break;
        default:
            break;
    }
        
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

@end
