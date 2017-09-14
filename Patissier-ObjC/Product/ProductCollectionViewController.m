//
//  ProductCollectionViewController.m
//  Patissier-ObjC
//
//  Created by 陳遵丞 on 2017/9/11.
//  Copyright © 2017年 nicklee. All rights reserved.
//

#import "ProductCollectionViewController.h"
#import "ProductCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "APIClient.h"
#import "Product.h"


@interface ProductCollectionViewController () {
   
    NSArray <__kindof Product *> *proudctsInfo;
    
}

@end


@implementation ProductCollectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    APIClient *client = [APIClient new];
    
    client.delegate = self;
    
    [client getProductInformation];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UINib *nib = [UINib nibWithNibName:@"ProductCollectionViewCell" bundle:nil];
    
    [self.collectionView registerNib: nib forCellWithReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didGetValue:(id)value {
    
    proudctsInfo = value;
    
    [self.collectionView reloadData];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return proudctsInfo.count;;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    NSString *mystring =  [proudctsInfo[indexPath.row].productPrice stringValue];
    
    cell.priceLabel.text = mystring;
    
    cell.titleLabel.text = proudctsInfo[indexPath.row].productName;
    
    [cell.productImageView sd_setImageWithURL: proudctsInfo[indexPath.row].imageURL];
     
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 25, 20, 25);
}


@end