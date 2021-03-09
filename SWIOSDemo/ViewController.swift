//
//  ViewController.swift
//  SWIOSDemo
//
//  Created by Dinesh on 04/03/21.
//

import UIKit
import Swirepay_IOS

class ViewController: UIViewController, SwirePaymentListener,SWSubscriptionListener {
    
    
    
    
    
    

    // MARK: - UIInterface reference


    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var responseResultView:UITextView!

    
    var testData = [String]()

    // MARK: - View life cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - assign payment response listener

        SwirepaySDK.shared.paymentListenerDelegate = self
        
        SwirepaySDK.shared.subscriptionListenerDelegate = self
        
        SwirepaySDK.shared.paymentMethodListenerDelegate = self
        
        SwirepaySDK.shared.accountListenerDelegate = self
                

        self.loadData()
                    
    }

    // MARK: - Dispose of any resources that can be recreated.

    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    
    
    // MARK: - Functions : Price validation
    
    func isPriceValid(textField:UITextField) -> Bool {
        
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        
        return true
    }

    
    // MARK: - Functions : Paybutton action

    
    func proceedPay(amount:String) {
                
        let paymentList = ["CARD"]
        
        let paymentRequestParam = [
            "amount":String(amount),
            "currencyCode":"INR",
            "paymentMethodType":paymentList,
            "redirectUri":"https://ios.sdk.redirect"
            ] as [String : Any]
        
        self.initPayment(param:paymentRequestParam)
    }
    
    @IBAction func segmentBtnTabbed(sender:UISegmentedControl){
        
        switch sender.tag {
        case 1:
            self.showSubscriptionView()
        default:
            break
        }
       
    }
    

    private func loadData(){
        
        self.testData.append("Pay")
        self.testData.append("Subscription")
        self.testData.append("Payment method")
        self.testData.append("Merchant onboard")
    }
    
    private func showPaymentLink(){
        
        let ac = UIAlertController(title: "Enter Amount", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let textField = ac.textFields![0]
        textField.keyboardType = .numberPad

        let submitAction = UIAlertAction(title: "Pay", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
                    
            ac.dismiss(animated: true, completion:{
                if self.isPriceValid(textField: answer) {
                    let amountVal = Int(answer.text!)! * 100
                    self.proceedPay(amount: String(amountVal))
                }
            })

            // do something interesting with "answer" here
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
        
        
//        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
//                view.isHidden = hidden
//            })
        
    }
   
    private func showPaymentMethod(){
        
        SwirepaySDK.shared.createPaymentMethod(parentContext:self)
        
    }
    private func showMerchantOnBoard(){
        
        SwirepaySDK.shared.createAccount(parentContext:self)
    }
    // MARK: - Functions : Starting payment process
    
    private func showSubscriptionView(){
         
        let swplan = SWPlan(currencyCode:CurrencyType.INR, name: "Test Plan IOS", amount: 40000, description: "Test Plan IOS", note: "Test", billingPeriod:1, billingFrequency:BillingFrequency.MONTH)
        
        SwirepaySDK.shared.subscription(context: self,plan:swplan)
    }

    private func initPayment(param:[String:Any]){
       /* self.priceTextField.text = ""
        self.payBtn.setTitle("PAY", for: .normal) */

        SwirepaySDK.shared.initSDK(publishKey:"sk_test_xkNDG8VLfNYEqOMVvrMho98K60NGkuyQ")
        SwirepaySDK.shared.doPayment(parentView: self, requestParam:param)
    }
    
    // MARK: - Functions : Alert
    
    private func showAlert(message:String){
        let alert = UIAlertController(title: "Payment Response", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - SwirePaymentListener

    func didFinishPayment(responseData: [String:Any]) {
        print("didFinishPayment",responseData)
        self.responseResultView.text = String(format:"%@", responseData)
        
    }
    
    func onPaymentFailed(responseData: [String : Any], errorMessage: String) {
        print("payment failed",errorMessage)
        print("payment response",responseData)
        self.showAlert(message: errorMessage)
    }
    
    func onPaymentConfigurationFailed(errorMessage: String) {
        self.showAlert(message: errorMessage)
    }
    
    
    func didFinishSubscription(responseData: [String:Any]) {
        
        self.responseResultView.text = String(format:"%@", responseData)
    }
    
    func didFailedSubscription(error: String) {
        print("didFailedSubscription",error)

    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.testData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.showPaymentLink()
            break
        case 1:
            self.showSubscriptionView()
            break
        case 2:
            self.showPaymentMethod()
            break
        case 3:
            self.showMerchantOnBoard()
            break
        default:
            break
        }
    }
    
    
}

extension ViewController : SWPaymentMethodListener,SWAccountListener {
    
    func didFinishConnectAccount(responseData:[String:Any]) {
        
        print("didFinishPaymentMethod",responseData)
        
        self.responseResultView.text = responseData.description
    }
    func didFailedConnectAccount(error:String) {
        
    }
    
    func didFinishPaymentMethod(responseData: [String : Any]) {
        
        print("didFinishPaymentMethod",responseData)
        
        self.responseResultView.text = responseData.description
    }
    
    func didFailedPaymentMethod(error: String) {
        print("didFailedPaymentMethod",error)

    }
    
    func didCanceled() {
        print("didCanceled")
        
        self.dismiss(animated: true, completion: nil)
    }
    
}



