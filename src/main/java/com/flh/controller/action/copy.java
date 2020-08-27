package com.flh.controller.action;

import java.io.FileInputStream;
import java.io.FileOutputStream;

public class copy {
    public static void main(String[] args) throws  Exception{
        FileInputStream fileInputStream=new FileInputStream("C:\\20101101.jpg");
        FileOutputStream fileOutputStream=new FileOutputStream("C:\\2010/11/01.jpg");
        byte[] bytes=new byte[fileInputStream.available()];
        int num=fileInputStream.read(bytes);
        while (num!=1){
            fileOutputStream.write(bytes,0,num);
            fileOutputStream.flush();
            num=fileInputStream.read(bytes);
        }
        System.out.println("成功！");
        fileInputStream.close();
        fileOutputStream.close();
    }
}
