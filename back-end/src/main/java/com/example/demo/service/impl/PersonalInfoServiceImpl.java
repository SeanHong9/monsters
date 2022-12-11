package com.example.demo.service.impl;

import com.example.demo.bean.PersonalInfoBean;
import com.example.demo.dao.AllMonsterDAO;
import com.example.demo.dao.PersonalInfoDAO;
import com.example.demo.dao.PersonalMonsterDAO;
import com.example.demo.entity.AllMonster;
import com.example.demo.entity.PersonalInfo;
import com.example.demo.service.PersonalInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PersonalInfoServiceImpl extends BaseServiceImplement<PersonalInfoDAO, PersonalInfo, PersonalInfoBean> implements PersonalInfoService {
    @Autowired
    private final PersonalInfoDAO personalInfoDAO;
    private final AllMonsterDAO allMonsterDAO;
    private final PersonalMonsterDAO personalMonsterDAO;
    private final PasswordEncoder passwordEncoder;

    public PersonalInfoServiceImpl(PersonalInfoDAO personalInfoDAO, AllMonsterDAO allMonsterDAO, PersonalMonsterDAO personalMonsterDAO, PasswordEncoder passwordEncoder) {
        super(personalInfoDAO);
        this.personalInfoDAO = personalInfoDAO;
        this.allMonsterDAO = allMonsterDAO;
        this.personalMonsterDAO = personalMonsterDAO;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional
    @Override
    public PersonalInfoBean createAndReturnBean(PersonalInfoBean bean) {
        PersonalInfo personalInfo = createVO(bean);
        personalInfo.setPassword(passwordEncoder.encode(bean.getPassword()));
        personalInfoDAO.insert(personalInfo);
        bean = createBean(personalInfo);
        return bean;
    }

    @Override
    public List<PersonalInfoBean> searchPersonalInfoByAccount(String account) {
        List<PersonalInfo> userList = personalInfoDAO.findByAccount(account);
        List<PersonalInfoBean> personalInfoBeanList = new ArrayList<>();
        for (PersonalInfo personalInfo : userList) {
            personalInfoBeanList.add(createBean(personalInfo));
        }
        return personalInfoBeanList;
    }


    @Override
    public void updateDailyTest(String account) {
        int index = 0;
        Optional<PersonalInfo> personalInfoOptional = personalInfoDAO.getByPK(account);
        if (personalInfoOptional.isPresent()) {
            PersonalInfo personalInfo = personalInfoOptional.get();
            personalInfo.setDailyTest(personalInfoOptional.get().getDailyTest() + 1);
            if (personalInfo.getDailyTest() == 7) {
                personalInfo.setDailyTest(0);
                List<AllMonster> allMonsterList = allMonsterDAO.searchAll();
                index = (int) Math.random() * allMonsterList.size();
                personalMonsterDAO.findMonsterIdByMonsterGroupByAccount(account, allMonsterList.get(index).getGroup());
            }
            personalInfoDAO.update(personalInfo);
            createBean(personalInfo);
        }
    }

    @Override
    public void updateInformation(String account, PersonalInfoBean personalInfoBean) {
        Optional<PersonalInfo> personalInfoOptional = personalInfoDAO.getByPK(account);
        if (personalInfoOptional.isPresent()) {
            PersonalInfo personalInfo = personalInfoOptional.get();
            if (personalInfoBean.getPhoto() == null) {
                personalInfoBean.setPhoto(personalInfo.getPhoto());
            }
            if (personalInfoBean.getPassword() != null) {
                personalInfoBean.setPassword(passwordEncoder.encode(personalInfoBean.getPassword()));
            }
            System.out.println(personalInfoBean);
            copy(personalInfoBean, personalInfo);
        }
    }

    @Override
    protected PersonalInfo createVO(PersonalInfoBean bean) {
        PersonalInfo entity = new PersonalInfo();
        entity.setAccount(bean.getAccount());
        entity.setPassword(bean.getPassword());
        entity.setBirthday(bean.getBirthday());
        entity.setNickName(bean.getNickName());
        entity.setMail(bean.getMail());
        entity.setLock(bean.getLock());
        entity.setPhoto(bean.getPhoto());
        entity.setDailyTest(bean.getDailyTest());
        return entity;
    }

    @Override
    protected PersonalInfoBean createBean(PersonalInfo entity) {
        PersonalInfoBean bean = new PersonalInfoBean();
        bean.setAccount(entity.getAccount());
        bean.setPassword(entity.getPassword());
        bean.setBirthday(entity.getBirthday());
        bean.setNickName(entity.getNickName());
        bean.setMail(entity.getMail());
        bean.setLock(entity.getLock());
        bean.setPhoto(entity.getPhoto());
        bean.setDailyTest(entity.getDailyTest());
        return bean;
    }
}
