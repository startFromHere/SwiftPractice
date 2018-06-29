//
//  LTQRCodeVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/6/27.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit
import AVFoundation

/// VC
class LTQRCodeVC: LTBaseVC {
    var sendURL: String!
    var codeReader: CodeReader = LTCodeReader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let previewLayer = codeReader.videoPreview
        previewLayer.frame = self.view.bounds
        self.view.layer.addSublayer(previewLayer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startReading()
    }
    
    func startReading() {
        codeReader.startReading(completion: didOutPut)
    }
    
    func stopReading() {
        codeReader.stopReading()
    }
    
    private func didOutPut(result:CodeResult){
        switch result {
        case .success(let elemento):
            print(elemento)
            sendURL = elemento
        case .failure:
            showNotAvailableCameraError()
        }
    }
        
    private func showNotAvailableCameraError() {
        let alert = UIAlertController(title: "Camera required", message: "This device has no camera.Is this an iOS simulator?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}

/// CodeReader
protocol CodeReader {
    var videoPreview : CALayer {get}
    func startReading(completion: @escaping (CodeResult) -> Void)
    func stopReading()
}

enum CodeResult {
    typealias Elemento = String
    case success(Elemento)
    case failure(Error)
    
    enum Error:Swift.Error {
        case noCameralAvailable
    }
}

/// codeReader
class LTCodeReader: NSObject, CodeReader {
    var videoPreview: CALayer = CALayer()
    
//    private(set) var videoPreview = CALayer()
    private var captureSession:AVCaptureSession?
    private var completion: ((CodeResult) -> Void)?
    
    override init() {
        super.init()
        
        guard let captureVideoDevice = AVCaptureDevice.default(for: .video), let deviceInput = try? AVCaptureDeviceInput(device: captureVideoDevice) else {
            return
        }
        
        captureSession = AVCaptureSession()
        guard let captureSession = captureSession else {return}
        
        captureSession.addInput(deviceInput)
        
        let captureMetadataOutPut = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutPut)
        captureMetadataOutPut.setMetadataObjectsDelegate(self, queue: DispatchQueue(label: "com.examlple.QRCode.metadata"))
        
        captureMetadataOutPut.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        let captureVideoPreview = AVCaptureVideoPreviewLayer(session: captureSession)
        captureVideoPreview.videoGravity = .resizeAspectFill
        self.videoPreview = captureVideoPreview
    }
    
    func startReading(completion:@escaping (CodeResult) -> Void) {
        guard let captureSession = captureSession else {
            completion(.failure(.noCameralAvailable))
            return
        }
        
        self.completion = completion
        captureSession.startRunning()
    }
    
    func stopReading(){
        captureSession?.stopRunning()
    }

}

extension LTCodeReader:AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let readableCode = metadataObjects.first as? AVMetadataMachineReadableCodeObject, let elemento = readableCode.stringValue else {
            return
        }
        completion?(.success(elemento))
    }
}


