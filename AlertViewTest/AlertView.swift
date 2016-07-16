//
//  AlertView.swift
//  AlertViewTest
//
//  Created by Yans on 16/5/22.
//  Copyright © 2016年 Yans. All rights reserved.
//

import Foundation
import UIKit

enum ShowWay{
    case Up, Down, Left, Right
    case Fade
}

private class ScreenSize {
    var screenWidth = UIScreen.mainScreen().bounds.width
    var screenHeight = UIScreen.mainScreen().bounds.height
}
private class AlterViewSize {
    var width: CGFloat = 300
    var height: CGFloat = 350
    
}

class AlterView: UIView {
    
    var bgControl: UIControl = UIControl(frame: CGRectMake(0,0,ScreenSize().screenWidth,ScreenSize().screenHeight))
    var bgControlColor: UIColor =  UIColor ( red: 0.3144, green: 0.3144, blue: 0.3144, alpha: 0.5 )
    var alterView: UIView = UIView(frame: CGRectMake((ScreenSize().screenWidth - AlterViewSize().width)/2,(ScreenSize().screenHeight - AlterViewSize().height)/2,AlterViewSize().width,AlterViewSize().height))
    var bgColor: UIColor = UIColor.whiteColor()
    var cornerRadius: CGFloat = 10.0
    var showWay: ShowWay = .Down
    var alterViewHidden: Bool = true
    var horizontalLine: UIView = UIView(frame: CGRectMake(0,AlterViewSize().height * 0.8,AlterViewSize().width,0.5))
    var verticalLine: UIView = UIView(frame: CGRectMake(AlterViewSize().width * 0.5,AlterViewSize().height * 0.8,0.5, AlterViewSize().height * 0.2))
    var lineColor: UIColor = UIColor ( red: 0.7173, green: 0.7173, blue: 0.7173, alpha: 1.0 )
    var rainbowView: Rainbow = Rainbow(frame: CGRectMake(0,0,AlterViewSize().width,AlterViewSize().height * 0.8))
    var rainbowBgc: UIColor =  UIColor ( red: 0.1347, green: 0.1638, blue: 0.2664, alpha: 1.0 )
    
    init(){
        super.init(frame: CGRect.zero)
    }
    init(alterShow:ShowWay){
        super.init(frame: CGRect.zero)
        self.showWay = alterShow
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(inView:UIView){
        switch self.showWay {
        case .Down:
            self.showAnimation(.Down)
        case .Up:
            self.showAnimation(.Up)
        case .Left:
            self.showAnimation(.Left)
        case .Right:
            self.showAnimation(.Right)
        case .Fade:
            self.showAnimation(.Fade)
        }
        print(showWay)
        alterView.hidden = !alterViewHidden
        alterView.layer.cornerRadius = cornerRadius
        rainbowView.layer.cornerRadius = cornerRadius
        rainbowView.layer.masksToBounds = true
        self.setBackgroundColor()
        self.addView()
        inView.addSubview(bgControl)
        bgControl.addTarget(self, action: #selector(dismiss), forControlEvents: .TouchUpInside)

    }
    
    func dismiss(){
        switch self.showWay {
        case .Down:
            self.dismissAnimation(.Down)
        case .Up:
            self.dismissAnimation(.Up)
        case .Left:
            self.dismissAnimation(.Left)
        case .Right:
            self.dismissAnimation(.Right)
        case .Fade:
            self.dismissAnimation(.Fade)
        }
        print(showWay)
    }
    
    private func setBackgroundColor(){
        alterView.backgroundColor = bgColor
        bgControl.backgroundColor = bgControlColor
        horizontalLine.backgroundColor = lineColor
        verticalLine.backgroundColor = lineColor
        rainbowView.backgroundColor = rainbowBgc
    }
    private func addView() {
        self.addSubview(bgControl)
        bgControl.addSubview(alterView)
        alterView.addSubview(horizontalLine)
        alterView.addSubview(verticalLine)
        alterView.addSubview(rainbowView)
    }
    private func showAnimation(showWay:ShowWay){
        switch showWay {
        case .Down:
            alterView.transform = CGAffineTransformMakeTranslation(0.0, 500)
            break
        case .Up:
            alterView.transform = CGAffineTransformMakeTranslation(0.0, -500)
            break
        case .Left:
            alterView.transform = CGAffineTransformMakeTranslation(-500.0, 0)
            break
        case .Right:
            alterView.transform = CGAffineTransformMakeTranslation(500.0, 0)
            break
        case .Fade:
            alterView.transform = CGAffineTransformMakeTranslation(0,0)
            break
        }
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.alterView.transform = CGAffineTransformIdentity
            self.bgControl.alpha = 1
            }, completion: nil)
    }
    private func dismissAnimation(showWay:ShowWay){
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            switch showWay {
            case .Down:
                self.alterView.transform = CGAffineTransformMakeTranslation(0.0, -500)
            case .Up:
                self.alterView.transform = CGAffineTransformMakeTranslation(0.0, 500)
            case .Left:
                self.alterView.transform = CGAffineTransformMakeTranslation(500.0, 0)
            case .Right:
                self.alterView.transform = CGAffineTransformMakeTranslation(-500.0, 0)
            case .Fade:
                self.alterView.transform = CGAffineTransformIdentity
            }
            self.bgControl.alpha = 0
        }) { (_) in
            self.bgControl.removeFromSuperview()
            self.alterView.removeFromSuperview()
        }
    }
}