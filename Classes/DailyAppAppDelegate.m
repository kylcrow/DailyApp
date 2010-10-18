//
//  DailyAppAppDelegate.m
//  DailyApp
//
//  Created by Kyle Crow on 10/2/10.
//  Copyright 2010 Student. All rights reserved.
//

#import "DailyAppAppDelegate.h"
#import "DailiesController.h"
#import "RandomFact.h"
#import "Challenges.h"
#import "Quote.h"
#import "Record.h"
#import "Words.h"
#import "Historicals.h"

static NSUInteger kNumberOfPages = 6;

@interface DailyAppAppDelegate (PrivateMethods)

- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;

@end

@implementation DailyAppAppDelegate

@synthesize window, pageControl, scrollView, viewControllers, randomFacts, challenges, quotes, records, words, historicals;
@synthesize btnPage1, btnPage2, btnPage3, btnPage4, btnPage5, btnPage6, count;

#pragma mark -
#pragma mark Application lifecycle

- (IBAction)changePage:(id)sender {
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
	//    [self loadScrollViewWithPage:page - 1];
	//    [self loadScrollViewWithPage:page];
	//    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

- (IBAction)gotoPageOne:(id)sender {
	pageControl.currentPage = 0;
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
	//    [self loadScrollViewWithPage:page - 1];
	//    [self loadScrollViewWithPage:page];
	//    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;	
}

- (IBAction)gotoPageTwo:(id)sender {
	pageControl.currentPage = 1;
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
	//    [self loadScrollViewWithPage:page - 1];
	//    [self loadScrollViewWithPage:page];
	//    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;	
}


- (IBAction)gotoPageThree:(id)sender {
	pageControl.currentPage = 2;
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
	//    [self loadScrollViewWithPage:page - 1];
	//    [self loadScrollViewWithPage:page];
	//    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;	
}


- (IBAction)gotoPageFour:(id)sender {
	pageControl.currentPage = 3;
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
	//    [self loadScrollViewWithPage:page - 1];
	//    [self loadScrollViewWithPage:page];
	//    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;	
}


- (IBAction)gotoPageFive:(id)sender {
	pageControl.currentPage = 4;
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
	//    [self loadScrollViewWithPage:page - 1];
	//    [self loadScrollViewWithPage:page];
	//    [self loadScrollViewWithPage:page + 1];
	
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;	
}


- (IBAction)gotoPageSix:(id)sender {
	pageControl.currentPage = 5;
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
	//    [self loadScrollViewWithPage:page - 1];
	//    [self loadScrollViewWithPage:page];
	//    [self loadScrollViewWithPage:page + 1];
	
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;	
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Setup some globals
	databaseName = @"DailyDB.sqlite";
	
	// Get the path to the documents directory and append the databaseName
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
	
	// Execute the "checkAndCreateDatabase" function
	[self checkAndCreateDatabase];
	
	// Query the database for all animal records and construct the arrays
	[self readQuotesFromDatabase];
	[self readRandomFactsFromDatabase];
	[self readRecordsFromDatabase];
	[self readWordsFromDatabase];
	[self readChallengesFromDatabase];
	[self readHistoricalsFromDatabase];
	
	
    // view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    [controllers release];
	
    // a page is the width of the scroll view
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumberOfPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
	
    pageControl.numberOfPages = kNumberOfPages;
    pageControl.currentPage = 0;
	
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    count = 0;
	[self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    [self loadScrollViewWithPage:2];
    [self loadScrollViewWithPage:3];
    [self loadScrollViewWithPage:4];
    [self loadScrollViewWithPage:5];
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= kNumberOfPages) return;
	
    // replace the placeholder if necessary
    DailiesController *controller = [viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[DailiesController alloc] initWithPageNumber:page];
        [viewControllers replaceObjectAtIndex:page withObject:controller];
        [controller release];
    }
	
    // add the controller's view to the scroll view
    if (nil == controller.view.superview) {
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [scrollView addSubview:controller.view];
    }
	count++;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
	
}

-(void) checkAndCreateDatabase{
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;	
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];	
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:databasePath];	
	// If the database already exists then return without doing anything
	if(success) return;	
	// If not then proceed to copy the database from the application to the users filesystem	
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];	
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
	[fileManager release];
}

-(void) readRandomFactsFromDatabase {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	randomFacts = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select Fact, Date, Visited from RandomFacts";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *aFact = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 1)];
				NSInteger *aVisited = sqlite3_column_int(compiledStatement, 2);
				
				// Create a new animal object with the data from the database
				RandomFact *fact = [[RandomFact alloc] initWithFact:aFact date:aDate visited:aVisited];
				
				// Add the animal object to the animals Array
				[randomFacts addObject:fact];
				
				[fact release];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
	
}

-(void) readChallengesFromDatabase {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	challenges = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select Challenge, Date, Visited from Challenges";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *aChallenge = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 1)];
				NSInteger *aVisited = sqlite3_column_int(compiledStatement, 2);
				
				// Create a new animal object with the data from the database
				Challenges *challenge = [[Challenges alloc] initWithChallenges:aChallenge date:aDate visited:aVisited];
				
				// Add the animal object to the animals Array
				[challenges addObject:challenge];
				[challenge release];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
	}
	sqlite3_close(database);
}

-(void) readQuotesFromDatabase {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	quotes = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select Quote, Date, Visited from Quotes";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *aQuote = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 1)];
				NSInteger *aVisited = sqlite3_column_int(compiledStatement, 2);
				
				// Create a new animal object with the data from the database
				Quote *quote = [[Quote alloc] initWithQuote:aQuote date:aDate visited:aVisited];
				
				// Add the animal object to the animals Array
				[quotes addObject:quote];
				[quote release];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
	}
	sqlite3_close(database);
}

-(void) readRecordsFromDatabase {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	records = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select Record, Date, Visited from Records";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *aRecord = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 1)];
				NSInteger *aVisited = sqlite3_column_int(compiledStatement, 2);
				
				// Create a new animal object with the data from the database
				Record *record = [[Record alloc] initWithRecord:aRecord date:aDate visited:aVisited];
				
				// Add the animal object to the animals Array
				[records addObject:record];
				[record release];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
	}
	sqlite3_close(database);
}

-(void) readWordsFromDatabase {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	words = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select Word, Date, Visited from Words";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *aWords = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 1)];
				NSInteger *aVisited = sqlite3_column_int(compiledStatement, 2);
				
				// Create a new animal object with the data from the database
				Words *word = [[Words alloc] initWithWords:aWords date:aDate visited:aVisited];
				
				// Add the animal object to the animals Array
				[words addObject:word];
				[word release];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
	}
	sqlite3_close(database);
}

-(void) readHistoricalsFromDatabase {
	// Setup the database object
	sqlite3 *database;
	
	// Init the animals Array
	historicals = [[NSMutableArray alloc] init];
	
	// Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select Historical, Date, Visited from Historicals";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *aHistorical = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSDate *aDate = [NSDate dateWithTimeIntervalSince1970:sqlite3_column_double(compiledStatement, 1)];
				NSInteger *aVisited = sqlite3_column_int(compiledStatement, 2);
				
				// Create a new animal object with the data from the database
				Historicals *historical = [[Historicals alloc] initWithHistoricals:aHistorical date:aDate visited:aVisited];
				
				// Add the animal object to the animals Array
				[historicals addObject:historical];
				[historical release];
			}
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
	}
	sqlite3_close(database);
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {
	[randomFacts release];
    [window release];
	[scrollView release];
	[pageControl release];
	[viewControllers release];
    [super dealloc];
}

@end

