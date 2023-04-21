//
//  LoginType.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/21.
//

import Foundation

enum LoginViewType {
    case Find, Make
}
enum LoginType {
    case ID, Password
    
    var title: String {
        switch self {
        case .ID:
            return I18N.Login.idTextField
        case .Password:
            return I18N.Login.passwordTextFiedl
        }
    }
}
