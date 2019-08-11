//
//  ViewController.swift
//  NumbersGame
//
//  Created by 津國　由莉子 on 2019/08/06.
//  Copyright © 2019 yurityann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //答えが表示されるラベル
    @IBOutlet weak var answerabel: UILabel!
    
    //答えを入力するテキストフィールド
    @IBOutlet weak var answerTextField: UITextField!
    
   
    //回答履歴が書かれるところ
    @IBOutlet weak var rirekiText: UITextView!
    
    //正解の数値を定義
    var oknum: Int = 0
    
    //回答回数のカウント
    var count: Int = 1
    
    //ランダムに数を生成
    var lannum: Int = Int.random(in: 1...100)
    
    
    
    //回答を確認する関数
    func checkAnswer() {
        if let answerNum = Int(answerTextField.text!) {
            if answerNum >= 1 && answerNum <= 100 {
            } else {
                errorAlert()
                answerTextField.text = ""
                return
                
            }
            answerabel.text = answerTextField.text
            
            answerTextField.text = ""
            
            if answerNum < lannum {
                count += 1
                
            }
                
            
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //テキストビューに入力できないようにする
        rirekiText.isUserInteractionEnabled = false
        
    }


    //決定ボタン
    @IBAction func okbutton(_ sender: Any) {
        
        func errorAlert() {
            // アラート作る
            let alerterror = UIAlertController(title: "エラー", message: "「1〜100」の数字を入れてください。", preferredStyle: .alert)
            // アラートのアクション（ボタン部分の定義）
            let ok = UIAlertAction(title: "oK", style: .cancel, handler: nil)
            // alerterrornに閉じるボタンつける
            alerterror.addAction(ok)
            // アラートの表示
            present(alerterror, animated: true, completion: nil)
            
        }
      //チェック呼び出し
    checkAnswer()
    }
    
    
    
    
    
}

