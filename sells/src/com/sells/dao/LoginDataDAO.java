package com.sells.dao;

import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Data access object (DAO) for domain model class LoginData.
 * 
 * @see com.sells.dao.LoginData
 * @author MyEclipse - Hibernate Tools
 */
public class LoginDataDAO extends HibernateDaoSupport {
  private static final Log log = LogFactory.getLog(LoginDataDAO.class);
  // property constants
  public static final String LOGIN_ID = "loginId";
  public static final String PASSWD = "passwd";
  public static final String LOGIN_TP = "loginTp";

  protected void initDao() {
    // do nothing
  }

  public void save(LoginData transientInstance) {
    log.debug("saving LoginData instance");
    try {
      getHibernateTemplate().save(transientInstance);
      log.debug("save successful");
    } catch (RuntimeException re) {
      log.error("save failed", re);
      throw re;
    }
  }

  public void update(LoginData transientInstance) {
    log.debug("saving LoginData instance");
    try {
      getHibernateTemplate().update(transientInstance);
      log.debug("save successful");
    } catch (RuntimeException re) {
      log.error("save failed", re);
      throw re;
    }
  }

  public void delete(LoginData persistentInstance) {
    log.debug("deleting LoginData instance");
    try {
      getHibernateTemplate().delete(persistentInstance);
      log.debug("delete successful");
    } catch (RuntimeException re) {
      log.error("delete failed", re);
      throw re;
    }
  }

  public LoginData findById(java.lang.String id) {
    log.debug("getting LoginData instance with id: " + id);
    try {
      LoginData instance = (LoginData) getHibernateTemplate().get(
          "com.sells.dao.LoginData", id);
      return instance;
    } catch (RuntimeException re) {
      log.error("get failed", re);
      throw re;
    }
  }

  public List findByExample(LoginData instance) {
    log.debug("finding LoginData instance by example");
    try {
      List results = getSession().createCriteria("com.sells.dao.LoginData")
          .add(Example.create(instance)).list();
      log.debug("find by example successful, result size: " + results.size());
      return results;
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public List findByProperty(String propertyName, Object value) {
    log.debug("finding LoginData instance with property: " + propertyName
        + ", value: " + value);
    try {
      String queryString = "from LoginData as model where model."
          + propertyName + "= ?";
      return getHibernateTemplate().find(queryString, value);
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      throw re;
    }
  }

  public LoginData findLoginDataById(final String loginId, final String loginTp)
      throws Exception {
    StringBuffer sb = new StringBuffer();
    sb.append("FROM LoginData A where loginTp = :loginTp AND A.loginId = :loginId");
    Query query = getSession().createQuery(sb.toString());
    query.setString("loginTp", loginTp);
    query.setString("loginId", loginId);
    sb.setLength(0);
    sb = null;
    List list = query.list();
    if (list != null) {
      Iterator lIterator = list.iterator();
      LoginData vo = null;
      if (lIterator.hasNext()) {
        vo = (LoginData) lIterator.next();
      }
      return vo;
    } else {
      return null;
    }
  }

  public List findByLoginId(Object loginId) {
    return findByProperty(LOGIN_ID, loginId);
  }

  public List findByPasswd(Object passwd) {
    return findByProperty(PASSWD, passwd);
  }

  public List findByLoginTp(Object loginTp) {
    return findByProperty(LOGIN_TP, loginTp);
  }

  public LoginData merge(LoginData detachedInstance) {
    log.debug("merging LoginData instance");
    try {
      LoginData result = (LoginData) getHibernateTemplate().merge(
          detachedInstance);
      log.debug("merge successful");
      return result;
    } catch (RuntimeException re) {
      log.error("merge failed", re);
      throw re;
    }
  }

  public void attachDirty(LoginData instance) {
    log.debug("attaching dirty LoginData instance");
    try {
      getHibernateTemplate().saveOrUpdate(instance);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public void attachClean(LoginData instance) {
    log.debug("attaching clean LoginData instance");
    try {
      getHibernateTemplate().lock(instance, LockMode.NONE);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public static LoginDataDAO getFromApplicationContext(ApplicationContext ctx) {
    return (LoginDataDAO) ctx.getBean("LoginDataDAO");
  }
}