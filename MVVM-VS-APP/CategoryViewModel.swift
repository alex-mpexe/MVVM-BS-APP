import UIKit
import Alamofire
import RxCocoa
import RxSwift

class CategoryViewModel {
    
    let categories = BehaviorSubject<[Category]>(value: [])
    let apiURL = "http://blackstarshop.ru/index.php?route=api/v1/categories"
    
    
    //MARK: - Services
    func fetchCategories() {
        AF.request(apiURL).response {[weak self] response in
            guard let data = response.data else { return }
            do {
                let categories = try JSONDecoder().decode([String: Category].self, from: data)
                self?.categories.onNext(categories.map { $0.value })
            } catch {
                return
            }
        }
    }
    
    init() {
        fetchCategories()
    }
    
}
