## Overview
**KGViewSeparators** is a small helper library that helps to quickly insert separators into a view. No subclassing required!

Ease of use and customization is not the only benefit. The library especially helps when it comes to cell reuse: it prevents multiple separators from being added to a single view, you can show/hide separators for any cell and more. All you have to worry about is specifying when you want to show/hide a separator and it will just work.

The library currently allows to modify the color, lineWidth and the insets of the separators.

Core Principles:

1. Ease of use
2. Customization
3. Support for view reuse

## Installation

To install using [CocoaPods](https://github.com/cocoapods/cocoapods), add the following to your project Podfile:

```ruby
pod 'KGViewSeparators'
```

Alternatively, drag and drop all of the files in the KGViewSeparators folder into your Xcode project, agreeing to copy files if needed.

## How to Use

### Imports:

```objective-c
#import <UIView+KGViewSeparators.h>
```

### Usage:

**Enum:**

```objective-c
KGViewSeparatorTop
KGViewSeparatorBottom
```

**Objective-C:**

```objective-c
[view kg_show:YES separator:KGViewSeparatorTop color:[UIColor blackColor] lineWidth:KGViewSeparatorLineWidth(1.0) insets:UIEdgeInsetsMake(0, 15.0, 0, 15.0)];
```
**Swift:**

```swift
view.kg_show(true, separator: .Bottom, color:  UIColor.blackColor(), lineWidth: KGViewSeparatorLineWidth(1.0), insets: UIEdgeInsetsZero)
```

**Helper function:**

Line widths should be divided by the screen scale for proper pixel rendering.

```
CGFloat KGViewSeparatorLineWidth(CGFloat lineWidth);
```

## Recommended Usage
Create your own category to simplify code.

```objective-c
@interface UITableViewCell (Separators)
- (void)showTopSeparator:(BOOL)show;
- (void)showBottomSeparator:(BOOL)show;
@end

```

```objective-c
#import <UIView+KGViewSeparators.h>
@implementation UITableViewCell (Separators)
- (void)showTopSeparator:(BOOL)show {
    [self.contentView kg_show:show separator:KGViewSeparatorTop color:[UIColor blackColor] lineWidth:KGViewSeparatorLineWidth(1.0) insets:UIEdgeInsetsMake(0, 15.0, 0, 15.0)];
}
- (void)showBottomSeparator:(BOOL)show {
    [self.contentView kg_show:show separator:KGViewSeparatorBottom color:[UIColor blackColor] lineWidth:KGViewSeparatorLineWidth(1.0) insets:UIEdgeInsetsMake(0, 15.0, 0, 15.0)];
}
@end
```

### Important note:
When adding separators to cells it's important to add separators to the `contentView`.

## Swift Support
KGViewSeparators works with Swift! Checkout the Swift example in the "Examples" folder.

## How Does it Work
KGViewSeparators uses [associated objects](http://nshipster.com/associated-objects/) to store the separator views and the layout is done via Auto Layout. Once stored, the views are simply shown or hidden. By storing the separator views, and the configurations that customize the separators, the library is able to reuse what was already created.

## Credits
Created and maintained by Krisjanis Gaidis. 

## License
KGViewSeparators is released under the MIT license. See LICENSE for details.