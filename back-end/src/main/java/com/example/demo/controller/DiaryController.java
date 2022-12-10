package com.example.demo.controller;

import com.example.demo.bean.AllMonsterBean;
import com.example.demo.bean.DiaryBean;
import com.example.demo.bean.PersonalMonsterBean;
import com.example.demo.bean.PersonalMonsterUseBean;
import com.example.demo.service.impl.AllMonsterServiceImpl;
import com.example.demo.service.impl.DiaryServiceImpl;
import com.example.demo.service.impl.PersonalMonsterServiceImpl;
import com.example.demo.service.impl.PersonalMonsterUseServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
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
    private final PersonalMonsterUseServiceImpl personalMonsterUseService;
    private final String CONTENT_FILE = "D:/monsters/back-end/file/diary/";

    @ResponseBody
    @PostMapping("/create")
    public ResponseEntity createDiary(@RequestBody DiaryBean diarybean) {
        int index = 0;
        int probability=0;
        boolean isAddMonster = true;
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
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
                    // 抽1~100為機率
                    probability = (int) (Math.random() * 100);
                    index = (int) (Math.random() * 20);
                    if(probability<50){
                        index = (int) (Math.random() * 10);
                    }else if (probability<85){
                        index = (int) (Math.random() * 5)+10;
                    }else{
                        index = (int) (Math.random() * 5)+15;
                    }
                    index*=4;
                    
                    while (allMonster.get(index).getMain() != 1) {
                        index = (int) (Math.random() * 20);
                        if(probability<50){
                            index = (int) (Math.random() * 10);
                        }else if (probability<85){
                            index = (int) (Math.random() * 5)+10;
                        }else{
                            index = (int) (Math.random() * 5)+15;
                        }
                        index*=4;
                    }
                    diarybean.setMonsterId(allMonster.get(index).getId());
                    diaryService.createAndReturnBean(diarybean);
                    PersonalMonsterBean personalMonsterBean = new PersonalMonsterBean();
                    PersonalMonsterUseBean personalMonsterUseBean = new PersonalMonsterUseBean();
                    List<PersonalMonsterBean> personalMonsterList = personalMonsterService.findByAccount(diarybean.getAccount());
                    for (PersonalMonsterBean personalMonster : personalMonsterList) {
                        System.out.println(personalMonster.getMonsterId() + "/" + allMonster.get(index).getGroup());
                        if (personalMonster.getMonsterId().equals(allMonster.get(index).getGroup())) {
                            isAddMonster = false;
                            break;
                        }
                    }
                    System.out.println(isAddMonster);
                    if(isAddMonster){
                        personalMonsterBean.setAccount(diarybean.getAccount());
                        personalMonsterBean.setMonsterId(allMonster.get(index).getId());
                        personalMonsterBean.setMonsterGroup(allMonster.get(index).getGroup());
                        personalMonsterUseBean.setAccount(diarybean.getAccount());
                        personalMonsterUseBean.setMonsterGroup(allMonster.get(index).getGroup());
                        personalMonsterUseBean.setUse(0);
                        ObjectNode personalMonsterNode = dataNode.addObject();
                        personalMonsterNode.put("newMonster", true);
                        personalMonsterNode.put("use", personalMonsterUseBean.getUse());
                        personalMonsterNode.put("newMonsterId", allMonster.get(index).getGroup());
                        personalMonsterService.createAndReturnBean(personalMonsterBean);
                        personalMonsterUseService.createAndReturnBean(personalMonsterUseBean);
                    }else {
                        personalMonsterUseBean.setAccount(diarybean.getAccount());
                        personalMonsterUseBean.setMonsterGroup(allMonster.get(index).getGroup());
                        personalMonsterUseBean.setUse(0);
                        ObjectNode personalMonsterNode = dataNode.addObject();
                        personalMonsterNode.put("newMonster", false);
                        personalMonsterNode.put("use", personalMonsterUseBean.getUse());
                        personalMonsterNode.put("newMonsterId", allMonster.get(index).getGroup());
                        personalMonsterUseService.createAndReturnBean(personalMonsterUseBean);
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
    @PatchMapping("/modify/{id}/{account}")
    public ResponseEntity modifyAnnoyance(@PathVariable(name = "id") int id,@PathVariable(name = "account") String account,@RequestBody DiaryBean diaryBean){
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        diaryService.update(id, diaryBean);
        result.put("result", true) ;
        result.put("errorCode", "200");
        result.put("message", "修改成功");
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
}
