//
//  QuizViewController.swift
//  quizDemo
//
//  Created by 陳家豪 on 2020/7/29.
//

import UIKit

class QuizViewController: UIViewController {
    //顯示問題的內容
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var option1: UITextView!
    @IBOutlet weak var option2: UITextView!
    @IBOutlet weak var option3: UITextView!
    @IBOutlet weak var option4: UITextView!
    //全部問題的Quiz陣列
    var allQuizzes = [Quiz]()
    //儲存亂數抽取題庫後的測驗題目
    var quizzes = [Quiz]()
    //使用者回答題目次數
    var answerTimes = 0
    //儲存每次使用者選擇的選項，也是要傳到下個畫面做統計的資料
    var selectedOptions = [Option]()
    //目前顯示在畫面上的問題(在quizzes的索引值)
    var currentQuiz = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //手動生成每個題目，然後一一加到allQuizzes陣列
        loadQuizzes()
        //亂數抽取7題當測驗題目
        quizzes = getRandomQuizzes(from: allQuizzes)
        //依據currentQuiz的值取出quizzes的問題，然後將內容設定給要顯示的textView
        setQuiz()
    }

    
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        controller?.selectedOptions = selectedOptions
        answerTimes = 0
        selectedOptions.removeAll()
        currentQuiz = 0
        quizzes = getRandomQuizzes(from: allQuizzes)
        setQuiz()
        return controller
    }
 
    func setQuiz(){
        question.text = quizzes[currentQuiz].question
        option1.text = quizzes[currentQuiz].options[0].content
        option2.text = quizzes[currentQuiz].options[1].content
        option3.text = quizzes[currentQuiz].options[2].content
        option4.text = quizzes[currentQuiz].options[3].content
    }
    func loadQuizzes(){
        
        let quiz1 = Quiz(quizNumber: 1,question: "你最討厭人們稱你：", options: [
            Option(content: "平凡", belongTo: .Slytherin),
            Option(content: "無知", belongTo: .Ravenclaw),
            Option(content: "膽小", belongTo: .Gryffindor),
            Option(content: "自私", belongTo: .Hufflepuff)
        ])
        let quiz2 = Quiz(quizNumber: 2,question: "你想在死後讓後人認為你是個？", options: [
            Option(content: "智者", belongTo: .Ravenclaw),
            Option(content: "好人", belongTo: .Hufflepuff),
            Option(content: "偉人", belongTo: .Slytherin),
            Option(content: "勇者", belongTo: .Gryffindor)
        ])
        let quiz3 = Quiz(quizNumber: 3,question: "如果可以，你希望發明能讓你獲得以下哪一點的魔藥？", options: [
            Option(content: "愛", belongTo: .Hufflepuff),
            Option(content: "榮譽", belongTo: .Gryffindor),
            Option(content: "智慧", belongTo: .Ravenclaw),
            Option(content: "權力", belongTo: .Slytherin)
        ])
        let quiz4 = Quiz(quizNumber: 4,question: "振翅灌木每個世纪盛開一次，用花朵變幻的氣味引誘粗心者。如果它要引誘你，你聞到的的味道會是？", options: [
            Option(content: "燃燒得滋滋作響的木頭", belongTo: .Gryffindor),
            Option(content: "大海", belongTo: .Ravenclaw),
            Option(content: "嶄新的羊皮紙", belongTo: .Slytherin),
            Option(content: "家", belongTo: .Hufflepuff)
        ])
        let quiz5 = Quiz(quizNumber: 5,question: "你面前有四個高腳杯。你會選擇喝？", options: [
            Option(content: "如鑽石般閃耀著的銀色液體", belongTo: .Gryffindor),
            Option(content: "聞著像巧克力和李子口味的紫色飲料", belongTo: .Hufflepuff),
            Option(content: "耀眼的金色液體", belongTo: .Slytherin),
            Option(content: "像墨水般閃爍的神秘黑色液體", belongTo: .Ravenclaw)
        ])
        let quiz6 = Quiz(quizNumber: 6,question: "聽到哪一種樂器的聲音最能令你感到愉快？", options: [
            Option(content: "小提琴", belongTo: .Ravenclaw),
            Option(content: "小號", belongTo: .Slytherin),
            Option(content: "鋼琴", belongTo: .Hufflepuff),
            Option(content: "鼓", belongTo: .Gryffindor)
        ])
        let quiz7 = Quiz(quizNumber: 7,question: "你進入了一個魔法花園。最令你好奇，讓你忍不住立即前去仔细觀察的是？", options: [
            Option(content: "一棵長著銀葉子金蘋果的樹", belongTo: .Gryffindor),
            Option(content: "一堆在交談的红色毒蕈", belongTo: .Hufflepuff),
            Option(content: "冒著泡泡的池塘，裡面有旋轉的發光物", belongTo: .Ravenclaw),
            Option(content: "一名年紀很大的巫師的塑像", belongTo: .Slytherin)
        ])
        let quiz8 = Quiz(quizNumber: 8,question: "你認為以下哪種情況最難應對？", options: [
            Option(content: "飢餓", belongTo: .Hufflepuff),
            Option(content: "寒冷", belongTo: .Ravenclaw),
            Option(content: "無聊", belongTo: .Gryffindor),
            Option(content: "被忽略", belongTo: .Slytherin)
        ])
        let quiz9 = Quiz(quizNumber: 9,question: "你最希望別人？", options: [
            Option(content: "嫉妒你", belongTo: .Ravenclaw),
            Option(content: "信任你", belongTo: .Gryffindor),
            Option(content: "喜愛你", belongTo:  .Hufflepuff),
            Option(content: "畏懼你", belongTo: .Slytherin)
        ])
        let quiz10 = Quiz(quizNumber: 10,question: "如果你可以擁有任何能力，你想選以下哪種？", options: [
            Option(content: "與動物交流的能力", belongTo: .Hufflepuff),
            Option(content: "隱形術", belongTo: .Gryffindor),
            Option(content: "讀心術", belongTo:  .Ravenclaw),
            Option(content: "超越常人的力量", belongTo: .Slytherin)
        ])
        let quiz11 = Quiz(quizNumber: 11,question: "你最期待在霍格華滋學什麼？", options: [
            Option(content: "我能學的所有魔法領域", belongTo: .Ravenclaw),
            Option(content: "神奇動物和如何與它们交朋友或照顧牠們", belongTo: .Gryffindor),
            Option(content: "霍格華滋城堡的秘密", belongTo:  .Slytherin),
            Option(content: "騎飛天掃帚飛行", belongTo: .Hufflepuff)
        ])
        let quiz12 = Quiz(quizNumber: 12,question: "你和兩個朋友要通過一座河流巨怪看守著的橋，河怪堅持你們中必須有一人需要戰勝它，才能讓你們三人通行，你會怎麼做？", options: [
            Option(content: "嘗試把河流巨怪搞糊塗，讓它允许你和朋友们不用跟它打，直接通過", belongTo: .Hufflepuff),
            Option(content: "建議大家抽籤決定誰来上", belongTo: .Ravenclaw),
            Option(content: "(瞞著巨怪）提議你们三人一同戰鬥", belongTo:  .Slytherin),
            Option(content: "自告奮勇", belongTo: .Gryffindor)
        ])
        let quiz13 = Quiz(quizNumber: 13,question: "你最想研究以下哪種生物？", options: [
            Option(content: "妖精", belongTo: .Ravenclaw),
            Option(content: "吸血鬼", belongTo: .Slytherin),
            Option(content: "狼人", belongTo:  .Gryffindor),
            Option(content: "馬人", belongTo: .Hufflepuff)
        ])
        let quiz14 = Quiz(quizNumber: 14,question: "一個麻瓜向你對峙，說他確定你是個巫師，你會怎麼做？", options: [
            Option(content: "問他為什麼有這種想法", belongTo: .Ravenclaw),
            Option(content: "承認，然後走開，讓他自己琢磨你是不是在吹牛", belongTo:  .Gryffindor),
            Option(content: "承認，並問他要不要免費體驗一下惡咒", belongTo: .Slytherin),
            Option(content: "告訴他你懷疑他精神方面有問題，並提出幫忙给醫生打電話", belongTo: .Hufflepuff)
        ])
        let quiz15 = Quiz(quizNumber: 15,question: "哪條路對你最有吸引力？", options: [
            Option(content: "陽光明媚的寬闊草地", belongTo: .Hufflepuff),
            Option(content: "黑暗狭窄，點著燈籠的小巷", belongTo:  .Slytherin),
            Option(content: "森林中灑滿落葉的曲折小徑", belongTo: .Gryffindor),
            Option(content: "兩邊都是古老建築的鵝卵石街道", belongTo: .Ravenclaw)
        ])
        allQuizzes.append(quiz1)
        allQuizzes.append(quiz2)
        allQuizzes.append(quiz3)
        allQuizzes.append(quiz4)
        allQuizzes.append(quiz5)
        allQuizzes.append(quiz6)
        allQuizzes.append(quiz7)
        allQuizzes.append(quiz8)
        allQuizzes.append(quiz9)
        allQuizzes.append(quiz10)
        allQuizzes.append(quiz11)
        allQuizzes.append(quiz12)
        allQuizzes.append(quiz13)
        allQuizzes.append(quiz14)
        allQuizzes.append(quiz15)
        }
    func getRandomQuizzes(from allQuizzes:[Quiz]) -> [Quiz]{
        //儲存要回傳的亂數題庫
        var randomQuizzes = [Quiz]()
        //用來判斷亂數抽取的題庫有沒有重複
        var isRepeated = false
        //如果不到7題就會一直執行迴圈
        while randomQuizzes.count < 7{
            if let randomQuiz = allQuizzes.randomElement(){
                //如果陣列長度0，跑for each會變成無窮迴圈，所以要先加入一個問題
                if randomQuizzes.count == 0{
                    randomQuizzes.append(randomQuiz)
                }else{
                    //將目前亂數的題庫題目一一跟本次抽出的題目比對是不是同一題，如果是就改isRepeated的值
                    for quiz in randomQuizzes{
                        if randomQuiz == quiz{
                            isRepeated = true
                        }
                    }
                    //如果都沒重複就加到題庫
                    if !isRepeated{
                        randomQuizzes.append(randomQuiz)
                    }
                    //重置確認有無重複的Bool
                    isRepeated = false
                }
            }

        }
        return randomQuizzes
    }
    
    
   
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
