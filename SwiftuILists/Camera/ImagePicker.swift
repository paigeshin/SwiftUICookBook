//
//  ImagePicker.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct ImagePickerUsageView: View {
    @State var showImagePicker: Bool = false
    @State var image: Image?
    
    var body: some View {
        VStack {
            Button("Open Camera") {
                showImagePicker = true
            }
        }
        .sheet(isPresented: $showImagePicker) {
            PhotoCaptureView(showImagePicker: $showImagePicker, image: $image)
        }
    }
}

struct PhotoCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
    
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image)
    }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var isShown: Bool
        @Binding var image: Image?
        
        init(isShown: Binding<Bool>, image: Binding<Image?>) {
            _isShown = isShown
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let uiImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiImage)
            isShown = false
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown = false
        }
        
    }
    
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(isShown: .constant(true), image: .constant(Image("")))
    }
}
