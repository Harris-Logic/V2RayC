//
//  ProxyItemCell.swift
//  V2RayC
//
//  Created by cedricwu on 2018/09/01.
//  Copyright © 2018年 cedric. All rights reserved.
//

import Cocoa

class ProxyItemCell: NSCollectionViewItem {
    let myContentView = ProxyItemView()
    weak var viewModel: ProxyModel?
    
    // MARK: - Public Methods
    func fillWith(model: ProxyModel) {
        viewModel = model
        myContentView.fillWith(model: model)
        selected(flag: model.isSelected)
    }
    
    func selected(flag: Bool) {
        if flag {
            myContentView.layer?.backgroundColor = NSColor(hex: 0x455DE1, alpha: 0.7)?.cgColor
            myContentView.frame = NSRect(x: 6, y: 6, width: view.bounds.width - 12, height: view.bounds.height - 12)
        } else {
            myContentView.layer?.backgroundColor = NSColor.white.cgColor
            myContentView.frame = NSRect(x: 12, y: 12, width: view.bounds.width - 24, height: view.bounds.height - 24)
        }
        myContentView.selected(flag: flag)
    }
    
    // MARK: - Life Cycle
    override func viewWillLayout() {
        myContentView.frame = NSRect(x: 12, y: 12, width: view.bounds.width - 24, height: view.bounds.height - 24)
    }
    
    override func loadView() {
        view = NSView()
        view.wantsLayer = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        myContentView.frame = view.bounds
        let shadow = NSShadow()
        shadow.shadowColor = NSColor(hex: 0x455DE1, alpha: 0.7)
        shadow.shadowOffset = CGSize(width: 3, height: -4)
        shadow.shadowBlurRadius = 4
        myContentView.shadow = shadow
        myContentView.layer?.backgroundColor = NSColor.white.cgColor
        myContentView.layer?.borderColor = NSColor.white.cgColor
        myContentView.layer?.borderWidth = 1
        myContentView.layer?.cornerRadius = 6

        view.addSubview(myContentView)
    }
    
}
