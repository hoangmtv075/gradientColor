import UIKit
import PlaygroundSupport

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}


let label = UILabel()
label.frame = CGRect(x: 0.0, y: 0.0, width: 235, height: 70)
label.font = UIFont(name: "ArialRoundedMTBold", size: 50.0)
label.backgroundColor = .black

label.text = "@jl.coder"
label.sizeToFit()

PlaygroundPage.current.liveView = label

func createGr(bounds: CGRect) -> CAGradientLayer {
    let gr = CAGradientLayer()
    gr.frame = bounds
    gr.startPoint = CGPoint(x: 0.0, y: 0.5)
    gr.endPoint = CGPoint(x: 1.0, y: 0.5)
    gr.colors = [
        UIColor(hex: 0xFE4980).cgColor,
        UIColor(hex: 0xFFC767).cgColor,
    ]
    gr.locations = [0.0, 1.0]
    
    return gr
}

func convertGradientToColor(gr: CAGradientLayer) -> UIColor {
    let render = UIGraphicsImageRenderer(bounds: gr.bounds)
    let image = render.image { context in
        gr.render(in: context.cgContext)
    }
    
    return UIColor(patternImage: image)
}

let gr = createGr(bounds: label.bounds)
let color = convertGradientToColor(gr: gr)

label.textColor = color
//label.textColor = .blue
