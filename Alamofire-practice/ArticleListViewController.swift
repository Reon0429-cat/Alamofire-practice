//
//  ArticleViewController.swift
//  Alamofire-practice
//
//  Created by 大西玲音 on 2021/05/10.
//

import UIKit

final class ArticleListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        getArticles()
        
    }
    
}

private extension ArticleListViewController {
    
    func getArticles() {
        APIClient().request { result in
            switch result {
                case .success(let articles):
                    self.articles = articles
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    self.showAPIAlert(error: error)
            }
        }
    }
    
    func showAPIAlert(error: APIError) {
        let alert = UIAlertController(title: error.title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "閉じる", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDataSource
extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
    
}
