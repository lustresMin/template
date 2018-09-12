package com.own.template.file;

import java.io.File;

public class FoldersCreat {

    public static File creating(String filePath){
        File targetFile = new File(filePath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        return targetFile;
    }
}
