import UIKit

struct Task {
    var text: String
    var isCompleted: Bool

    init(text: String, isCompleted: Bool = false) {
        self.text = text
        self.isCompleted = isCompleted
    }
}

class ViewController: UIViewController {

    @IBOutlet var collection: UICollectionView!
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        navigationItem.title = "To Do List"
        collection.alwaysBounceVertical = true
        collection.backgroundColor = .red
        // Register both the cell and the header
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(MyCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderReuseIdentifier")
    }
}

extension ViewController: UICollectionViewDelegate {

}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let task = tasks[indexPath.row]
        cell.lbl.text = task.text
        cell.lbl.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width, height: 50)
    }

    // Set the size for the header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collection.frame.width, height: 50)
    }

    // Function to header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderReuseIdentifier", for: indexPath) as! MyCollectionViewHeader
            headerView.textField.placeholder = "Enter Task"
            headerView.viewController = self
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
}

class MyCollectionViewHeader: UICollectionReusableView {

    var viewController: ViewController?

    let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        return textField
    }()

    let addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add Task", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()

    let toggleButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Show All", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.backgroundColor = UIColor(red: 52/255, green: 168/255, blue: 83/255, alpha: 1.0)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textField)
        textField.frame = CGRect(x: 0, y: 0, width: frame.width / 2, height: frame.height)

        addSubview(addButton)
        addButton.frame = CGRect(x: textField.frame.maxX, y: 0, width: frame.width / 4, height: frame.height)
        addButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)

        addSubview(toggleButton)
        toggleButton.frame = CGRect(x: addButton.frame.maxX, y: 0, width: frame.width / 4, height: frame.height)
        toggleButton.addTarget(self, action: #selector(toggleTasks), for: .touchUpInside)
    }

    @objc func addTask() {
        if let taskText = textField.text, !taskText.isEmpty {
            let newTask = Task(text: taskText)
            viewController?.tasks.append(newTask)
            viewController?.collection.reloadData()
            textField.text = ""
        }
    }

    @objc func toggleTasks() {
        viewController?.collection.reloadData()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewCell: UICollectionViewCell {
    let lbl: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lbl)
        lbl.frame = CGRect(x: 10, y: 0, width: frame.width - 20, height: frame.height)
        layer.cornerRadius = 5
        layer.borderWidth = 1
                layer.borderColor = UIColor.lightGray.cgColor
                clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
