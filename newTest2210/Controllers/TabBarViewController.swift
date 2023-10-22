//
//  TabBarViewController.swift
//  newTest2210
//
//  Created by Александр Молчан on 21.10.23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    private let bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.3, 0.9, 1.0]
        bounceAnimation.duration = 0.3
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }()
    
    private let impactGenerator = UIImpactFeedbackGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        tabBarSettings()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item),
              tabBar.subviews.count > index + 1,
              let imageView = tabBar.subviews[index + 1].subviews.compactMap({ $0 as? UIImageView }).first else { return }
        imageView.layer.add(bounceAnimation, forKey: nil)
        hapticFeedBack()
    }
    
    private func setViewControllers() {
        let topVc = UINavigationController(rootViewController: TopViewController())
        let tradeVc = UINavigationController(rootViewController: TradeViewController())
        tradeVc.tabBarItem = UITabBarItem(title: "Trade", image: UIImage(named: "tradeIcon"), tag: 0)
        topVc.tabBarItem = UITabBarItem(title: "Top", image: UIImage(named: "userIcon"), tag: 1)
        viewControllers = [tradeVc, topVc]
    }
    
    private func hapticFeedBack() {
        impactGenerator.impactOccurred()
    }
    
    private func tabBarSettings() {
        tabBar.tintColor = UIColor(red: 0.373, green: 0.714, blue: 0.471, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.475, green: 0.490, blue: 0.553, alpha: 1)
        tabBar.backgroundColor = UIColor(red: 0.125, green: 0.133, blue: 0.180, alpha: 0.8)
        tabBar.alpha = 0.9
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
    }

}
