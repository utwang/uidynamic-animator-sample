//
//  ViewController.swift
//  TimerPrototype
//
//  Created by Uchida Atsushi on 2016/09/10.
//  Copyright © 2016年 Uchida Atsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))

    var animator: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    var collision: UICollisionBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        setSquare()
        setBarrier()
        setGravity()
        setCollision()

        collision?.action = {
            print("\(NSStringFromCGAffineTransform(self.square.transform))\(NSStringFromCGPoint(self.square.center))")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setSquare() {
        square.backgroundColor = UIColor.gray
        view.addSubview(square)
    }


    private func setBarrier() {
        barrier.backgroundColor = UIColor.red
        view.addSubview(barrier)
    }

    private func setGravity() {
        gravity = UIGravityBehavior(items: [square])
        guard let g = gravity else { return }
        animator?.addBehavior(g)
    }

    private func setCollision() {
//        collision = UICollisionBehavior(items: [square, barrier])
        collision = UICollisionBehavior(items: [square])
        collision?.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision?.translatesReferenceBoundsIntoBoundary = true
        guard let col = collision else { return }
        animator?.addBehavior(col)
    }
}

