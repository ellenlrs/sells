package com.sells.dao;

import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Data access object (DAO) for domain model class OrdersMsg.
 * 
 * @see com.sells.dao.OrdersMsg
 * @author MyEclipse - Hibernate Tools
 */
public class OrdersMsgDAO extends HibernateDaoSupport {
  private static final Log log = LogFactory.getLog(OrdersMsgDAO.class);
  // property constants
  public static final String MESSAGE = "message";
  public static final String MESS_ST = "messSt";
  public static final String MESS_NAME = "messName";

  protected void initDao() {
    // do nothing
  }

  public void save(OrdersMsg transientInstance) {
    log.debug("saving OrdersMsg instance");
    try {
      getHibernateTemplate().save(transientInstance);
      log.debug("save successful");
    } catch (RuntimeException re) {
      log.error("save failed", re);
      throw re;
    }
  }

  public void update(OrdersMsg transientInstance) {
    log.debug("update OrdersMsg instance");
    try {
      getHibernateTemplate().update(transientInstance);
      log.debug("update successful");
    } catch (RuntimeException re) {
      log.error("update failed", re);
      throw re;
    }
  }

  public void delete(OrdersMsg persistentInstance) {
    log.debug("deleting OrdersMsg instance");
    try {
      getHibernateTemplate().delete(persistentInstance);
      log.debug("delete successful");
    } catch (RuntimeException re) {
      log.error("delete failed", re);
      throw re;
    }
  }

  public OrdersMsg findById(com.sells.dao.OrdersMsgId id) {
    log.debug("getting OrdersMsg instance with id: " + id);
    try {
      OrdersMsg instance = (OrdersMsg) getHibernateTemplate().get(
          "com.sells.dao.OrdersMsg", id);
      return instance;
    } catch (RuntimeException re) {
      log.error("get failed", re);
      throw re;
    }
  }

  public List findByExample(OrdersMsg instance) {
    log.debug("finding OrdersMsg instance by example");
    try {
      List results = getHibernateTemplate().findByExample(instance);
      log.debug("find by example successful, result size: " + results.size());
      return results;
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public List findByProperty(String propertyName, Object value) {
    log.debug("finding OrdersMsg instance with property: " + propertyName
        + ", value: " + value);
    try {
      String queryString = "from OrdersMsg as model where model."
          + propertyName + "= ?";
      return getHibernateTemplate().find(queryString, value);
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      throw re;
    }
  }

  public List findBySt(String orderNo, String st) {
    log.debug("finding OrdersMsg instance with st");
    try {
      StringBuffer sql = new StringBuffer();
      sql.append("from OrdersMsg as model where 1=1 ");
      if (StringUtils.isNotBlank(st)) {
        sql.append("AND model.messSt = '").append(st).append("' ");
      }
      sql.append("AND model.id.orderNo = '").append(orderNo).append("' order by model.id.seq desc");
      return getHibernateTemplate().find(sql.toString());
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      throw re;
    }
  }

  public int findMaxSeq(String orderNo) {
    int seqno = 1;
    StringBuffer sb = new StringBuffer();
    sb.append(" select max(vo.id.seq) from ");
    sb.append(" OrdersMsg vo ");
    sb.append(" where vo.id.orderNo = '").append(orderNo).append("' ");
    try {
      Object ireturn = (Object) getHibernateTemplate().find(sb.toString()).get(
          0);
      if (ireturn != null) {
        seqno = Integer.parseInt(ireturn.toString()) + 1;
      }
    } catch (Exception e) {
      log.error(e.toString());
    }
    return seqno;
  }

  public List findByMessage(Object message) {
    return findByProperty(MESSAGE, message);
  }

  public List findByMessSt(Object messSt) {
    return findByProperty(MESS_ST, messSt);
  }

  public List findByMessName(Object messName) {
    return findByProperty(MESS_NAME, messName);
  }

  public OrdersMsg merge(OrdersMsg detachedInstance) {
    log.debug("merging OrdersMsg instance");
    try {
      OrdersMsg result = (OrdersMsg) getHibernateTemplate().merge(
          detachedInstance);
      log.debug("merge successful");
      return result;
    } catch (RuntimeException re) {
      log.error("merge failed", re);
      throw re;
    }
  }

  public void attachDirty(OrdersMsg instance) {
    log.debug("attaching dirty OrdersMsg instance");
    try {
      getHibernateTemplate().saveOrUpdate(instance);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public void attachClean(OrdersMsg instance) {
    log.debug("attaching clean OrdersMsg instance");
    try {
      getHibernateTemplate().lock(instance, LockMode.NONE);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public static OrdersMsgDAO getFromApplicationContext(ApplicationContext ctx) {
    return (OrdersMsgDAO) ctx.getBean("OrdersMsgDAO");
  }
}