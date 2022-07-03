package com.myshop.util;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.myshop.dto.CustomerDTO;

public class CustomerValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return CustomerDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate()");
		CustomerDTO DTO = (CustomerDTO) target;
		String Email = DTO.getEmail();
		if(Email == null || Email.trim().isEmpty()) {
			System.out.println("야야 null or Empty");
			errors.rejectValue("name", "trouble");
			
		}

	}

}
