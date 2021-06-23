package com.recruitmentportal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.recruitmentportal.DAO.RecruitmentPortalDAO;
import com.recruitmentportal.entity.CompanyDescription;

@RestController
public class RecruitmentRestController {
	@Autowired
	private RecruitmentPortalDAO recruitmentDAO;
	
	@RequestMapping(value = { "/viewClientsRest" }, method = RequestMethod.GET)
	public ResponseEntity<List<CompanyDescription>> Viewcompany(Model model, HttpServletRequest req) 
			throws HandlingException {
		List<CompanyDescription> clientList = recruitmentDAO.getAllClients();
		return new ResponseEntity<List<CompanyDescription>>(clientList,HttpStatus.OK);
		
	}
	@RequestMapping(value = { "/viewClientsRest/{compnyId}" }, method = RequestMethod.GET)
	public String ViewcompanybyId(@PathVariable String compnyId, HttpServletRequest req) 
			throws HandlingException {
		String clientName = recruitmentDAO.getAllClientsById(compnyId);
		return clientName;
		
	}
	
}
