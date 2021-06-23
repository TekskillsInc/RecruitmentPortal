package com.recruitmentportal.util;


/*
@Author Jaipal
Date:09/07/2016 10:09AM
*/
import java.io.ByteArrayOutputStream;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Serializer 
{

	public static String serializeToJson(Object theObject) {

		String theJsonString = null;

		try {
			ObjectMapper theObjectMapper = new ObjectMapper();
			ByteArrayOutputStream theJsonOutputStream = new ByteArrayOutputStream();
			theObjectMapper.writeValue(theJsonOutputStream, theObject);

			theJsonString = theJsonOutputStream.toString("UTF-8");
		} catch (Exception theException) {
		        theException.printStackTrace();
	        }

	     return theJsonString;
	     /*created by Jaipal*/

	}
	private Serializer()
	{}
}
