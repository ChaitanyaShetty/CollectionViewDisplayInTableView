//
//  ViewController.m
//  TableViewDisplayInCollectionView
//
//  Created by test on 3/2/17.
//  Copyright © 2017 com.neorays. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "CollectionViewCell.h"
#import "AppDelegate.h"

@interface ViewController ()
{
    NSArray *categoriesArray, *categoriesCollectionArray;
    AppDelegate *app;
    NSMutableDictionary *contentOffsetDictionary;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initialSetUp];
    app = (AppDelegate *) [UIApplication sharedApplication].delegate;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initialSetUp {
    self.categoryList = [[NSArray alloc]initWithObjects:@"General Topics", @"General Aptitude", @"Technical Aptitude", nil];
    NSArray *generalAptitude=@[@"Odd Man Out & Series",@"Probability",@"Boats & Streams",@"Ratio & Proportion",@"Problems on HCF & LCM",@"Permutation & Combination"];
    NSArray *technicalAptitude=@[@"Java",@"C",@"C++",@"C#"];
    NSArray *generalTopics= @[@"History",@"Geography",@"Science",@"Arts",@"Technology",@"Food-Drink"];
    categoriesArray = [[NSArray alloc]initWithObjects:generalTopics, technicalAptitude, generalAptitude, nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return categoriesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.categoryLabel.text = [_categoryList objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [cell setCollectionViewDataSourceDelegate:(id)self indexPath:indexPath];
    NSInteger index = cell.categoryCollectionView.indexPath.row;
    CGFloat horizontalOffset = [contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.categoryCollectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
    

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    categoriesCollectionArray = categoriesArray [[(IndexedCollectionView *)collectionView indexPath].row];
    return categoriesCollectionArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    @try {
        categoriesCollectionArray = categoriesArray [[(IndexedCollectionView *)collectionView indexPath].row];
        cell.myImageView.image = [UIImage imageNamed:[categoriesCollectionArray objectAtIndex:indexPath.item]];
    } @catch (NSException *exception) {
        
    }
    return cell;
}
@end
