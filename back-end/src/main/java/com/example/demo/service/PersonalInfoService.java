package com.example.demo.service;

import com.example.demo.bean.PersonalInfoBean;

public interface PersonalInfoService extends BaseService<PersonalInfoBean>{
    void dailyTest(String account, PersonalInfoBean personalInfoBean);
}
