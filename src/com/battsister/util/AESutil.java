package com.battsister.util;

/**
 * Created by haihui on 2015-06-16.
 */

import java.security.SecureRandom;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class AESutil {

    public static String encrypt_byte(String seed, String cleartext) throws Exception {

        byte[] rawKey = toByte(seed);
        byte[] result = encrypt(rawKey, toByte(cleartext));
        return toHex(result);
    }


    public static String encrypt(String seed, String cleartext) throws Exception {
        byte[] rawKey = getRawKey(seed.getBytes());
        byte[] result = encrypt(rawKey, cleartext.getBytes());
        return toHex(result);
    }

    public static String decrypt_byte(String seed, String encrypted) throws Exception {
        byte[] rawKey = toByte(seed);
        byte[] enc = toByte(encrypted);
        byte[] result = decrypt(rawKey, enc);
        return toHex(result);
    }


    public static String decrypt(String seed, String encrypted) throws Exception {
        byte[] rawKey = getRawKey(seed.getBytes());
        byte[] enc = toByte(encrypted);
        byte[] result = decrypt(rawKey, enc);
        return new String(result);
    }

    private static byte[] getRawKey(byte[] seed) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        sr.setSeed(seed);
        kgen.init(128, sr); // 192 and 256 bits may not be available
        SecretKey skey = kgen.generateKey();
        byte[] raw = skey.getEncoded();
        return raw;
    }


    private static byte[] encrypt(byte[] raw, byte[] clear) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES/ECB/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(clear);
        return encrypted;
    }

    private static byte[] decrypt(byte[] raw, byte[] encrypted) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES/ECB/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] decrypted = cipher.doFinal(encrypted);
        return decrypted;
    }

    public static String toHex(String txt) {
        return toHex(txt.getBytes());
    }

    public static byte[] long2bytes(long num) {
        byte[] b = new byte[8];
        for (int i = 0; i < 8; i++) {
            b[i] = (byte) (num >>> (56 - (i * 8)));
        }
        return b;
    }

    public static byte[] int2bytes(int num) {
        byte[] b = new byte[4];
        for (int i = 0; i < 4; i++) {
            b[i] = (byte) (num >>> (24 - (i * 8)));
        }
        return b;
    }

    public static String fromHex(String hex) {
        return new String(toByte(hex));
    }

    public static byte[] toByte(String hexString) {
        int len = hexString.length() / 2;
        byte[] result = new byte[len];
        for (int i = 0; i < len; i++)
            result[i] = Integer.valueOf(hexString.substring(2 * i, 2 * i + 2), 16).byteValue();
        return result;
    }

    public static String fanzhuantoByte(String hexString) {//翻转
        String fanhui = hexString;
        StringBuffer result = new StringBuffer();
        for (int i = hexString.length(); i - 2 >= 0; i = i - 2) {
            result.append(fanhui.substring(i - 2, i));
        }
        return result.toString();
    }

    public static String hex2Integer(String hexString) {
        StringBuffer result = new StringBuffer();
        result.append(Long.parseLong(hexString, 16));
        return result.toString();
    }

    /**
     * 在字符串前面补零，得到一个长度为length的字符串
     *
     * @param str 字符串
     * @param len 得到的字符串的总长度
     * @return 补齐零之后的字符串
     * @throws IllegalArgumentException 如果str.length()>len
     */
    public static String zeroize(String str, int len) {
        if (str.length() > len) {
            throw new IllegalArgumentException("The length of str cannot be longer than len.");
        }
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < len - str.length(); i++) {
            result.append("0");
        }
        return result.toString() + str;
    }

    public static String Hex2String(String hexString) {
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < hexString.length(); i = i + 2) {
            result.append((Integer.parseInt(hexString.substring(i, i + 2)) - 30) + "");
        }
        return result.toString();
    }

    public static String toHex(byte[] buf) {
        if (buf == null)
            return "";
        StringBuffer result = new StringBuffer(2 * buf.length);
        for (int i = 0; i < buf.length; i++) {
            appendHex(result, buf[i]);
        }
        return result.toString();
    }

    public static String toHex(byte buf) {
        StringBuffer result = new StringBuffer(2);
        appendHex(result, buf);
        return result.toString();
    }

    public static String toHexallString(String s) { //一个个字符转换编码为16进制
        String str = "";
        for (int i = 0; i < s.length(); i++) {
            String s4 = toHexString(s.substring(i, i + 1));
            str = str + s4;
        }
        return str;
    }

    public static String toHexString(String s) { //转换编码为16进制
        String str = "";
        for (int i = 0; i < s.length(); i++) {
            int ch = (int) s.charAt(i);
            String s4 = Integer.toHexString(ch);
            str = str + s4;
        }
        return str;
    }

    private final static String HEX = "0123456789ABCDEF";

    private static void appendHex(StringBuffer sb, byte b) {
        sb.append(HEX.charAt((b >> 4) & 0x0f)).append(HEX.charAt(b & 0x0f));
    }

    public static String GetHex(int length) {
        String fanhui = "";
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int weizhi = Math.abs(random.nextInt()) % 15;
            String aa = HEX.substring(weizhi, weizhi + 1);
            fanhui = fanhui + aa;
        }
        return fanhui;
    }


    public static byte[] yihuo(byte[] a, byte[] b) {
        byte[] c = a;
        for (int i = 0; i < b.length; i++) {
            c[i] = (byte) (a[i] ^ b[i]);
        }
        return c;
    }

    public static byte jiaoyanyihuo(byte[] a) {
        byte c = a[0];
        for (int i = 0; i < a.length - 1; i++) {
            c = (byte) (c ^ a[i + 1]);
        }
        return c;
    }

    public static String Getdi8(String key) {
        String fanhui = key.substring(0, 16);
        // fanhui=fanzhuantoByte(fanhui);
        fanhui = "4D4B4C42" + fanhui + "00000000";
        return fanhui;
    }

    public static String Getgao8(String key) {
        String fanhui = key.substring(16, 32);
        //  fanhui=fanzhuantoByte(fanhui);
        fanhui = "4D4B4842" + fanhui + "00000000";
        return fanhui;
        //4D 4B 48 42
    }

    /*String masterPassword = "a";
    String originalText = "0123456789";
    byte[] text = new byte[]{'0','1','2','3','4','5','6','7','8','9'};
    byte[] password = new byte[]{'a'};
    try {
        String encryptingCode = SimpleCrypto.encrypt(masterPassword,originalText);
//      System.out.println("加密结果为 " + encryptingCode);
        Log.i("加密结果为 ",encryptingCode);
        String decryptingCode = SimpleCrypto.decrypt(masterPassword, encryptingCode);
        System.out.println("解密结果为 " + decryptingCode);
        Log.i("解密结果",decryptingCode);
       } catch (Exception e) {
        e.printStackTrace();
}  */


}
