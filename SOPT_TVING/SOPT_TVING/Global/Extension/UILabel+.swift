//
//  UILabel+.swift
//  SOPT_TVING
//
//  Created by JEONGEUN KIM on 2023/04/29.
//

import UIKit

extension NSMutableAttributedString {
   func addImageInBetweenString(firstSentence: String, image: UIImage?, lastSentence: String) -> NSMutableAttributedString {
    // create an NSMutableAttributedString that we'll append everything to
    let fullString = NSMutableAttributedString(string: firstSentence)

    // create our NSTextAttachment
    let image1Attachment = NSTextAttachment()
    image1Attachment.image = image
    //image1Attachment.setImageHeight(height: 15.0)
    image1Attachment.bounds = CGRect(x: 0, y: -2, width: 70, height: 15)

    // wrap the attachment in its own attributed string so we can append it
    let image1String = NSAttributedString(attachment: image1Attachment)

   // add the NSTextAttachment wrapper to our full string, then add some more text.
   fullString.append(image1String)
   fullString.append(NSAttributedString(string: lastSentence))

   return fullString
  }
}

extension NSTextAttachment {
  func setImageHeight(height: CGFloat) {
     guard let image = image else { return }
     let ratio = image.size.width / image.size.height
     bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
 }
}
extension NSAttributedString {
    func withLineSpacing(_ spacing: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attributedString)
    }
}
