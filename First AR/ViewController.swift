//
//  ViewController.swift
//  First AR
//
//  Created by Burak Akin on 11.09.2018.
//  Copyright © 2018 Burak Akin. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
//    var x :Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configuration.planeDetection = [.horizontal,.vertical]
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        configuration.planeDetection = .horizontal
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
        self.view.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
//        x = x + 0.1
        let node = SCNNode()
    node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.2)
//      node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.02, height: 0.3)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        let x = randomNumbers(firstNum: -0.2, secondNum: 0.2)
        let y = randomNumbers(firstNum: -0.2, secondNum: 0.2)
        let z = randomNumbers(firstNum: -0.2, secondNum: 0.2)
        node.position = SCNVector3(x,y,z)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
 
    
    @IBAction func resetButton(_ sender: Any) {
        restartSession()
    }

    func restartSession(){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
       
        self.sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
        
        
    }
    
    
    

}


