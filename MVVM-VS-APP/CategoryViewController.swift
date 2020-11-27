import UIKit
import RxSwift
import RxCocoa

class CategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    private let viewModel = CategoryViewModel()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rx.setDelegate(self).disposed(by: bag)
        bind()
    }
    
    //MARK: - Binding values
    func bind() {
        viewModel.categories.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: CategoryTableViewCell.self)) { (row, item, cell) in
            cell.icon = item.iconImage
            cell.categoryLabel.text = item.name
        }.disposed(by: bag)
    }

}

//MARK: - TableView Extension
extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
