package dev.mvc.tool;
 
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
 
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
 
import org.apache.commons.codec.binary.Base64;
 
public class AES256Util {
  private String iv;
  private Key keySpec;
 
  // Ű ����
  public AES256Util() throws UnsupportedEncodingException {
    // String key = "soldeskAES256KEY"; // key�� 16��, 123 -> spyryuhFvhnnv6cD2ROB8g==
    String key = "soldeskAES256235";    // key�� 16��, 123 -> KUxUbf+4VrlpsFZ3tSAKdw==
    this.iv = key.substring(0, 16);
 
    byte[] keyBytes = new byte[16];
    byte[] b = key.getBytes("UTF-8");
    int len = b.length;
    if (len > keyBytes.length)
      len = keyBytes.length;
    System.arraycopy(b, 0, keyBytes, 0, len);
    SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
 
    this.keySpec = keySpec;
  }
 
  // ��ȣȭ
  public String aesEncode(String str)
      throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException,
      InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
 
    byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
    String enStr = new String(Base64.encodeBase64(encrypted));
 
    return enStr;
  }
 
  // ��ȣȭ
  public String aesDecode(String str)
      throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException,
      InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
 
    byte[] byteStr = Base64.decodeBase64(str.getBytes());
 
    return new String(c.doFinal(byteStr), "UTF-8");
  }
 
  public static void main(String[] args) throws Exception {
    AES256Util aes256 = new AES256Util();
 
    String text = "������ 123 ABC !@#";
    // String text = "123"; // spyryuhFvhnnv6cD2ROB8g==
 
    String encText = aes256.aesEncode(text);      // ��ȣȭ
    String decText = aes256.aesDecode(encText); // ��ȣȭ
 
    System.out.println("��ȣȭ�� ���� : " + text);
    System.out.println("��ȣȭ�� ����(DBMS ����) : " + encText);
    System.out.println("��ȣȭ�� ���� : " + decText);
  }
 
}
 