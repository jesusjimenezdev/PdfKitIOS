import UIKit
import PDFKit
class LibrosViewController: UIViewController {
    
    var libroPDF : Libros!
    let vistaPdf = PDFView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = libroPDF.nombre
        
        vistaPdf.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vistaPdf)
        
        vistaPdf.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vistaPdf.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vistaPdf.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vistaPdf.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        vistaPdf.autoScales = true
        
        let siguiente = UIBarButtonItem(barButtonSystemItem: .fastForward, target: vistaPdf, action: #selector(PDFView.goToNextPage(_:)))
        let atras = UIBarButtonItem(barButtonSystemItem: .rewind, target: vistaPdf, action: #selector(PDFView.goToPreviousPage(_:)))
        let primera = UIBarButtonItem(barButtonSystemItem: .refresh, target: vistaPdf, action: #selector(PDFView.goToFirstPage(_:)))
        navigationItem.rightBarButtonItems = [siguiente, atras, primera]
        
        //vistaPdf.displayMode = .singlePage
        //vistaPdf.displayMode = .twoUp
        vistaPdf.displayMode = .twoUpContinuous
        let nombreArchivo = libroPDF.nombreArchivo
        cargarLibro(archivo: nombreArchivo)
        
        
    }
    
    func cargarLibro(archivo: String){
        if let path = Bundle.main.url(forResource: archivo, withExtension: "pdf") {
            
            if let documento = PDFDocument(url: path){
                self.vistaPdf.document = documento
                self.vistaPdf.goToFirstPage(nil)
            }
            
        }else{
            print("error al cargar el pdf")
        }
    }

    

}












