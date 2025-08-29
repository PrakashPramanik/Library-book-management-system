package com.example.crudspringboot.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.crudspringboot.entity.Book;

 
public interface BookRepository extends CrudRepository<Book, Integer> {
}
