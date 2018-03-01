package com.loading.neo4j.service;

import com.loading.neo4j.dao.BasicNodeDao;
import com.loading.neo4j.dao.BasicRelationDao;
import com.loading.neo4j.entity.Basic.BasicNode;
import com.loading.neo4j.entity.Basic.BasicRelation;
import com.loading.neo4j.entity.Company;
import com.loading.neo4j.entity.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * desc:
 * Created on 2017/10/10.
 *
 * @author Lo_ading
 * @version 1.0.0
 * @since 1.0.0
 */
@Service
@Transactional
public class GraphService {

    @Autowired
    private BasicNodeDao<BasicNode> basicNodeDao;

    @Autowired
    private BasicRelationDao relationDao;
    
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public <T extends BasicNode> T saveNode(T node){
        basicNodeDao.save(node);
        return node;
    }
    
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public <T extends BasicRelation> T saveRelation(T relation){
        relationDao.save(relation);
        return relation;
    }
    
    //@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public void delete(long id) throws Exception{
        basicNodeDao.delete(id);
        if(1<2) {
        	throw new Exception("test exception");
        }
    }

}
