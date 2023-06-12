//
//  ViewController.swift
//  PhotosExample
//
//  Created by 허지인 on 2021/06/18.
//

import UIKit
import Photos

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver{ //라이브러리에 변화가 생기면 감지

    @IBOutlet weak var tableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager() //가져온 에셋을 가지고 이미지를 로드해올 친구
    let cellIdentifier: String = "cell"
    
    
    @IBAction func touchUpRefreshButton(_ sender: UIBarButtonItem){
        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { //row를 편집할 수 있게 할건가?
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //편집을 하려고 할때
        if editingStyle == .delete { //삭제인가요?
            let asset: PHAsset = self.fetchResult[indexPath.row]
            PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.deleteAssets([asset] as NSArray)}, completionHandler: nil)
            //에셋을 딜리트할것이다
        }
    }
    
    func photoLibraryDidChange(_ changeInstance: PHChange){ //감지하고 있다가 바뀌면 호출될 메더으
        guard let changes = changeInstance.changeDetails(for:fetchResult)
            else{return}
        
        fetchResult = changes.fetchResultAfterChanges //어떤게 바뀌었는지
        
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic) //바뀌면 테이블뷰를 다시 불러달라
        }
    }
    
    func requestCollection() { //카메라롤 콜렉션을 가져옴
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)

        
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        
        
        //사진들을 최신순으로 정렬
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        //그 결과를 fetchResult로 가져옴
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let photoAuthorizationsStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationsStatus {
        case .authorized:
            print("접근 허가됨")
            self.requestCollection()
            self.tableView.reloadData()
        case .denied:
            print("접근 불허")
        case .notDetermined:
            print("아직 응답하지 않음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                    self.tableView.reloadData()
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        default: return
        }
        
        PHPhotoLibrary.shared().register(self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let options:PHImageRequestOptions = PHImageRequestOptions()
        options.resizeMode = .exact
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        imageManager.requestImage(for: asset,
                                  targetSize: CGSize(width: 30, height: 30),
                                  contentMode: .aspectFill,
                                  options: options,
                                  resultHandler: {image, _ in
                                    cell.imageView?.image = image
        })
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: ImageZoomViewController  = segue.destination as? ImageZoomViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        nextViewController.asset = self.fetchResult[index.row]
    }
}

