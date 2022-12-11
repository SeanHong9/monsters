package com.example.demo.service.impl;

import com.example.demo.bean.DiaryBean;
import com.example.demo.dao.DiaryDAO;
import com.example.demo.entity.Diary;
import com.example.demo.service.DiaryService;
import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class DiaryServiceImpl extends BaseServiceImplement<DiaryDAO, Diary, DiaryBean> implements DiaryService {

    @Autowired
    private final DiaryDAO diaryDAO;

    public DiaryServiceImpl(DiaryDAO baseDAO) {
        super(baseDAO);
        this.diaryDAO = baseDAO;
    }

    @Transactional
    @Override
    public DiaryBean createAndReturnBean(DiaryBean bean) {
        Diary diary = createVO(bean);
        diary.setTime(LocalDateTime.now());
        System.out.println(diary);
        diaryDAO.insert(diary);
        bean = createBean(diary);
        return bean;
    }

    @Override
    public List<DiaryBean> searchAnnoyanceByAccount(String account) {
        List<Diary> userList = diaryDAO.findByAccount(account);
        List<DiaryBean> diaryBeanList = new ArrayList<>();
        for (Diary diary : userList) {
            diaryBeanList.add(createBean(diary));
        }
        return diaryBeanList;
    }


    @Override
    public List<DiaryBean> searchAnnoyanceByShare() {
        List<Diary> userList = diaryDAO.findByShare();
        List<DiaryBean> diaryBeanList = new ArrayList<>();
        for (Diary diary : userList) {
            diaryBeanList.add(createBean(diary));
        }
        return diaryBeanList;
    }


    public List<DiaryBean> searchAnnoyanceByShareByAccount(String account) {
        List<Diary> userList = diaryDAO.findByShareByAccount(account);
        List<DiaryBean> diaryBeanList = new ArrayList<>();
        for (Diary diary : userList) {
            diaryBeanList.add(createBean(diary));
        }
        return diaryBeanList;
    }

    @Override
    public void updateDiary(Integer id, String account, DiaryBean diaryBean) throws NotFoundException {
        Optional<Diary> diaryOptional = diaryDAO.findByIdAndAccount(id, account);
        if (diaryOptional.isPresent()) {
            Diary diary = diaryOptional.get();
            diaryBean.setMonsterId(diary.getMonsterId());
            copy(diaryBean, diary);
            diaryDAO.update(diary);
        } else {
            throw new NotFoundException("該帳號 : " + account + "找不到此日記 : " + id);
        }
    }

    @Override
    protected Diary createVO(DiaryBean bean) {
        Diary entity = new Diary();
        entity.setId(bean.getId());
        entity.setAccount(bean.getAccount());
        entity.setContent(bean.getContent());
        entity.setImageContent(bean.getImageContent());
        entity.setAudioContent(bean.getAudioContent());
        entity.setMonsterId(bean.getMonsterId());
        entity.setMood(bean.getMood());
        entity.setIndex(bean.getIndex());
        entity.setTime(bean.getTime());
        entity.setShare(bean.getShare());
        return entity;
    }

    @Override
    protected DiaryBean createBean(Diary entity) {
        DiaryBean bean = new DiaryBean();
        bean.setId(entity.getId());
        bean.setAccount(entity.getAccount());
        bean.setContent(entity.getContent());
        bean.setImageContent(entity.getImageContent());
        bean.setAudioContent(entity.getAudioContent());
        bean.setMonsterId(entity.getMonsterId());
        bean.setMood(entity.getMood());
        bean.setIndex(entity.getIndex());
        bean.setTime(entity.getTime());
        bean.setShare(entity.getShare());
        return bean;
    }
}
