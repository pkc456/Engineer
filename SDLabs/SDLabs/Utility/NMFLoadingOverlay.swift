//
//  NMFLoadingOverlay
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//


import UIKit
import Foundation

///This class represents as a loading screen, which can be used while getting API responses on any other time consuming operations
public class NMFLoadingOverlay {
    
    // MARK: - Variables
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    let messageLabel = UILabel()
    
    class var shared: NMFLoadingOverlay {
        struct Static {
            static let instance: NMFLoadingOverlay = NMFLoadingOverlay()
        }
        return Static.instance
    }
    
    ///This method shows the overlay view
    /// - parameter view: input view on which loader will be shown
    /// - parameter Message: string message which is shown on loader
    public func showOverlay(view: UIView!, with Message: String) {
        if view != nil {
            overlayView = UIView(frame: view.bounds)
            overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityIndicator.center = overlayView.center
            overlayView.addSubview(activityIndicator)
            
            messageLabel.frame = CGRect(x: 0, y: activityIndicator.frame.origin.y - 50, width: self.overlayView.frame.size.width, height: 40)
            messageLabel.backgroundColor = UIColor.clear
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont.systemFont(ofSize: 14.0)
            messageLabel.textColor = UIColor.white
            messageLabel.isHidden = true
            
            if Message.count > 0 {
                messageLabel.text = Message
                messageLabel.isHidden = false
            }
            
            overlayView.addSubview(messageLabel)
            activityIndicator.startAnimating()
            view.addSubview(overlayView)
        }
    }
    
    ///This method hides the overlay view
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        messageLabel.removeFromSuperview()
        overlayView.removeFromSuperview()
    }
    
   
}
