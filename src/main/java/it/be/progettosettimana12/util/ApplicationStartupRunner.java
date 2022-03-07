package it.be.progettosettimana12.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import it.be.progettosettimana12.model.Autore;
import it.be.progettosettimana12.model.Categoria;
import it.be.progettosettimana12.model.Libro;
import it.be.progettosettimana12.repository.AutoreRepository;
import it.be.progettosettimana12.repository.CategoriaRepository;
import it.be.progettosettimana12.repository.LibroRepository;

@Component

public class ApplicationStartupRunner implements CommandLineRunner {

	@Autowired
	private LibroRepository libroRepository;
	
	@Autowired
	private AutoreRepository autoreRepository;
	
	@Autowired
	private CategoriaRepository categoriaRepository;

	@Override
	public void run(String... args) throws Exception {

		Autore autore = new Autore();
		autore.setNome("Simone");
		autore.setCognome("Guidi");
		autoreRepository.save(autore);

		Autore autore1 = new Autore();
		autore1.setNome("Alessio");
		autore1.setCognome("Tabolacci");
		autoreRepository.save(autore1);

		Autore autore2 = new Autore();
		autore2.setNome("Giuliano");
		autore2.setCognome("Scassaioli");
		autoreRepository.save(autore2);
		
		Autore autore3 = new Autore();
		autore3.setNome("Pasquale");
		autore3.setCognome("Torcasio");
		autoreRepository.save(autore3);
		
		Categoria categoria = new Categoria();
		categoria.setNome("Autobiografia");
		categoriaRepository.save(categoria);

		Categoria categoria1 = new Categoria();
		categoria1.setNome("Romanzo");
		categoriaRepository.save(categoria1);

		Categoria categoria2 = new Categoria();
		categoria2.setNome("Fantascienza");
		categoriaRepository.save(categoria2);
		
		Categoria categoria3 = new Categoria();
		categoria3.setNome("Bestseller");
		categoriaRepository.save(categoria3);

		Libro libro = new Libro();
		libro.setTitolo("Votatemi e vi restituirò un ArrayList di cribbio");
		libro.setAnnoPubblicazione(2021);
		libro.setPrezzo(19.99);

		Libro libro1 = new Libro();
		libro1.setTitolo("17 giugno 2001: storia di un amore");
		libro1.setAnnoPubblicazione(2019);
		libro1.setPrezzo(19.99);

		Libro libro2 = new Libro();
		libro2.setTitolo("Bbbbanalmente non sono più un backender!");
		libro2.setAnnoPubblicazione(2022);
		libro2.setPrezzo(14.99);
		
		Libro libro3 = new Libro();
		libro3.setTitolo("Cuore");
		libro3.setAnnoPubblicazione(2022);
		libro3.setPrezzo(14.99);
		
		Libro libro4 = new Libro();
		libro4.setTitolo("Noi altri de Roma");
		libro4.setAnnoPubblicazione(2022);
		libro4.setPrezzo(9.99);
		
		libro.getAutori().add(autore);
		libro.getCategorie().add(categoria);
		libroRepository.save(libro);

		libro1.getAutori().add(autore1);
		libro1.getCategorie().add(categoria1);
		libroRepository.save(libro1);

		libro2.getAutori().add(autore2);
		libro2.getCategorie().add(categoria2);
		libroRepository.save(libro2);
		
		libro3.getAutori().add(autore3);
		libro3.getCategorie().add(categoria1);
		libroRepository.save(libro3);
		
		libro4.getAutori().add(autore1);
		libro4.getAutori().add(autore2);
		libro4.getCategorie().add(categoria3);
		libroRepository.save(libro4);
	}

}