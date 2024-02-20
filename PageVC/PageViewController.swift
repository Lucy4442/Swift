//
//  PageViewController.swift
//  PageVC
//
//  Created by mac on 20/02/24.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
  
    

    var images : [String] = ["round","tick","trash","write"]
    var currentIdx = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
         if let initialViewController = contentViewController(at: currentIdx){
            setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? ViewController,
                   let index = images.firstIndex(of: viewController.imgStr ?? ""),
                   index > 0 {
                    return contentViewController(at: index - 1)
                }
                return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? ViewController,
                   let index = images.firstIndex(of: viewController.imgStr ?? ""),
                   index < images.count - 1 {
                    return contentViewController(at: index + 1)
                }
                return nil
    }
    
    private func contentViewController(at index: Int) -> ViewController? {
            guard index >= 0, index < images.count else { return nil }

            let contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
            contentViewController?.imgStr = images[index]
            return contentViewController
        }


}
