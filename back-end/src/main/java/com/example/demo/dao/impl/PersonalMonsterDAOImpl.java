package com.example.demo.dao.impl;

import com.example.demo.dao.PersonalMonsterDAO;
import com.example.demo.entity.Annoyance;
import com.example.demo.entity.PersonalMonster;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PersonalMonsterDAOImpl extends BaseDAOImplement<PersonalMonster> implements PersonalMonsterDAO {
    @Override
    public List<PersonalMonster> findMonsterIdByMonsterGroupByAccount(Integer monsterGroup, String account) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(PersonalMonster.class);
        detachedCriteria.add(Restrictions.eq("account", account));
        detachedCriteria.add(Restrictions.eq("monsterGroup", monsterGroup));
        return findByCriteria(detachedCriteria);
    }

    @Override
    public List<PersonalMonster> findByAccount(String account) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(PersonalMonster.class);
        detachedCriteria.add(Restrictions.eq("account", account));
        return findByCriteria(detachedCriteria);
    }

}
