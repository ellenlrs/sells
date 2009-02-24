package com.sells.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.criterion.Example;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Data access object (DAO) for domain model class SellsRec.
 * @see com.sells.dao.SellsRec
 * @author MyEclipse - Hibernate Tools
 */
public class SellsRecDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(SellsRecDAO.class);

	//property constants
	public static final String PAY_ACCOUNT = "payAccount";
	public static final String PAY_DATE = "payDate";

	protected void initDao() {
		//do nothing
	}
    
    public void save(SellsRec transientInstance) {
        log.debug("saving SellsRec instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(SellsRec persistentInstance) {
        log.debug("deleting SellsRec instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public SellsRec findById( java.lang.String id) {
        log.debug("getting SellsRec instance with id: " + id);
        try {
            SellsRec instance = (SellsRec) getHibernateTemplate()
                    .get("com.sells.dao.SellsRec", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(SellsRec instance) {
        log.debug("finding SellsRec instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.sells.dao.SellsRec")
                    .add(Example.create(instance))
            .list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding SellsRec instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from SellsRec as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByPayAccount(Object payAccount) {
		return findByProperty(PAY_ACCOUNT, payAccount);
	}
	
	public List findByPayDate(Object payDate) {
		return findByProperty(PAY_DATE, payDate);
	}
	
    public SellsRec merge(SellsRec detachedInstance) {
        log.debug("merging SellsRec instance");
        try {
            SellsRec result = (SellsRec) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(SellsRec instance) {
        log.debug("attaching dirty SellsRec instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(SellsRec instance) {
        log.debug("attaching clean SellsRec instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static SellsRecDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (SellsRecDAO) ctx.getBean("SellsRecDAO");
	}
}