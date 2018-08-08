//
//  ViewController.swift
//  touchy
//
//  Created by satoshi on 8/8/18.
//  Copyright © 2018 Satoshi Nakajima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func clear(_ sender:UIBarButtonItem) {
    for subview in view.subviews {
      subview.removeFromSuperview()
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touchBegan")
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let loc = touch.location(in: view)
    print("touchMoved", loc.x, loc.y)
    let rc = CGRect(origin: loc, size: .zero).insetBy(dx: -10, dy: -10)
    let subview = UIView(frame: rc)
    subview.backgroundColor = UIColor.red
    view.addSubview(subview)
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touchCancelled")
  }
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touchEnded")
  }
  
}

