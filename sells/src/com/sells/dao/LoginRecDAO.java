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
 * Data access object (DAO) for domain model class LoginRec.
 * @see com.sells.dao.LoginRec
 * @author MyEclipse - Hibernate Tools
 */
public class LoginRecDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(LoginRecDAO.class);

	//property constants
	public static final String SELLS_NO = "sellsNo";
	public static final String LOGIN_IP = "loginIp";

	protected void initDao() {
		//do nothing
	}
    
    public void save(LoginRec transientInstance) {
        log.debug("saving LoginRec instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(LoginRec persistentInstance) {
        log.debug("deleting LoginRec instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public LoginRec findById( java.lang.Integer id) {
        log.debug("getting LoginRec instance with id: " + id);
        try {
            LoginRec instance = (LoginRec) getHibernateTemplate()
                    .get("com.sells.dao.LoginRec", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(LoginRec instance) {
        log.debug("finding LoginRec instance by example");
        try {
            List results = getSession()
                    .createCriteria("com.sells.dao.LoginRec")
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
      log.debug("finding LoginRec instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from LoginRec as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findBySellsNo(Object sellsNo) {
		return findByProperty(SELLS_NO, sellsNo);
	}
	
	public List findByLoginIp(Object loginIp) {
		return findByProperty(LOGIN_IP, loginIp);
	}
	
    public LoginRec merge(LoginRec detachedInstance) {
        log.debug("merging LoginRec instance");
        try {
            LoginRec result = (LoginRec) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(LoginRec instance) {
        log.debug("attaching dirty LoginRec instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(LoginRec instance) {
        log.debug("attaching clean LoginRec instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static LoginRecDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (LoginRecDAO) ctx.getBean("LoginRecDAO");
	}
}