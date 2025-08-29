// created by Prakash Pramanik on 28-08-2025
package com.example.crudspringboot.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.crudspringboot.entity.Book;
import com.example.crudspringboot.repo.BookRepository;

@Controller
@RequestMapping("/library") // Base URL for all mappings in this controller
public class BookController {

	@Autowired
	private BookRepository bookRepository; // Inject the BookRepository to access database

	// Show the form to add a new book
	@GetMapping("/addBookForm")
	public String displayAddBookForm(Model model) {
		model.addAttribute("book", new Book());
		return "addBook";
	}

	// Show the home page
	@RequestMapping("/home")
	public String home(Model model) {
		model.addAttribute("appName", "Book Management System");
		return "home";
	}

	// Display list of all books
	@RequestMapping("/display")
	public String displayBookInfo(Model model) {
		List<Book> allBooks = (List<Book>) bookRepository.findAll();
		model.addAttribute("books", allBooks);
		if (allBooks.isEmpty())
			model.addAttribute("msg", "Unfortunately, the library is empty now. Let's contribute by adding some books");
		else {
			if (model.getAttribute("msg") == null)
				model.addAttribute("msg", "Welcome to the Book Management System!");
		}
		return "displayBook";
	}

	// Handle form submission to add a new book
	@PostMapping("/addBook")
	public String addBook(@ModelAttribute("book") Book book) {
		book.setStatus("Available");
		book.setBorrowedForDays(0);
		book.setBorrowedDate(null);
		bookRepository.save(book);
		return "redirect:/library/display";
	}

	// Show edit form for a book by id
	@GetMapping("/edit/{id}")
	public String editBookForm(@PathVariable int id, Model model) {
		Optional<Book> bookOpt = bookRepository.findById(id);
		if (bookOpt.isPresent()) {
			model.addAttribute("book", bookOpt.get());
			return "editBook";
		} else {
			model.addAttribute("msg", "Book not found");
			return "redirect:/library/display";
		}
	}

	// Correct partial update: keep existing data for fields not on the form!
	@PostMapping("/updateBook")
	public String updateBook(@ModelAttribute("book") Book updatedBook) {
		Optional<Book> bookOpt = bookRepository.findById(updatedBook.getId());
		if (bookOpt.isPresent()) {
			Book book = bookOpt.get();
			book.setName(updatedBook.getName());
			book.setAuthor(updatedBook.getAuthor());
			book.setPrice(updatedBook.getPrice());
			bookRepository.save(book);
		}
		return "redirect:/library/display";
	}

	// Delete a book by id
	@RequestMapping("/delete/{id}")
	public String deleteBook(@PathVariable int id) {
		bookRepository.deleteById(id);
		return "redirect:/library/display";
	}

	// Show borrow form if book is available
	@GetMapping("/borrowForm/{id}")
	public String borrowForm(@PathVariable int id, Model model) {
		Optional<Book> bookOpt = bookRepository.findById(id);
		if (bookOpt.isPresent() && "Available".equalsIgnoreCase(bookOpt.get().getStatus())) {
			model.addAttribute("book", bookOpt.get());
			return "borrowBook";
		} else {
			model.addAttribute("msg", "Book not available for borrowing.");
			return "redirect:/library/display";
		}
	}

	// Handle borrowing action, update status and borrowing details
	@PostMapping("/borrowBook")
	public String borrowBook(@ModelAttribute("book") Book requestBook) {
		Optional<Book> bookOpt = bookRepository.findById(requestBook.getId());
		if (bookOpt.isPresent()) {
			Book book = bookOpt.get();
			book.setStatus("Borrowed");
			book.setBorrowedDate(LocalDate.now());
			book.setBorrowedForDays(requestBook.getBorrowedForDays());
			bookRepository.save(book);
		}
		return "redirect:/library/display";
	}
}
