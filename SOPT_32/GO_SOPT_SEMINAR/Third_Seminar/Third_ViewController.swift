//
//  Third_ViewController.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/22.
//

import UIKit

import SnapKit
import Then
import Alamofire

class Third_ViewController: BaseViewController {
    
    // MARK: - UI Components

    private let originView = CommonView()
    
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = originView
    }
}
