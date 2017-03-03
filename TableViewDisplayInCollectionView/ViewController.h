//
//  ViewController.h
//  TableViewDisplayInCollectionView
//
//  Created by test on 3/2/17.
//  Copyright © 2017 com.neorays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *categoryList;
@end

