# SmoothWebView
Enable native-like behavior for `WKWebView`

* Native-like scroll speed.
* No long touch menu.
* Remove capability to select elements.
* Remove highlights on tap.
* Remove touch latency.

# Usage

## 1. Call `ki_applySmooth` on instantiation.

```objc
webView.ki_applySmooth()
```

## 2. Call `ki_applySmoothForCurrentPage` on page load.

```objc
func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    webView.ki_applySmoothForCurrentPage()
}
```

# Installation

`github "kaiinui/SmoothWebView"`
