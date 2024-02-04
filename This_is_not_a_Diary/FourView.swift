//
//  FourView.swift
//  This_is_not_a_Diary
//
//  Created by cheshire on 1/29/24.
//

import UIKit
import CoreML

class FourView: UIViewController, GradientAnimatable {

    var userText: String?
    var resultLabel: UILabel!
    var isKorean: Bool = false


    // 중립적인 상태에 대한 조언
    let adviceForNeutral = [
        "Life is full of ups and downs; staying level-headed is key to moving forward.",
        "Maintain a balanced perspective, and you'll make decisions you're proud of.",
        "Staying neutral helps you see things from an objective point of view.",
        "Embrace the calm of neutrality; it's a good foundation for clear thinking.",
        "Sometimes, not feeling too strongly one way or another is okay.",
        "Neutrality can be a powerful stance when you need to understand both sides.",
        "Use this time of balance to organize your thoughts and plan ahead.",
        "A calm sea does not make a skilled sailor. Use this peace to prepare for future challenges.",
        "Balance in all things is the key to a contented life.",
        "Being neutral is a chance to rest and reflect before the next big wave of emotion."
    ]

    // 부정적인 상태에 대한 조언
    let adviceForNegative = [
        "It's okay to feel down. Acknowledge your feelings, but don't let them control you.",
        "Every dark cloud has a silver lining. Stay strong; brighter days are on the way.",
        "Negative feelings are just like storms; they will pass and the sun will shine again.",
        "Take this time to reflect on what matters and let go of what doesn't serve you.",
        "It's important to face your feelings, but also to seek the support you need.",
        "Use these challenges as stepping stones for growth and learning.",
        "Remember, it's okay to take a break and recharge when you're feeling low.",
        "Channel your negative energy into something creative or productive.",
        "Negative emotions are natural; allow yourself to feel them, then move forward.",
        "Look for small joys and pleasures; they can bring light to the darkest days."
    ]

    // 긍정적인 상태에 대한 조언
    let adviceForPositive = [
        "Your positive energy is contagious. Use it to uplift those around you.",
        "Celebrate your good mood. It's a gift that keeps on giving!",
        "Positive vibes can turn a good day into a great one. Spread the cheer!",
        "Happiness is found in the little moments. Cherish them.",
        "Your smile is a curve that can set a lot of things straight. Keep smiling!",
        "Positive thoughts lead to positive outcomes. Dream big and stay optimistic.",
        "Let your positivity shine bright and inspire others to find their joy.",
        "Remember to savor this moment of happiness; it's precious.",
        "Use this positive energy to fuel your passions and ambitions.",
        "Happiness is a journey, not a destination. Enjoy the ride!"
    ]

    // 놀람에 대한 조언
    let adviceForSurprise = [
        "뜻밖의 일이 당신을 놀라게 했을지라도, 그것이 새로운 기회의 시작일 수 있습니다. 호흡을 가다듬고, 순간을 포용하세요.",
        "놀라움은 때때로 우리 삶에 활력을 불어넣어요. 그 감정을 즐기고, 새로운 경험으로 바라보세요.",
        "세상은 예측할 수 없는 것들로 가득 차 있습니다. 놀람을 통해 유연성을 기르고 적응하는 법을 배우세요.",
        "때로 놀라운 순간들이 우리를 더 강하게 만들죠. 이를 기회로 삼아 더 큰 성장을 이루세요.",
        "갑작스러운 변화에 직면했을 때는 잠시 멈추고 주변을 둘러보세요. 때론 놀랍게도 해답이 바로 곁에 있을 수 있습니다.",
        "놀람은 자극이며, 변화의 촉매제가 될 수 있습니다. 이를 통해 새로운 가능성을 발견하세요.",
        "기대하지 않았던 일이 벌어졌다면, 그것을 새로운 관점을 얻는 기회로 삼으세요. 삶은 늘 우리를 놀라게 합니다.",
        "때때로 우리는 놀라움 속에서 가장 소중한 교훈을 얻습니다. 이 경험을 통해 배우고 성장하세요.",
        "모든 놀람이 긍정적인 것은 아니지만, 모든 경험은 귀중한 학습의 기회입니다. 긍정적인 면을 찾아보세요.",
        "놀라운 순간이 당신의 일상을 흔들어 놓았다면, 이는 삶이 당신에게 더 큰 무언가를 준비하고 있다는 신호일지도 모릅니다. 기대를 가지세요."
    ]


    // 행복에 대한 조언
    let adviceForHappiness = [
        "행복은 자신의 내면에서 비롯됩니다. 오늘 당신이 느끼는 행복을 소중히 여기세요.",
        "당신의 행복은 다른 이들에게도 영감을 줍니다. 당신의 기쁨을 주변 사람들과 나누며 그 기쁨을 키워보세요.",
        "어떤 순간에도 행복을 찾을 수 있는 능력은 당신 안에 있습니다. 그 행복을 찾아 나서세요.",
        "작은 일에 감사함을 느낄 때 우리의 행복은 더욱 커집니다. 오늘 당신이 감사할 수 있는 것들을 떠올려보세요.",
        "행복은 습관입니다. 긍정적인 생각을 통해 매일 그 습관을 기르세요.",
        "당신의 웃음은 세상을 더 밝게 만들어요. 오늘도 활짝 웃으며 당신의 행복을 주변에 전파하세요.",
        "사랑하는 사람들과 함께하는 시간은 당신의 행복을 더욱 빛나게 만듭니다. 오늘 그 시간을 만끽하세요.",
        "행복은 결국 선택의 문제입니다. 오늘 당신은 행복을 선택하세요.",
        "당신의 삶에서 작은 기쁨을 찾아내세요. 그것들이 모여 당신의 삶을 풍요롭게 만듭니다.",
        "당신이 하는 일에서 행복을 찾으세요. 열정을 가지고 일한다면, 매일이 즐거움으로 가득 찰 것입니다."
    ]

    // 중립에 대한 조언
    let adviceForNeutralKorean = [
        "오늘 같은 평온한 날에는 마음의 여유를 갖고, 자신을 돌아보는 시간을 가져보세요.",
        "아무런 감정에 치우치지 않을 때, 당신은 가장 명확하게 생각할 수 있습니다. 이 시간을 이용해 중요한 결정을 내려보세요.",
        "중립은 때때로 마음이 평화를 찾고 있다는 신호입니다. 그 평화를 즐겨보세요.",
        "균형 잡힌 마음은 혼돈의 세상 속에서 당신의 안정을 지켜줄 것입니다.",
        "중립적인 감정은 당신을 더 객관적으로 만들어줍니다. 이를 통해 주변을 더 명확히 볼 수 있어요.",
        "감정의 고요함 속에서 당신은 삶의 깊은 의미를 발견할 수 있습니다. 이 순간을 소중히 여기세요.",
        "중립적인 상태는 새로운 가능성을 열어주는 열쇠가 될 수 있습니다. 새로운 것을 시도해보세요.",
        "오늘 당신이 느끼는 평화로움이 내일을 위한 힘이 될 수 있습니다. 그 힘을 믿으세요.",
        "중립적인 감정은 당신에게 진정한 자유를 줍니다. 당신은 어떤 방향으로도 나아갈 수 있어요.",
        "때로는 아무런 기대나 부담 없이 하루를 시작하는 것이 최선입니다. 오늘을 그런 날로 만들어보세요."
    ]


    // 공포에 대한 조언
    let adviceForFear = [
        "두려움은 때로 우리의 내면 깊은 곳에서 오는 신호일 수 있어요. 그 신호를 이해하려고 노력해 보세요.",
        "두려워하는 것은 완전히 정상입니다. 그것을 인정하고, 자신의 감정을 안전하게 표현해 보세요.",
        "두려움을 느낄 때는 주변에 있는 사랑하는 사람들에게 기대보세요. 그들의 지지가 당신에게 힘이 될 거예요.",
        "두려움 속에서도 당신은 배울 수 있습니다. 이 경험을 통해 더 강해질 수 있어요.",
        "한 걸음 뒤로 물러서서 상황을 객관적으로 바라보세요. 때로는 거리를 두는 것이 두려움을 다루는 데 도움이 됩니다.",
        "깊은 호흡을 하고, 자신을 진정시켜 보세요. 당신은 두려움을 극복할 힘이 있습니다.",
        "두려움에 맞서는 것은 용기를 필요로 합니다. 자신 안에 있는 용기를 찾아보세요.",
        "각각의 두려움은 극복할 때마다 당신을 더 강하게 만듭니다. 이것을 성장의 기회로 삼으세요.",
        "당신이 두려움을 느낀다면, 그것은 당신이 중요한 일에 직면하고 있기 때문입니다. 그 일에 당신이 어떤 의미를 부여하는지 생각해보세요.",
        "두려움은 때로 우리를 보호하려는 마음의 방식입니다. 그러나 당신은 그것을 넘어서 새로운 경험을 할 수 있어요."
        ]


    // 혐오에 대한 조언
    let adviceForDisgust = [
        "혐오감을 느낀다면, 그것이 당신의 가치관과 경계를 보여주는 신호일 수 있습니다. 이 감정을 통해 자신에 대해 더 잘 이해해 보세요.",
        "혐오는 때로 우리에게 중요한 것이 무엇인지를 가르쳐 줍니다. 그것을 깊이 생각해보고, 자신의 가치관을 재정립해보세요.",
        "혐오감을 느낄 때는 그 원인을 탐색해 보세요. 이해하는 것이 이 감정을 다루는 첫걸음입니다.",
        "혐오감은 강력한 감정입니다. 그것을 건설적인 방향으로 이끌어보세요.",
        "당신이 혐오감을 느낀다면, 그것은 당신이 더 나은 환경이나 상황을 원한다는 것을 의미할 수 있습니다. 그 변화를 추구해보세요.",
        "혐오감은 때때로 우리의 깊은 불만을 표현합니다. 그 불만을 긍정적으로 해결할 방법을 찾아보세요.",
        "자신이 혐오하는 것에 대해 말하기보다는, 당신이 사랑하고 소중히 여기는 것에 집중해 보세요.",
        "혐오감을 느낀다면, 그것을 내면의 목소리로 여기고 깊이 반성해보세요. 그것이 무엇을 의미하는지 이해하는 것이 중요합니다.",
        "혐오하는 것에 대해 생각하는 대신, 당신의 에너지를 긍정적인 것에 집중해 보세요.",
        "혐오감을 느낄 때는 자신을 진정시키고, 긍정적인 생각으로 마음을 가다듬어 보세요. 당신은 그 이상의 가치가 있습니다."
    ]


    // 분노에 대한 조언
    let adviceForAnger = [
        "분노는 강력한 감정이지만, 깊은 호흡으로 조금씩 진정시켜 보세요. 평온함이 당신을 기다리고 있습니다.",
        "화가 날 때는 잠시 멈추고 상황을 객관적으로 바라보려고 노력해 보세요. 이것이 해결의 첫걸음이 될 수 있습니다.",
        "분노는 우리 내면의 무언가가 잘못되었다는 신호일 수 있어요. 그 원인을 찾아 해결해 보세요.",
        "화를 내는 것보다, 그 감정 뒤에 숨겨진 진짜 문제를 해결하는 것이 더 중요합니다.",
        "분노는 때로 필요한 에너지를 제공합니다. 그러나 그것을 긍정적인 변화를 위해 사용하세요.",
        "분노를 느낄 때는 그것을 창의적인 활동으로 전환해 보세요. 예술이나 운동은 좋은 출구가 될 수 있습니다.",
        "당신의 분노를 인정하되, 그것에 휩쓸리지 않으려고 노력하세요. 당신은 그 이상의 통제력을 가지고 있습니다.",
        "분노는 때때로 우리가 중요하게 생각하는 것들에 대한 열정에서 비롯됩니다. 이를 긍정적인 방향으로 이끌어보세요.",
        "분노는 우리의 한계를 시험하고, 때로는 우리를 더 강하게 만듭니다. 이 경험을 통해 성장하세요.",
        "화가 날 때는 그 감정을 다루는 건강한 방법을 찾아보세요. 운동, 명상, 글쓰기 등이 도움이 될 수 있습니다."
    ]


    // 슬픔에 대한 조언
    let adviceForSadness = [
        "슬픔은 때로 우리의 감정을 치유하는 과정의 일부입니다. 이 시간을 자신을 돌보는 데 사용해보세요.",
        "슬픔을 느낄 때, 그것을 표현하는 것이 중요합니다. 일기를 쓰거나, 친구와 이야기하는 것이 도움이 될 수 있습니다.",
        "모든 감정은 우리 삶의 일부입니다. 슬픔도 그 중 하나이며, 이를 통해 우리는 성장합니다.",
        "슬픔은 잠시 머무는 감정일 뿐입니다. 시간이 지나면, 더 밝은 날이 올 것입니다.",
        "당신이 슬픔을 느낀다면, 그것은 당신이 깊이 사랑할 수 있다는 증거입니다. 자신의 감정을 소중히 여기세요.",
        "때로 슬픔 속에서 우리는 더 큰 의미와 목적을 발견합니다. 이 경험을 통해 자신을 발견해보세요.",
        "슬픔이 당신을 압도할 때, 주변 사람들의 지지를 구하세요. 당신은 혼자가 아닙니다.",
        "슬픔은 우리에게 삶의 소중함을 가르쳐 줍니다. 이를 통해 삶을 더 깊이 이해하게 될 것입니다.",
        "눈물은 때로 우리의 마음을 정화시킵니다. 슬픔을 통해 마음의 평화를 찾을 수도 있습니다.",
        "슬픔이 당신의 내면 깊은 곳에 영향을 미친다면, 그것을 표현하고 그로부터 배우세요. 당신의 마음은 강합니다."
    ]



    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradientAnimation(on: self.view)
        setupResultLabel()

        if let text = userText {
            analyzeTextEmotion(text)
        }
    }

    func setupResultLabel() {
        resultLabel = UILabel()
        resultLabel.textAlignment = .center
        resultLabel.textColor = .white
        resultLabel.numberOfLines = 0 // 여러 줄 표시 허용
        view.addSubview(resultLabel)

        resultLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalTo(view).inset(20)
        }
    }

    func analyzeTextEmotion(_ text: String) {
        if isKorean {
            let model = koreanEmotionText() // 한국어 감정 분석 모델 클래스 사용
            guard let prediction = try? model.prediction(text: text) else {
                resultLabel.text = "감정 분석 실패"
                return
            }

            // 한국어 감정에 따른 조언을 선택하여 UI 업데이트
            let randomAdvice = getRandomKoreanAdvice(for: prediction.label)
            DispatchQueue.main.async {
                self.resultLabel.text = "\(randomAdvice)"
            }
        } else {
            let model = emotionTextML() // 영어 감정 분석 모델 클래스 사용
            guard let prediction = try? model.prediction(text: text) else {
                resultLabel.text = "감정 분석 실패"
                return
            }

            // 영어 감정에 따른 조언을 선택하여 UI 업데이트
            let randomAdvice = getRandomAdvice(for: prediction.label)
            DispatchQueue.main.async {
                self.resultLabel.text = "\(randomAdvice)"
            }
        }
    }

    func getRandomKoreanAdvice(for emotion: String) -> String {
        switch emotion {
        case "놀람":
            return adviceForSurprise.randomElement() ?? ""
        case "행복":
            return adviceForHappiness.randomElement() ?? ""
        case "중립":
            return adviceForNeutralKorean.randomElement() ?? ""
        case "공포":
            return adviceForFear.randomElement() ?? ""
        case "혐오":
            return adviceForDisgust.randomElement() ?? ""
        case "분노":
            return adviceForAnger.randomElement() ?? ""
        case "슬픔":
            return adviceForSadness.randomElement() ?? ""
        default:
            return "잠시 숨을 고르고 순간"
        }
    }

    func getRandomAdvice(for emotion: String) -> String {
        switch emotion {
        case "neutral":
            return adviceForNeutral.randomElement() ?? ""
        case "negative":
            return adviceForNegative.randomElement() ?? ""
        case "positive":
            return adviceForPositive.randomElement() ?? ""
        default:
            return "Just breathe and be in the moment."
        }
    }
}

