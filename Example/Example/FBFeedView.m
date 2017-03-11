//
//  FBFeedView.m
//  FBLayout
//
//  Created by 沈强 on 2017/1/11.
//  Copyright © 2017年 qiang.shen. All rights reserved.
//

#import "FBFeedView.h"
#import "UIView+FBLayout.h"
#import "FBLayoutDiv.h"

@interface FBFeedView ()

@property (nonatomic, strong)  UILabel *titleLabel;
@property (nonatomic, strong)  UILabel *contentLabel;
@property (nonatomic, strong)  UIImageView *contentImageView;
@property (nonatomic, strong)  UILabel *usernameLabel;
@property (nonatomic, strong)  UILabel *timeLabel;

@end


@implementation FBFeedView

- (instancetype)initWithModel:(FBFeedModel *)model {
  if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)]) {
    [self configView];
    [self configData:model];
    [self layoutView];
  }
  
  return self;
}

- (void)configView {
  
  _titleLabel = [UILabel new];
  [self addSubview:_titleLabel];
  
  _contentLabel = [UILabel new];
  [self addSubview:_contentLabel];
  _contentLabel.numberOfLines = 0;
  
  _contentImageView = [UIImageView new];
  _contentImageView.contentMode = UIViewContentModeScaleAspectFit;
  [self addSubview:_contentImageView];
  
  _usernameLabel = [UILabel new];
  [self addSubview:_usernameLabel];
  
  _timeLabel = [UILabel new];
  _timeLabel.textAlignment = NSTextAlignmentRight;
  [self addSubview:_timeLabel];
}

- (void)configData:(FBFeedModel *)model {
  
  _titleLabel.attributedText = [[NSAttributedString alloc] initWithString:model.title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
  
  _contentLabel.attributedText = [[NSAttributedString alloc] initWithString:model.content attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
  
  _contentImageView.image = [UIImage imageNamed:model.imageName];
  
  _usernameLabel.attributedText = [[NSAttributedString alloc] initWithString:model.username attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
  
  _timeLabel.attributedText = [[NSAttributedString alloc] initWithString:model.time attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
  
}

- (void)layoutView {
  
  
  [_titleLabel fb_makeLayout:^(FBLayout *layout) {
    layout.margin.equalToEdgeInsets(UIEdgeInsetsMake(10, 0, 0, 0)).wrapContent();
  }];
  
  
  [_contentLabel fb_makeLayout:^(FBLayout *layout) {
    layout.margin.equalToEdgeInsets(UIEdgeInsetsMake(10, 0, 0, 0)).wrapContent();
  }];
  
  [_contentImageView fb_makeLayout:^(FBLayout *layout) {
    layout.margin.equalToEdgeInsets(UIEdgeInsetsMake(10, 0, 0, 0)).wrapContent();
  }];
  
  [_usernameLabel fb_makeLayout:^(FBLayout *layout) {
    layout.wrapContent().flexGrow.equalTo(@(1.0));
  }];
 
  [_timeLabel fb_makeLayout:^(FBLayout *layout) {
      layout.wrapContent().flexGrow.equalTo(@(1.0));
  }];
  
  FBLayoutDiv *div = [FBLayoutDiv layoutDivWithFlexDirection:FBFlexDirectionRow ];
  [div fb_makeLayout:^(FBLayout *layout) {
    layout.flexDirection.equalTo(@(FBFlexDirectionRow)).justifyContent.equalTo(@(FBJustifySpaceBetween)).alignItems.equalTo(@(FBAlignFlexStart)).margin.equalToEdgeInsets(UIEdgeInsetsMake(10, 0, 0, 0)).children(@[_usernameLabel,_timeLabel]);
  }];
  
  [self fb_makeLayout:^(FBLayout *layout) {
    layout.flexDirection.equalTo(@(FBFlexDirectionColumn)).margin.equalToEdgeInsets(UIEdgeInsetsMake(0, 15, 0, 15)).alignItems.equalTo(@(FBAlignFlexStart)).children(@[_titleLabel,_contentLabel,_contentImageView,div]);
  }];
  
}

@end
