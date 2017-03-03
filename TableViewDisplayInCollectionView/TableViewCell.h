//
//  TableViewCell.h
//  TableViewDisplayInCollectionView
//
//  Created by test on 3/2/17.
//  Copyright © 2017 com.neorays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface  IndexedCollectionView : UICollectionView
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

static NSString *CollectionViewCellIdentifier = @"CollectionViewCell";
@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet IndexedCollectionView *categoryCollectionView;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDelegate, UICollectionViewDataSource>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
