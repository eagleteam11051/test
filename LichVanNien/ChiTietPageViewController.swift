//
//  PageViewController.swift
//  LichVanNien
//
//  Created by TBM on 6/21/18.
//  Copyright © 2018 TBM. All rights reserved.
//

import UIKit

class ChiTietPageViewController: UIPageViewController ,
    UIPageViewControllerDelegate,
UIPageViewControllerDataSource{

    
    var currentIndex = 0
    lazy var subViewController:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "view1") as! view1,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "view2") as! view2
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewController[0]], direction: .forward, animated: true, completion: nil)
        addChucNang()
        // Do any additional setup after loading the view.
    }
    
    func addChucNang(){
        let controller = storyboard!.instantiateViewController(withIdentifier: "chucNang")
        self.addChildViewController(controller)
        controller.view.frame = self.view.frame// or better, turn off `translatesAutoresizingMaskIntoConstraints` and then define constraints for this subview
        self.view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        currentIndex = subViewController.index(of: viewController) ?? 0
        if(currentIndex <= 0){
            return subViewController[subViewController.count-1]
        }
        return subViewController[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        currentIndex = subViewController.index(of: viewController) ?? 0
        if(currentIndex >= subViewController.count-1){
            return subViewController[0]
        }
        return subViewController[currentIndex+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("conpleted")
        addChucNang()
        
    }
    

}
