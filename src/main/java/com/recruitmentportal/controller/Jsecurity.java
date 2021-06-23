package com.recruitmentportal.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class Jsecurity {
	private final static String ALGORITHM = "AES"; 
	private final static String HEX = "0123456789ABCDEF";
	private final static  String secretKey="Tek@123";
	
	public static String cipher(String data) throws Exception  {

		
		byte[] key = secretKey.getBytes("UTF-8");
		MessageDigest sha = MessageDigest.getInstance("SHA-1");
		key = sha.digest(key);
		key = Arrays.copyOf(key, 16); // use only first 128 bit

		SecretKeySpec secretKeySpec = new SecretKeySpec(key, "AES");
         //System.out.println("encrypted key..."+secretKeySpec); 
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
		return toHex(cipher.doFinal(data.getBytes()));
		
		
		
		
		}
	
	public static String decipher(String data) throws Exception { 

		
		byte[] key = secretKey.getBytes("UTF-8");
		MessageDigest sha = MessageDigest.getInstance("SHA-1");
		key = sha.digest(key);
		key = Arrays.copyOf(key, 16); // use only first 128 bit
		
		SecretKeySpec secretKeySpec = new SecretKeySpec(key, "AES");
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		//byte[] iv = new byte[cipher.getBlockSize()];

       // IvParameterSpec ivParams = new IvParameterSpec(iv);
        //System.out.println("iv size.."+iv+"iv params..."+ivParams+"keyspec...."+secretKeySpec); 
		cipher.init(Cipher.DECRYPT_MODE, secretKeySpec); 

		return new String(cipher.doFinal(toByte(data)));
		}

		// Helper methods

		private static byte[] toByte(String hexString) {
		int len = hexString.length()/2;

		byte[] result = new byte[len];

		for (int i = 0; i < len; i++)
		result[i] = Integer.valueOf(hexString.substring(2*i, 2*i+2), 16).byteValue();
		return result;
		}

		public static String toHex(byte[] stringBytes) {
		StringBuffer result = new StringBuffer(2*stringBytes.length);

		for (int i = 0; i < stringBytes.length; i++) {
		result.append(HEX.charAt((stringBytes[i]>>4)&0x0f)).append(HEX.charAt(stringBytes[i]&0x0f));
		}

		return result.toString();
		}
}
