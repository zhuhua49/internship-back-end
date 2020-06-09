package com.springboot.internship.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@RestController
public class fileController {
    @PostMapping("/upload")
    public boolean upload(@RequestParam("file") MultipartFile file, @RequestParam("filename") String filename, @RequestParam("folder") String folder) {
        String filePath = "D:\\IDEA\\workspace\\internship\\fileBase\\" + folder + "\\";
        File dest = new File(filePath + filename);
        try {
            file.transferTo(dest);
            return true;
        } catch (IOException e) {
            return false;
        }
    }
}
