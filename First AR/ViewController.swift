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
    var x :Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configuration.planeDetection = [.horizontal,.vertical]
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addFunc(_ sender: UIButton) {
        x = x + 0.1
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        node.position = SCNVector3(x,0,0)
        self.sceneView.scene.rootNode.addChildNode(node)
        
    }
    
//    func restartSession(){
//        self.sceneView.session.pause()
//        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
//            node.removeFromParentNode()
//        }
//        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
//        self.sceneView.session.run(configuration)
//    }

}


