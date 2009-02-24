/*
 * Created on 2005/8/31
 *
 */
package com.sells.common.util;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

/**
 * 加解密程式
 * @author davidelin
 */
public class SecurityString {
  
  private static byte[] key = "goooy".getBytes();
  private static String Algorithm = "DES";
  
  /**
   * @throws Exception
   */
  public static void getKey() throws Exception {
    KeyGenerator keygen = KeyGenerator.getInstance(Algorithm);
    SecretKey deskey = keygen.generateKey();
    key = deskey.getEncoded();
  }
  
  /**
   * 加密
   * @param input
   * @return
   * @throws Exception
   */
  public static String encode(byte[] input) throws Exception {
    SecretKey deskey = new javax.crypto.spec.SecretKeySpec(key, Algorithm);

    Cipher c1 = Cipher.getInstance(Algorithm);
    c1.init(Cipher.ENCRYPT_MODE, deskey);
    byte[] cipherByte = c1.doFinal(input);

    return new sun.misc.BASE64Encoder().encode(cipherByte);
  }
 
  /**
   * 解密
   * @param input
   * @return
   * @throws Exception
   */
  public static String decode(String input) throws Exception {
    SecretKey deskey = new javax.crypto.spec.SecretKeySpec(key, Algorithm);
    Cipher c1 = Cipher.getInstance(Algorithm);
    c1.init(Cipher.DECRYPT_MODE, deskey);
    byte[] clearByte = c1.doFinal(new sun.misc.BASE64Decoder().decodeBuffer(input));
    return new String(clearByte);
  }
}
