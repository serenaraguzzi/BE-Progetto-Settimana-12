package it.be.progettosettimana12.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import it.be.progettosettimana12.exception.CatalogoException;
import it.be.progettosettimana12.model.Autore;
import it.be.progettosettimana12.model.Categoria;
import it.be.progettosettimana12.model.Libro;
import it.be.progettosettimana12.repository.AutoreRepository;
import it.be.progettosettimana12.repository.CategoriaRepository;
import it.be.progettosettimana12.repository.LibroRepository;

@Service
public class LibroService {

	@Autowired
	LibroRepository libroRepository;

	@Autowired
	AutoreRepository autoreRepository;

	@Autowired
	CategoriaRepository categoriaRepository;

	public List<Libro> findAllLibri() {
		return libroRepository.findAll();
	}

	public Optional<Libro> findLibroById(Long id) {
		return libroRepository.findById(id);
	}

	public Libro addLibro(Libro libro) {
		return libroRepository.save(libro);
	}

	public Libro updateLibro(Long id, Libro libro) {
		Optional<Libro> trovato = libroRepository.findById(id);
		if (trovato.isPresent()) {
			Libro update = trovato.get();
			update.setTitolo(libro.getTitolo());
			update.setAnnoPubblicazione(libro.getAnnoPubblicazione());
			update.setAutori(libro.getAutori());
			update.setCategorie(libro.getCategorie());
			update.setPrezzo(libro.getPrezzo());
			libroRepository.save(update);
			return update;
		}
		else {
			throw new CatalogoException("ERRORE!");
		}
	}

	public List<Libro> findAllByCategorie(Set<Long> categorie) {
		List<Libro> libriByCategorie = new ArrayList<>();
		List<Categoria> cat = categoriaRepository.findAllById(categorie);
		if (cat.isEmpty())
			return libriByCategorie;
		for (Libro l : findAllLibri()) {
			for (Categoria c : l.getCategorie()) {
				if (cat.contains(c)) {
					libriByCategorie.add(l);
				}
			}
		}
		return libriByCategorie;
	}

	public void deleteLibroById(Long id) {
		libroRepository.deleteById(id);
	}

	public void deleteLibriNoAutori() {
		List<Libro> all = libroRepository.findAll();
		List<Libro> libriNoAutori = new ArrayList<>();
		for (Libro libro : all) {
			if (libro.getAutori().isEmpty()) {
				libriNoAutori.add(libro);
			}
		}
		libroRepository.deleteAll(libriNoAutori);
	}

	public List<Libro> findAllLibriByAutori(Set<Long> autori) {
		List<Libro> findLibriByAutori = new ArrayList<>();
		List<Autore> aut = autoreRepository.findAllById(autori);
		if (aut.isEmpty()) 
			return findLibriByAutori;
		for (Libro l : findAllLibri()) {
			for (Autore a : l.getAutori()) {
				if (aut.contains(a)) {
					findLibriByAutori.add(l);
				}
			}
		}
		return findLibriByAutori;
	}

}