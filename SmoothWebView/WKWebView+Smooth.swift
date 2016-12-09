//
//  WKWebView+Smooth.swift
//  PlayGround
//
//  Created by kai inui on 2016/12/09.
//  Copyright © 2016年 PicApp Inc. All rights reserved.
//

import UIKit
import WebKit

public extension WKWebView {
    // on instantiate
    
    public func ki_applySmooth() {
        self.ki_enableNativeLikeScroll()
    }
    
    func ki_enableNativeLikeScroll() {
        self.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal
    }
    
    // onLoad
    
    public func ki_applySmoothForCurrentPage() {
        self.ki_removeTapHighLightForCurrentPage()
        self.ki_removeSelectCapabilityForCurrentPage()
        self.ki_removeLongTouchBehaviorForCurrentPage()
        self.ki_removeTapLatencyForCurrentPage()
    }
    
    func ki_removeTapHighLightForCurrentPage() {
        self.evaluateJavaScript("NodeList.prototype.forEach=Array.prototype.forEach;document.querySelectorAll('a').forEach(function(el){el.style['-webkit-tap-highlight-color']='rgba(0,0,0,0)'});", completionHandler: nil)
    }
    
    func ki_removeSelectCapabilityForCurrentPage() {
        self.evaluateJavaScript("document.documentElement.style.webkitUserSelect='none';", completionHandler: nil)
    }
    
    func ki_removeLongTouchBehaviorForCurrentPage() {
        self.evaluateJavaScript("document.body.style.webkitTouchCallout='none';", completionHandler: nil)
    }
    
    func ki_removeTapLatencyForCurrentPage() {
        /*
         ---------------------------------------------------------------------------------------------
         
         The SwiftClick library has been inspired by and uses much of the core logic from FastClick:
         
         https://github.com/ftlabs/fastclick
         Copyright (C) 2012 The Financial Times Ltd.
         
         ---------------------------------------------------------------------------------------------
         
         Copyright (C) 2013 Tullo Marshall Warren.
         
         Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
         
         The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
         
         THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
         */
        self.evaluateJavaScript("function SwiftClick(a){function b(){\"function\"==typeof k&&(j.addEventListener(\"click\",c,!1),j.onclick=null),j.addEventListener(\"touchstart\",d,!1),j.addEventListener(\"click\",f,!0)}function c(a){k(a)}function d(a){var b=a.target,c=b.nodeName.toLowerCase(),d=a.changedTouches[0];return m.x=d.pageX,m.y=d.pageY,n=h(),\"undefined\"==typeof i.options.elements[c]?!0:l?(o=!1,!0):(a.stopPropagation(),l=!0,b.removeEventListener(\"touchend\",e,!1),b.addEventListener(\"touchend\",e,!1),void 0)}function e(a){var b,c=a.target,d=!0;return c.removeEventListener(\"touchend\",e,!1),b=a.changedTouches[0],!o||Math.abs(b.pageX-m.x)>i.options.maxTouchDrift||Math.abs(b.pageY-m.y)>i.options.maxTouchDrift||Math.abs(h().x-n.x)>i.options.maxTouchDrift||Math.abs(h().y-n.y)>i.options.maxTouchDrift?(l&&(a.stopPropagation(),a.preventDefault(),d=!1),l=!1,o=!0,d):(a.stopPropagation(),a.preventDefault(),p=!1,c.focus(),g(c,b),l=!1,o=!0,!1)}function f(a){var b=a.target,c=b.nodeName.toLowerCase();if(\"undefined\"!=typeof i.options.elements[c]){if(p)return p=!1,a.stopPropagation(),a.preventDefault(),!1;p=!0}}function g(a,b){var c=document.createEvent(\"MouseEvents\");c.initMouseEvent(\"click\",!0,!0,window,1,b.screenX,b.screenY,b.clientX,b.clientY,!1,!1,!1,!1,0,null),a.dispatchEvent(c)}function h(){var a={x:window.pageXOffset||document.body.scrollLeft||document.documentElement.scrollLeft||0,y:window.pageYOffset||document.body.scrollTop||document.documentElement.scrollTop||0};return a}if(\"undefined\"!=typeof SwiftClick.swiftDictionary[a])return SwiftClick.swiftDictionary[a];SwiftClick.swiftDictionary[a]=this,this.options={elements:{a:\"a\",div:\"div\",span:\"span\",button:\"button\"},maxTouchDrift:30};var i=this,j=a,k=j.onclick,l=!1,m={x:0,y:0},n={x:0,y:0},o=!0,p=!1;\"onorientationchange\"in window&&\"ontouchstart\"in window&&b(),i.addNodeNamesToTrack=function(a){var b,c=0,d=a.length;for(c;d>c;c++){if(\"string\"!=typeof a[c])throw new TypeError(\"all values within the 'nodeNames' array must be of type 'string'\");b=a[c].toLowerCase(),i.options.elements[b]=b}},i.replaceNodeNamesToTrack=function(a){i.options.elements={},i.addNodeNamesToTrack(a)}}SwiftClick.swiftDictionary={},SwiftClick.attach=function(a){\"use strict\";return\"undefined\"!=typeof SwiftClick.swiftDictionary[a]?SwiftClick.swiftDictionary[a]:new SwiftClick(a)},\"undefined\"!=typeof define&&define.amd?define(function(){\"use strict\";return SwiftClick}):\"undefined\"!=typeof module&&module.exports?module.exports=SwiftClick:window.SwiftClick=SwiftClick;SwiftClick.attach(document.body);", completionHandler: nil)
    }
}
