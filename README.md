# Producerify
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/natestedman/Producerify.svg?branch=master)](https://travis-ci.org/natestedman/Producerify)
[![License](https://img.shields.io/badge/license-Creative%20Commons%20Zero%20v1.0%20Universal-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

Let's turn functions taking callbacks into `SignalProducer` values!

    let webView = WKWebView()
    let producer = SignalProducer(callback: webView.evaluateJavaScript, "\"hello!\"")
    // producer: SignalProducer<AnyObject?, NSError>

Currently, functions in these formats are supported:

- `(..., completion: (Value, Error?) -> ()) -> ()`
- `(..., success: Value -> (), failure: Error -> ()) -> ()`

With zero to five arguments preceeding the callback parameters.

## Installation
No releases yet, so:

    github "natestedman/Producerify" "master"

This will pull in `ReactiveCocoa` and `Result`, but if you're looking at this framework, you're probably already using those!