package com.recruitmentportal.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;



@ControllerAdvice
public class CustomExceptionHandler {
	private final Logger logger = Logger.getLogger(CustomExceptionHandler.class);
	
	@ExceptionHandler(HandlingException.class)
	public ModelAndView handleCustomException(HandlingException ex) {

		ModelAndView model = new ModelAndView("customerror");
		model.addObject("errCode", ex.getErrCode());
		model.addObject("errMsg", ex.getErrMsg());
		model.addObject("errMsgContent", ex.getErrMsgContent());
		
		
		
		return model;

		
		/*
		 * if (request.getRequestedSessionId() != null &&
		 * !request.isRequestedSessionIdValid()) { // Session is expired }
		 */
	}
	

	
	@ExceptionHandler(value = Exception.class)
	public ModelAndView defaultErrorHandler(HttpServletRequest req, 
               Exception e) throws Exception {
		
		logger.error("[URL] : {}", e);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e);
		mav.addObject("url", req.getRequestURL());
		mav.setViewName("error");
		return mav;
	}
	
	@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="IOException occured")
	public String handlingHttpStatusExceptions(ModelMap map)
	{
		String message = "Due to some technical problem application aborted this process!\n"
				+ "Kindly do other operations.";
		map.put("error message", message);
		return "httpstatuserror";
	}
}
