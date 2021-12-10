package com.codingdojo.poke.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.codingdojo.poke.models.Poke;
import com.codingdojo.poke.repositories.PokeRepository;

@Service
public class PokeService {
	
	
    // adding the book repository as a dependency
    private final PokeRepository pokeRepository;

	public PokeService(PokeRepository pokeRepository) {
		this.pokeRepository = pokeRepository;
	}
    
    
    
//    public PokeService(PokeRepository pokeRepository) {
//        this.pokeRepository = pokeRepository;
//    }
//    // returns all the books
    public List<Poke> allPoke() {
        return pokeRepository.findAll();
    }
//    // creates a book
    public Poke createPoke(Poke b) {
        return pokeRepository.save(b);
    }
    
    public Poke updatePoke(Poke p) {
    	return pokeRepository.save(p);
    	
    }
    
    public Poke findPoke(Long id) {
        Optional<Poke> optionalPoke = pokeRepository.findById(id);
        if(optionalPoke.isPresent()) {
            return optionalPoke.get();
        } else {
            return null;
        }
    }
    
    public void deletePoke(Long id) {
    	pokeRepository.deleteById(id);
    	
    }
}

