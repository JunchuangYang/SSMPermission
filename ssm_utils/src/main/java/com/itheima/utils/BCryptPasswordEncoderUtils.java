package com.itheima.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 密码加密工具类
 */
public class BCryptPasswordEncoderUtils {

    private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    public static String encodePassword(String password){
        return bCryptPasswordEncoder.encode(password);
    }
    public static void main(String[] args) {
        String password = "123";
        String pwd = encodePassword(password);
        System.out.println(pwd);
        //$2a$10$UiPMyA4fZ0GukBgN8nyULenqHPhBgtHSCjj3Zob34CZBWHvZcTMRG
    }
}
