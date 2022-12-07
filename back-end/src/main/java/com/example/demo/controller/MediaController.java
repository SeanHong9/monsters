package com.example.demo.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
//can use base64
@RestController
@RequestMapping("/data")
public class MediaController {
    @GetMapping("/{id}")
    public void getData(@PathVariable String id, HttpServletResponse response) throws IOException {
        final String MONSTER_FILE = "D:/APPS/FORK/monsters/back-end/file/test/";
        File file = new File(MONSTER_FILE+"annoyance/Lin/"+"file.txt");
        byte[] data =  Files.readAllBytes(file.toPath());
        String dataString = new String(data, StandardCharsets.UTF_8);

        response.setContentType("text/plain");
        
        response.setCharacterEncoding("UTF-8");

        InputStream inputStream = new ByteArrayInputStream(dataString.getBytes(StandardCharsets.UTF_8));
        IOUtils.copy(inputStream, response.getOutputStream());
    }

}
