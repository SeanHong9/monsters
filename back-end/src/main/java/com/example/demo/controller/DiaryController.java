package com.example.demo.controller;

import com.example.demo.bean.AllMonsterBean;
import com.example.demo.bean.DiaryBean;
import com.example.demo.bean.PersonalMonsterBean;
import com.example.demo.service.impl.AllMonsterServiceImpl;
import com.example.demo.service.impl.DiaryServiceImpl;
import com.example.demo.service.impl.PersonalMonsterServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/diary")
public class DiaryController {

    private final DiaryServiceImpl diaryService;
    private final AllMonsterServiceImpl allMonsterService;
    private final PersonalMonsterServiceImpl personalMonsterService;
    private final String CONTENT_FILE = "D:/monsters/back-end/file/diary/";

    @ResponseBody
    @PostMapping("/create")
    public ResponseEntity createDiary(@RequestBody DiaryBean diarybean) {
        int index = 0;
        boolean isAddMonster = true;
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            if (diarybean.getContent() == null && diarybean.getContent().isEmpty() && diarybean.getContentFile().isEmpty() && diarybean.getContentFile() == null) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                try {
                    if (diarybean.getContent() == null || diarybean.getContent().isEmpty()) {
                        byte[] contentBytes = diarybean.getContentFile().getBytes();
                        Path contentPath = Paths.get(CONTENT_FILE + LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMdd")) + diarybean.getContentFile().getOriginalFilename());
                        Files.write(contentPath, contentBytes);
                        diarybean.setContent(contentPath.toString());
                        System.out.println(diarybean.getContent());
                    }
                    List<AllMonsterBean> allMonster = allMonsterService.searchAll();
//                    index = (int) (Math.random() * 19);
                    index = (int) (Math.random() * 11);
                    while (allMonster.get(index).getMain() != 1) {
//                        index = (int) (Math.random() * 19);
                        index = (int) (Math.random() * 11);
                    }
                    diarybean.setMonsterId(allMonster.get(index).getId());
                    diaryService.createAndReturnBean(diarybean);
                    PersonalMonsterBean personalMonsterBean = new PersonalMonsterBean();
                    List<PersonalMonsterBean> personalMonsterList = personalMonsterService.findByAccount(diarybean.getAccount());
                    for (PersonalMonsterBean personalMonster : personalMonsterList) {
                        System.out.println(personalMonster.getMonsterId() + "/" + allMonster.get(index).getId());
                        if (personalMonster.getMonsterId().equals(allMonster.get(index).getId())) {
                            isAddMonster = false;
                            break;
                        }
                    }
                    System.out.println(isAddMonster);
                    if(isAddMonster){
                        personalMonsterBean.setAccount(diarybean.getAccount());
                        personalMonsterBean.setMonsterId(allMonster.get(index).getId());
                        personalMonsterBean.setMonsterGroup(allMonster.get(index).getGroup());
                        personalMonsterService.createAndReturnBean(personalMonsterBean);
                    }
                    result.put("result", true);
                    result.put("errorCode", "200");
                    result.put("message", "新增成功");
                } catch (IOException e) {
                    System.out.println(e);
                    result.put("result", false);
                    result.put("errorCode", "");
                    result.put("message", "新增失敗");
                }
            }
        } catch (Exception e) {
            result.put("result", false);
            result.put("errorCode", "");
            result.put("message", "新增失敗");
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @PatchMapping("/modify/{id}")
    public ResponseEntity modifyAnnoyance(@PathVariable(name = "id") int id,@RequestBody DiaryBean diaryBean){
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        diaryService.update(id, diaryBean);
        result.put("result", true) ;
        result.put("errorCode", "200");
        result.put("message", "修改成功");
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
}
