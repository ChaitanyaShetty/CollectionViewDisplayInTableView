//
//  TableViewCell.m
//  TableViewDisplayInCollectionView
//
//  Created by test on 3/2/17.
//  Copyright © 2017 com.neorays. All rights reserved.
//

#import "TableViewCell.h"

@implementation IndexedCollectionView

@end
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 9, 10);
    layout.itemSize = CGSizeMake(44, 44);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.categoryCollectionView = [[IndexedCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.categoryCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    self.categoryCollectionView.backgroundColor = [UIColor whiteColor];
    self.categoryCollectionView.showsHorizontalScrollIndicator = NO;
    
    [self.contentView addSubview:self.categoryCollectionView];
    return self;
}

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDelegate,UICollectionViewDataSource>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.categoryCollectionView.dataSource = dataSourceDelegate;
    self.categoryCollectionView.delegate = dataSourceDelegate;
    self.categoryCollectionView.indexPath = indexPath;
    [self.categoryCollectionView setContentOffset:self.categoryCollectionView.contentOffset animated:NO];
    [self.categoryCollectionView reloadData];
}

@end
