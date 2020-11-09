import UIKit
import Core
import Detail

class DetailTableViewController: UITableViewController {
    
    private let sections: [Section] = [
        .init(section: .detailRepository,
              rows: [.detailRepositoryVC])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DetailSandboxApp"
        tableView.register(UITableViewCell.self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, indexPath: indexPath)
        cell.textLabel?.text = sections[indexPath.section].rows[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .detailRepositoryVC:
            let vc = DetailAppEnvironment.shared.viewController(request: DetailRepositoryViewControllerRequest(input: .init(repository: .mock(name: "name",
                                                                                                                                              fullName: "fullName",
                                                                                                                                              description: "description",
                                                                                                                                              stargazersCount: 2000))))
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension DetailTableViewController {
    struct Section {
        let section: SectionType
        let rows: [Row]
    }
    
    enum SectionType: CaseIterable {
        case detailRepository
    }
    
    enum Row: String, CaseIterable {
        case detailRepositoryVC
    }
}
