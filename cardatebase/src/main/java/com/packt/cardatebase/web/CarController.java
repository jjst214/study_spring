package com.packt.cardatebase.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.packt.cardatebase.domain.Car;
import com.packt.cardatebase.domain.CarRepository;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class CarController {
	@Autowired
	private CarRepository repository;
	@RequestMapping("/cars")
	public Iterable<Car> getCars(){
		//자동차를 반환
		return repository.findAll();
	}
	@RequestMapping("/searchcars")
	public Iterable<Car> getSearchCars(String brand){
		return repository.findByBrand(brand);
	}
}
