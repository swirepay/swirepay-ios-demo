//
//  README.swift
//  SWIOSDemo
//
//  Created by Dinesh on 04/03/21.
//


# Swirepay_IOS_DEMO

[![CI Status](https://img.shields.io/travis/swirepay/Swirepay_IOS_SDK.svg?style=flat)](https://travis-ci.org/swirepay/Swirepay_IOS_SDK)
[![Version](https://img.shields.io/cocoapods/v/Swirepay_IOS_SDK.svg?style=flat)](https://cocoapods.org/pods/Swirepay_IOS_SDK)
[![License](https://img.shields.io/cocoapods/l/Swirepay_IOS_SDK.svg?style=flat)](https://cocoapods.org/pods/Swirepay_IOS_SDK)
[![Platform](https://img.shields.io/cocoapods/p/Swirepay_IOS_SDK.svg?style=flat)](https://cocoapods.org/pods/Swirepay_IOS_SDK)

## Swirepay IOS SDK

Swirepay iOS SDK helps developers implement a native payment experience in their iOS application. The SDK requires minimal setup to get started and helps developers process payments under 30 seconds while being PCI compliant.


##  Cocopods setup

Create a MySDK.podspec file in your project directory which will contain information about the CocoaPod you are publishing, such as its name, version, sources, and more.

Example:

Pod::Spec.new do |s|  
    s.name              = 'MySDK'
    s.version           = '1.0.0'
    s.summary           = 'A really cool SDK that logs stuff.'
    s.homepage          = 'http://example.com/'

    s.author            = { 'Name' => 'sdk@example.com' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :http => 'http://example.com/sdk/1.0.0/MySDK.zip' }

    s.ios.deployment_target = '8.0'
    s.ios.vendored_frameworks = 'MySDK.framework'
end 

Register a Trunk Account

To publish your .podspec file to the CocoaPods repository, you must first register an account with the CocoaPods Trunk
Register an account by running the following, entering your full name and e-mail address:

pod trunk register you@email.com 'Full Name'  

Then, check your e-mail for a confirmation link and click it.

Your Trunk account is now activated and you can finally publish your CocoaPod!

Publish the Pod ::

Run the following command in the same directory as the .podspec to publish it to the CocoaPods repository:

pod trunk push MySDK.podspec  

To Test:

Create a test project, run pod init, and add the following to the Podfile:

pod 'Swirepay_IOS','1.0.beta'


## Author

Swirepay, developer@swirepay.com

## License

Swirepay_IOS_SDK is available under the MIT license. See the LICENSE file for more info.

