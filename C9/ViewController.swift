//
//  ViewController.swift
//  C9
//
//  Created by guanho on 2016. 7. 24..
//  Copyright © 2016년 guanho. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource{
    var arrPageTitle: NSArray = NSArray()
    var arrPageUrl: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrPageTitle = ["경로,이미지 서버", "앱 서버"];
        arrPageUrl = ["https://ide.c9.io/guanho/clubfulstaticserver", "https://ide.c9.io/guanho/clubfulapiserver"];
        
        self.dataSource = self
        
        self.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    }
    
    // MARK:- UIPageViewControllerDataSource Methods
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        
        index -= 1;
        return getViewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        
        var index = pageContent.pageIndex
        
        if (index == NSNotFound)
        {
            return nil;
        }
        
        index += 1;
        if (index == arrPageTitle.count)
        {
            return nil;
        }
        return getViewControllerAtIndex(index)
    }
    
    // MARK:- Other Methods
    func getViewControllerAtIndex(index: NSInteger) -> PageContentViewController
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
        
        pageContentViewController.strTitle = "\(arrPageTitle[index])"
        pageContentViewController.webViewUrl = "\(arrPageUrl[index])"
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
}
