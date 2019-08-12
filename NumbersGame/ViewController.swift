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
    var count: Int = 0
    
    //ランダムに数を生成
    var lannum: Int = Int.random(in: 1...100)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }
    
    //決定ボタン
    @IBAction func okbutton(_ sender: Any) {
        checkAnswer()
    }
    
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
                standertAlert(message: "答えは\(answerNum)より高い値です。")
                rirekiText.text = rirekiText.text + "\n[\(count)回目]答えは\(answerNum)より高い値です。"
                
            } else if answerNum > lannum {
                count += 1
                standertAlert(message: "答えは\(answerNum)より低い値です。")
                rirekiText.text = rirekiText.text + "\n[\(count)回目]答えは\(answerNum)より低い値です。"
                
            } else if answerNum == lannum {
                count += 1
                standertAlert(message: "\(count)回目に正解しました！\n数字をリセットしました！")
                rirekiText.text = rirekiText.text + "[正解]答えは\(lannum)でした。\n"
                
                
                //リセット
                answerabel.text = "??"
                count = 0
                lannum = Int.random(in: 1...100)
                
            } else {
                errorAlert()
            }
        } else {
            errorAlert()
        }
    }
   
    func standertAlert(message: String) {
        // アラートの作成
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        // アラートのアクション（ボタン部分の定義）
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        // 作成した alert に閉じるボタンを追加
        alert.addAction(close)
        // アラートを表示する
        present(alert, animated: true, completion: nil)
    }
    
    
    
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
    
    
}

