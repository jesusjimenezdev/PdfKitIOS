import UIKit
struct Libros {
    var nombre : String
    var nombreArchivo : String
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var libros = [Libros]()
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        
        let libro1 = Libros(nombre: "BATMAN LIFE", nombreArchivo: "batman_biografia")
        libros.append(libro1)
        let libro2 = Libros(nombre: "IRONMAN BIOGRAFIA", nombreArchivo: "ironman_biografia")
        libros.append(libro2)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let libro = libros[indexPath.row]
        cell.textLabel?.text = libro.nombre
        cell.detailTextLabel?.text = libro.nombreArchivo + ".pdf"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "enviar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar"{
            if let id = tabla.indexPathForSelectedRow {
                let fila = libros[id.row]
                let destino = segue.destination as! LibrosViewController
                destino.libroPDF = fila
            }
        }
    }

}














