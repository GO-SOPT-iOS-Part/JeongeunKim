//
//  Photo.swift
//  SOPT_32
//
//  Created by JEONGEUN KIM on 2023/04/22.
//

import UIKit

struct Photo: Hashable {
    let image: UIImage
    var heartTapped: Bool
}

extension Photo {
    static func dummy() -> [Photo] {
        var photos: [Photo] = [Photo(image: .photo_1, heartTapped: false),
                               Photo(image: .photo_2, heartTapped: false),
                               Photo(image: .photo_3, heartTapped: false),
                               Photo(image: .photo_4, heartTapped: false),
                               Photo(image: .photo_5, heartTapped: false),
                               Photo(image: .photo_6, heartTapped: false),
                               Photo(image: .photo_7, heartTapped: false),
                               Photo(image: .photo_8, heartTapped: false),
                               Photo(image: .photo_9, heartTapped: false),
                               Photo(image: .photo_10, heartTapped: false),
                               Photo(image: .photo_11, heartTapped: false),
                               Photo(image: .photo_12, heartTapped: false)
        
        ]
        return photos
    }
}
