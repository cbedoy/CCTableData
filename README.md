# CCTableData

*CCTableData is intended to be used to create a model of a UITableViewController in a single class, then have the relevant UITableViewController look to the CCTableData instance for all of its logic.*

## <u>Including in your project</u>

1. Clone repository or download zipped release
2. Import all the files in the `CCTableData` group in the demo project into your project
3. `#import "CCTableData.h"` in your .pch file or in the files you want to use it in

## <u>Using CCTableData</u>

CCTableData is essentially a model for a UITableViewController. It contains an NSMutableArray of the sections that are in the UITableViewController, along with some convenience methods.

There are two primary reasons I made this, and think it could be useful:

1. You can create a model for a UITableView outside of the actual class. *Yes, I know, we can always implement the DataSource delegate for this, but you can do things like generate a brand new UITableViewController completely in code on the fly easier this way.*
2. Block-based actions for your UITableViewCell interactions. Really, blocks are my favorite things, so being able to use them for interacting with the UITableView is just my happy day.

## <u>The Demo Project</u>

Really, the best way to get used to it is to see it in action.
Check out my demo project I've included. All you really need to look at is the `-[viewDidLoad]` method in the `TableViewDemo.m` file to get a grasp of whats going on.

## Contributing

This is still very much a work in progress for me. I'll be updating this project as I update it for my own use. If you want to extend it, please feel free- and if you want to give back, send me a pull request. 

## License

Released under the [MIT License] (https://tldrlegal.com/license/mit-license).