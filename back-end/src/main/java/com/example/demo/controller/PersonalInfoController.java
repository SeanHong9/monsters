package com.example.demo.controller;

import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.bean.AnswerBookBean;
import com.example.demo.bean.DiaryBean;
import com.example.demo.bean.PersonalInfoBean;
import com.example.demo.service.PersonalInfoService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/member")
public class PersonalInfoController {
    private final PersonalInfoService personalInfoService;
    private final PasswordEncoder passwordEncoder;

    @ResponseBody
    @PostMapping(value = "/create")
    public ResponseEntity register(@RequestBody PersonalInfoBean personalInfoBean) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            personalInfoService.createAndReturnBean(personalInfoBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("result", true);
        result.put("errorCode", "200");
        result.put("message", "新增成功");
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @PostMapping(value = "/login")
    public ResponseEntity login(@RequestBody PersonalInfoBean personalInfoBean){
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        try {
            Optional<PersonalInfoBean> personalInfoBeanOptional = personalInfoService.getByPK(personalInfoBean.getAccount());
            PersonalInfoBean local = personalInfoBeanOptional.get();
            if(passwordEncoder.matches(personalInfoBean.getPassword(), local.getPassword())){
                result.put("account", local.getAccount());
                result.put("birthday", local.getBirthday().toString());
                result.put("mail",local.getMail());
                result.put("nickName", local.getNickName());
                result.put("lock",local.getPhoto());
                result.put("photo",local.getPhoto());
                result.put("dailyTest", local.getDailyTest());
            }
            result.put("result", true);
            result.put("errorCode", "");
            result.put("message", "登入成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
    @ResponseBody
    @GetMapping(path = "/{account}", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchPersonalInfoByAccount(@PathVariable(name = "account") String account) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<PersonalInfoBean> personalInfoList = personalInfoService.searchPersonalInfoByAccount(account);
            ObjectNode personalInfoNode = dataNode.addObject();
            for (PersonalInfoBean personalInfoBean : personalInfoList) {
                ObjectNode annoyanceNode = dataNode.addObject();
                personalInfoNode.put("nick_name",personalInfoBean.getNickName());
                personalInfoNode.put("birthday",personalInfoBean.getBirthday().toString());
                personalInfoNode.put("mail",personalInfoBean.getMail());
                result.put("result", true);
                result.put("errorCode", "200");
                result.put("message", "查詢成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }


}
