
import UIKit

class asdViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let showButton = UIButton()
    let backButton = UIButton()
    let secondHalfLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Scrollview ayarları
        scrollView.backgroundColor = UIColor.lightGray
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height)
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        
        // İleri git buton ayarları
        showButton.setTitle("Show Second Half", for: .normal)
        showButton.backgroundColor = UIColor.blue
        showButton.addTarget(self, action: #selector(showSecondHalf), for: .touchUpInside)
        view.addSubview(showButton)
        
        // Geri dön buton ayarları
        backButton.setTitle("Show First Half", for: .normal)
        backButton.backgroundColor = UIColor.red
        backButton.addTarget(self, action: #selector(showFirstHalf), for: .touchUpInside)
        backButton.isHidden = true
        view.addSubview(backButton)
        
        // İkinci yarının merkezindeki label ayarları
        secondHalfLabel.text = "2. Kısım"
        secondHalfLabel.textColor = UIColor.black
        secondHalfLabel.textAlignment = .center
        secondHalfLabel.isHidden = true
        scrollView.addSubview(secondHalfLabel)
        
        // Scrollview ve butonların konumlandırılması
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        showButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        secondHalfLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            showButton.widthAnchor.constraint(equalToConstant: 150),
            showButton.heightAnchor.constraint(equalToConstant: 40),
            
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            backButton.widthAnchor.constraint(equalToConstant: 150),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            secondHalfLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: scrollView.contentSize.width / 4),
            secondHalfLabel.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            secondHalfLabel.widthAnchor.constraint(equalToConstant: 100),
            secondHalfLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // İlk yarıyı görünür hale getir
        scrollView.contentOffset.x = 0
    }
    
    @objc func showSecondHalf() {
        // İkinci yarıya animasyonlu geçiş yap
        UIView.animate(withDuration: 0.5) {
            self.scrollView.contentOffset.x = self.scrollView.contentSize.width / 2
        } completion: { _ in
            self.showButton.isHidden = true
            self.backButton.isHidden = false
            self.secondHalfLabel.isHidden = false
        }
    }
    
    @objc func showFirstHalf() {
        // İlk yarıya animasyonlu geçiş yap
        UIView.animate(withDuration: 0.5) {
            self.scrollView.contentOffset.x = 0
        } completion: { _ in
            self.showButton.isHidden = false
            self.backButton.isHidden = true
            self.secondHalfLabel.isHidden = true
        }
    }
}
